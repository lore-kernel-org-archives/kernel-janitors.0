From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 17:51:05 +0000
Subject: [Kernel-janitors] [PATCH] video/radeonfb: remove MS_TO_HZ()
Message-Id: <20040728175105.GI1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73248407480696853=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73248407480696853==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Depends-on: Patch to radeon_base.c which replaces call to MS_TO_HZ()
with msecs_to_jiffies().

Description: Removes definition of MS_TO_HZ() in favor of
msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/video/aty/radeonfb.h	2004-06-15 22:20:27.000000000 -0700
+++ linux-dev/drivers/video/aty/radeonfb.h	2004-07-28 09:56:34.000000000 -0700
@@ -425,8 +425,6 @@ static inline u32 _INPLL(struct radeonfb
 		spin_unlock_irqrestore(&rinfo->reg_lock, flags); 	\
 	} while (0)
 
-#define MS_TO_HZ(ms)       ((ms * HZ + 999) / 1000)
-
 #define BIOS_IN8(v)  	(readb(rinfo->bios_seg + (v)))
 #define BIOS_IN16(v) 	(readb(rinfo->bios_seg + (v)) | \
 			  (readb(rinfo->bios_seg + (v) + 1) << 8))

--===============73248407480696853==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73248407480696853==--
