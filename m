From: sebek64@post.cz (Marcel Sebek)
Date: Mon, 10 Jan 2005 18:02:06 +0000
Subject: Re: [KJ] [PATCH] radio-sf16fmi cleanup
Message-Id: <20050110180206.GA20020@penguin.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60311394121352757=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041219190530.GA9205@penguin.localdomain>
In-Reply-To: <20041219190530.GA9205@penguin.localdomain>
To: kernel-janitors@vger.kernel.org

--===============60311394121352757==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 10, 2005 at 02:27:44AM +0100, Domen Puncer wrote:
> Care to resend this chunk with removal from kernel-parameters.txt?
> 
> > -
> > -#ifndef MODULE
> > -static int __init fmi_setup_io(char *str)
> > -{
> > -	get_option(&str, &io);
> > -	return 1;
> > -}
> > -
> > -__setup("sf16fm=", fmi_setup_io);
> > -#endif

Signed-off-by: Marcel Sebek <sebek64@post.cz>

Index: linux-2.6.10-kj/Documentation/kernel-parameters.txt
===================================================================
--- linux-2.6.10-kj.orig/Documentation/kernel-parameters.txt	2005-01-10 18:25:09.000000000 +0100
+++ linux-2.6.10-kj/Documentation/kernel-parameters.txt	2005-01-10 18:51:46.603823832 +0100
@@ -1134,9 +1134,6 @@ running once the system is up.
 
 	serialnumber	[BUGS=IA-32]
 
-	sf16fm=		[HW] SF16FMI radio driver for Linux
-			Format: <io>
-
 	sg_def_reserved_size=
 			[SCSI]
  
Index: linux-2.6.10-kj/drivers/media/radio/radio-sf16fmi.c
===================================================================
--- linux-2.6.10-kj.orig/drivers/media/radio/radio-sf16fmi.c	2005-01-10 18:25:18.000000000 +0100
+++ linux-2.6.10-kj/drivers/media/radio/radio-sf16fmi.c	2005-01-10 18:56:33.919054420 +0100
@@ -326,13 +326,3 @@ static void __exit fmi_cleanup_module(vo
 
 module_init(fmi_init);
 module_exit(fmi_cleanup_module);
-
-#ifndef MODULE
-static int __init fmi_setup_io(char *str)
-{
-	get_option(&str, &io);
-	return 1;
-}
-
-__setup("sf16fm=", fmi_setup_io);
-#endif


--===============60311394121352757==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60311394121352757==--
