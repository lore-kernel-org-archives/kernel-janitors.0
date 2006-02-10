From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 12:58:19 +0000
Subject: [KJ][Patch] remove second masking instance of variable in firestream.c
Message-Id: <1139576299.17620.42.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40698015727379433=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============40698015727379433==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

Remark #1599: Declaration hides variable "variable name"

static void submit_qentry (struct fs_dev *dev, struct queue *q, struct FS_QENTRY *qe)

declares wp twice;

594:	"u32 wp;"
and
618:	"int rp, wp;"

This patch just re-names the second instance.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/drivers/atm/firestream.c.orig	2006-02-10 23:43:51.000000000 +1100
+++ linux-2.6.16-rc2/drivers/atm/firestream.c	2006-02-10 23:48:38.000000000 +1100
@@ -615,11 +615,11 @@ static void submit_qentry (struct fs_dev
 		static int c;
 		if (!(c++ % 100))
 			{
-				int rp, wp;
+				int rp, wptr;
 				rp =  read_fs (dev, Q_RP(q->offset));
-				wp =  read_fs (dev, Q_WP(q->offset));
+				wptr =  read_fs (dev, Q_WP(q->offset));
 				fs_dprintk (FS_DEBUG_TXQ, "q at %d: %x-%x: %x entries.\n", 
-					    q->offset, rp, wp, wp-rp);
+					    q->offset, rp, wptr, wptr-rp);
 			}
 	}
 }



--===============40698015727379433==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40698015727379433==--
