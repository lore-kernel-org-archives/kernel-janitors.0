From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:11:02 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/3] video/radeonfb: remove
Message-Id: <20040927231102.GU1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2227800115762984=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234448.GH1777@us.ibm.com>
In-Reply-To: <20040916234448.GH1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============2227800115762984==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Remove custom macro MS_TO_HZ(). Will be replaced in *.c
files with msecs_to_jiffies().

--- 2.6.9-rc2-vanilla/drivers/video/aty/radeonfb.h	2004-09-13 17:15:37.000000000 -0700
+++ 2.6.9-rc2/drivers/video/aty/radeonfb.h	2004-09-14 14:14:09.000000000 -0700
@@ -425,8 +425,6 @@ static inline u32 _INPLL(struct radeonfb
 		spin_unlock_irqrestore(&rinfo->reg_lock, flags); 	\
 	} while (0)
 
-#define MS_TO_HZ(ms)       ((ms * HZ + 999) / 1000)
-
 #define BIOS_IN8(v)  	(readb(rinfo->bios_seg + (v)))
 #define BIOS_IN16(v) 	(readb(rinfo->bios_seg + (v)) | \
 			  (readb(rinfo->bios_seg + (v) + 1) << 8))

--===============2227800115762984==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2227800115762984==--
