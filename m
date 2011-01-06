From: Dan Carpenter <error27@gmail.com>
Date: Thu, 06 Jan 2011 19:41:00 +0000
Subject: [patch] [media] av7110: make array offset unsigned
Message-Id: <20110106194059.GC1717@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

In the CA_GET_SLOT_INFO ioctl, we only check whether "num" is too large,
but we don't check if it's negative.

drivers/media/dvb/ttpci/av7110_ca.c
   278		ca_slot_info_t *info=(ca_slot_info_t *)parg;
   279
   280		if (info->num > 1)
   281			return -EINVAL;
   282		av7110->ci_slot[info->num].num = info->num;

Let's just make it unsigned.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested.

diff --git a/include/linux/dvb/ca.h b/include/linux/dvb/ca.h
index c18537f..647015e 100644
--- a/include/linux/dvb/ca.h
+++ b/include/linux/dvb/ca.h
@@ -27,7 +27,7 @@
 /* slot interface types and info */
 
 typedef struct ca_slot_info {
-	int num;               /* slot number */
+	unsigned int num;      /* slot number */
 
 	int type;              /* CA interface this slot supports */
 #define CA_CI            1     /* CI high level interface */
