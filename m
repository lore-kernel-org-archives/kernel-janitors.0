From: Domen Puncer <domen@coderock.org>
Date: Tue, 16 Nov 2004 18:58:21 +0000
Subject: [KJ] [patch 1/2] net/via-rhine: module_param conversions
Message-Id: <20041116185821.GB8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34515861039323514=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34515861039323514==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert to new module parameter api.
Compile and run tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/net/via-rhine.c	2004-11-15 13:42:12.000000000 +0100
+++ a/drivers/net/via-rhine.c	2004-11-16 14:15:09.000000000 +0100
@@ -226,9 +226,9 @@ MODULE_AUTHOR("Donald Becker <becker@scy
 MODULE_DESCRIPTION("VIA Rhine PCI Fast Ethernet driver");
 MODULE_LICENSE("GPL");
 
-MODULE_PARM(max_interrupt_work, "i");
-MODULE_PARM(debug, "i");
-MODULE_PARM(rx_copybreak, "i");
+module_param(max_interrupt_work, int, 0);
+module_param(debug, int, 0644);
+module_param(rx_copybreak, int, 0);
 MODULE_PARM_DESC(max_interrupt_work, "VIA Rhine maximum events handled per interrupt");
 MODULE_PARM_DESC(debug, "VIA Rhine debug level (0-7)");
 MODULE_PARM_DESC(rx_copybreak, "VIA Rhine copy breakpoint for copy-only-tiny-frames");

--===============34515861039323514==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34515861039323514==--
