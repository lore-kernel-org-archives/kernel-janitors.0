From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:51 +0000
Subject: [KJ] [PATCH][RESUBMIT][3/21] drivers/char/* - compile warning
Message-Id: <42113C2B.5752.52BA77@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52969206663436008=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52969206663436008==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - removed unused automatic variable

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/char/mxser.c linux-2.6.11-rc3-mm2/drivers/char/mxser.c
--- linux-2.6.11-rc3-mm2-original/drivers/char/mxser.c	2005-02-12 12:06:38.000000000 +0200
+++ linux-2.6.11-rc3-mm2/drivers/char/mxser.c	2005-02-12 14:12:09.000000000 +0200
@@ -548,7 +548,6 @@ static void process_txrx_fifo(struct mxs
 static int mxser_initbrd(int board, struct mxser_hwconf *hwconf)
 {
 	struct mxser_struct *info;
-	unsigned long flags;
 	int retval;
 	int i, n;
 




--===============52969206663436008==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52969206663436008==--
