From: Domen Puncer <domen@coderock.org>
Date: Sat, 04 Jun 2005 15:06:03 +0000
Subject: [KJ] [patch] wireless: char* -> char[] conversion in airo.c
Message-Id: <20050604150603.GD9687@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14145001268120705=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14145001268120705==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This conversion makes code from line 7101 right:
	if (copy_to_user(com.data, swversion, sizeof(swversion)))

size output (before, after):
  55416    2228     160   57804    e1cc drivers/net/wireless/airo.o
  55412    2228     160   57800    e1c8 drivers/net/wireless/airo.o


Signed-off-by: Domen Puncer <domen@coderock.org>

diff -pruNX dontdiff c/drivers/net/wireless/airo.c a/drivers/net/wireless/airo.c
--- c/drivers/net/wireless/airo.c	2005-05-25 13:34:49.000000000 +0200
+++ a/drivers/net/wireless/airo.c	2005-06-04 15:49:10.000000000 +0200
@@ -900,7 +900,7 @@ typedef struct aironet_ioctl {
 	unsigned char __user *data;	// d-data
 } aironet_ioctl;
 
-static char *swversion = "2.1";
+static char swversion[] = "2.1";
 #endif /* CISCO_EXT */
 
 #define NUM_MODULES       2

--===============14145001268120705==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14145001268120705==--
