From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 22 Feb 2006 13:10:43 +0000
Subject: [KJ][Patch] make init_error signed in synclink_gt.c
Message-Id: <1140613844.7778.17.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23228276445015705=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23228276445015705==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

I noticed struct member init_error was used as a signed value (to return
a -ve on error) but was an unsigned int.

examples of it's miss-use are

3112 info->init_error = -1; 

4440 if ((info->init_error = register_test(info)) < 0) {

The patch below converts it from an 'unsigned int', to a plain 'int'.
Patch is compile tested.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/drivers/char/synclink_gt.c.orig	2006-02-22 23:51:25.000000000 +1100
+++ linux-2.6.16-rc3/drivers/char/synclink_gt.c	2006-02-22 23:52:29.000000000 +1100
@@ -306,7 +306,7 @@ struct slgt_info {
 	int tx_active;
 
 	unsigned char signals;    /* serial signal states */
-	unsigned int init_error;  /* initialization error */
+	int init_error;  /* initialization error */
 
 	unsigned char *tx_buf;
 	int tx_count;



--===============23228276445015705==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23228276445015705==--
