From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Wed, 01 Mar 2006 07:53:11 +0000
Subject: [KJ][Patch] check request_region return value in ixj.c
Message-Id: <1141199591.7784.20.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43231969256002434=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43231969256002434==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

ixj.c calles request_region without checking the return value @ line
6805.

The patch below just alters the code so this request_region is handled
like the others. (This one looks like it was missed in a conversion
somewhere).

Alexey, if you want me to do a wrapper fn or macro for the 6 cases where
this is done almost the same, (perhaps making them return -EBUSY) yell
out.


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/telephony/ixj.c.orig	2006-03-01 18:13:37.000000000 +1100
+++ linux-2.6.16-rc5/drivers/telephony/ixj.c	2006-03-01 18:31:17.000000000 +1100
@@ -6802,7 +6802,11 @@ static int ixj_selfprobe(IXJ *j)
 			}
 		} else if (j->dsp.low == 0x22) {
 			j->cardtype = QTI_PHONEJACK_PCI;
-			request_region(j->XILINXbase, 4, "ixj control");
+			if (!request_region(j->XILINXbase, 4, "ixj control")) {
+				printk(KERN_WARNING "ixj : can't get I/O "
+					"address 0x%x\n", j->XILINXbase);
+				return -1;
+			}
 			j->pld_slicw.pcib.e1 = 1;
 			outb_p(j->pld_slicw.byte, j->XILINXbase);
 		} else



--===============43231969256002434==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43231969256002434==--
