From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 23 Mar 2005 13:49:53 +0000
Subject: [KJ] [PATCH] printk : drivers/char/applicom.c
Message-Id: <20050323134953.GF9206@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="r5lq+205vWdkqwtk"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_char_applicom.c.diff"

diff -urpN -X dontdiff a/drivers/char/applicom.c b/drivers/char/applicom.c
--- a/drivers/char/applicom.c	2005-03-18 02:34:33.000000000 +0100
+++ b/drivers/char/applicom.c	2005-03-22 16:54:20.000000000 +0100
@@ -599,7 +599,7 @@ static ssize_t ac_read (struct file *fil
 
 #ifdef DEBUG
 		if (loopcount++ > 2) {
-			printk("Looping in ac_read. loopcount %d\n", loopcount);
+			printk(KERN_DEBUG "Looping in ac_read. loopcount %d\n", loopcount);
 		}
 #endif
 	} 

--r5lq+205vWdkqwtk
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--r5lq+205vWdkqwtk--
