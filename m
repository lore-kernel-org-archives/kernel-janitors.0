From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 13:51:58 +0000
Subject: [KJ] [PATCH] printk :
Message-Id: <20050323135158.GG9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wHh0aNzodMFDTGdO"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_char_ftape_compressor_zftape-compress.c.diff"

diff -urpN -X dontdiff a/drivers/char/ftape/compressor/zftape-compress.c b/drivers/char/ftape/compressor/zftape-compress.c
--- a/drivers/char/ftape/compressor/zftape-compress.c	2005-03-18 02:34:28.000000000 +0100
+++ b/drivers/char/ftape/compressor/zftape-compress.c	2005-03-22 16:56:30.000000000 +0100
@@ -1176,8 +1176,8 @@ KERN_INFO "Compressor for zftape (lzrw3 
         }
 #else /* !MODULE */
 	/* print a short no-nonsense boot message */
-	printk("zftape compressor v1.00a 970514\n");
-	printk("For use with " FTAPE_VERSION "\n");
+	printk(KERN_INFO "zftape compressor v1.00a 970514\n");
+	printk(KERN_INFO "For use with " FTAPE_VERSION "\n");
 #endif /* MODULE */
 	TRACE(ft_t_info, "zft_compressor_init @ 0x%p", zft_compressor_init);
 	TRACE(ft_t_info, "installing compressor for zftape ...");

--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--wHh0aNzodMFDTGdO--
