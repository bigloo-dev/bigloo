package bigloo;

import java.io.*;

public class output_port extends obj
{
   public OutputStream out;
   public byte[] name = "???".getBytes();
   public Object chook = bigloo.foreign.BUNSPEC;
   public Object fhook = bigloo.foreign.BUNSPEC;
   public Object flushbuf = bigloo.foreign.BUNSPEC;

   public output_port()
      {
	 out = null;
      }
   
   public output_port( final OutputStream stream )
      {
	 out = stream;
      }

   public output_port( final OutputStream stream, final byte[] _name )
      {
	 name = _name;
	 out = stream;
      }

   public output_port( final byte[] file )
      throws IOException
      {
	 // CARE JVM dependant ?!
	 this( new FileOutputStream( foreign.bigloo_strcmp( file, "null:".getBytes() )
				     ? (foreign.bigloo_strcmp( os.OS_CLASS, "unix".getBytes() )
					? "/dev/null"
					: "NUL:")
				     : new String( file ) ) );
	 // this( new BufferedOutputStream( new FileOutputStream( new String( file ) ) ) );
	 name = file;
      }

   public output_port( final byte[] file, final boolean append )
      throws IOException
      {
	 // CARE JVM dependant ?!
	 this( new FileOutputStream( new String( file ), append ) );
	 name= file;
      }

   public Object close()
      {
	 try
	 {
	    out.close();
	    if( chook instanceof procedure )
	    {
	       ((procedure)chook).funcall1(this);
	    }
	 }
	 catch (final Exception e)
	 {
	    if (out == null)
	       return bigloo.foreign.BUNSPEC;
	    else
	       foreign.fail( "close", e.getMessage(), this );
	 }

	 return this;
      }

   public Object flush()
      {
	 try
	 {
	    invoke_flush_hook( bigloo.foreign.BINT( 0 ) );
	    out.flush();
	    return bbool.vrai;
	 }
	 catch (final Exception e)
	 {
	    if (out != null)
	       foreign.fail( "flush", e.getMessage(), this );
	    return bbool.faux;
	 }
      }

   public Object bgl_output_port_seek( final int pos )
      throws IOException
      {
	 return bigloo.foreign.BFALSE;
      }

   protected void invoke_flush_hook( bigloo.bint size ) throws IOException {
      if( fhook instanceof procedure ) {
	 Object s = ((procedure)fhook).funcall2( this, size );

	 if( s instanceof byte[] ) {
	    out.write( (byte [])s, 0, ((byte [])s).length );
	 } else {
	    if( s instanceof bigloo.bint &&
		flushbuf instanceof byte[] &&
		bigloo.foreign.CINT( (bigloo.bint)s ) <= ((byte[])flushbuf).length &&
	       bigloo.foreign.CINT( (bigloo.bint)s ) > 0 )
	    {
	       out.write( (byte[])flushbuf,
			  0,
			  bigloo.foreign.CINT( (bigloo.bint)s ) );
	    }
	       
	 }
      }
   }
      
   public void write( final int cn )
      {
	 try
	 {
	    invoke_flush_hook( bigloo.foreign.BINT( 1 ) );
	    out.write( cn );
	 }
	 catch (final Exception e)
	 {
	    if (out != null)
	       foreign.fail( "write", e.getMessage(), this );
	 }
      }

   public void write( final byte[] s )
      {
	 try
	 {
	    invoke_flush_hook( bigloo.foreign.BINT( s.length ) );
	    out.write( s, 0, s.length );
	 }
	 catch (final Exception e)
	 {
	    if (out != null)
	       foreign.fail( "write", e.getMessage(), this );
	 }
      }

   public void write( final byte[] s, int offset, int len )
      {
	 try
	 {
	    invoke_flush_hook( bigloo.foreign.BINT( len - offset ) );
	    out.write( s, offset, (len - offset) );
	 }
	 catch (final Exception e)
	 {
	    if (out != null)
	       foreign.fail( "write", e.getMessage(), this );
	 }
      }

   public void write( final String s )
      {
	 try
	 {
	    final int len = s.length();

	    invoke_flush_hook( bigloo.foreign.BINT( len ) );
	 
	    for ( int i= 0 ;i < len ; ++i )
	       out.write( (byte)s.charAt( i ) );
	 }
	 catch (final Exception e)
	 {
	    if (out != null)
	       foreign.fail( "write", e.getMessage(), this );
	 }
      }

   public void write( final output_port p )
      {
	 p.write( "#<output_port:" + new String( name ) + ">" );
      }
}
