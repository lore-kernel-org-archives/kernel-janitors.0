From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:34:05 +0000
Subject: [KJ] [patch 6/8] ifdef typos: drivers_usb_net_usbnet.c
Message-Id: <20041124153405.GF14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26145870916705416=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26145870916705416==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Although neither symbol is not defined (yet?); code uses some
GENELINK_* (_ACK too), so this seems right.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/usb/net/usbnet.c	2004-11-15 13:42:17.000000000 +0100
+++ str2/drivers/usb/net/usbnet.c	2004-11-24 16:10:26.000000000 +0100
@@ -1298,7 +1298,7 @@ struct gl_header {
 	struct gl_packet	packets;
 };
 
-#ifdef	GENLINK_ACK
+#ifdef	GENELINK_ACK
 
 // FIXME:  this code is incomplete, not debugged; it doesn't
 // handle interrupts correctly.  interrupts should be generic

--===============26145870916705416==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26145870916705416==--
