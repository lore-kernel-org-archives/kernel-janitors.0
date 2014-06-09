From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:21:08 +0000
Subject: [patch] [media] cx18: remove duplicate CX18_ALSA_DBGFLG_WARN define
Message-Id: <20140609152108.GP9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, ivtv-devel@ivtvdriver.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The CX18_ALSA_DBGFLG_WARN is cut and pasted twice and we can delete the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/cx18/cx18-alsa.h b/drivers/media/pci/cx18/cx18-alsa.h
index 447da37..2718be2 100644
--- a/drivers/media/pci/cx18/cx18-alsa.h
+++ b/drivers/media/pci/cx18/cx18-alsa.h
@@ -49,7 +49,6 @@ static inline void snd_cx18_unlock(struct snd_cx18_card *cxsc)
 }
 
 #define CX18_ALSA_DBGFLG_WARN  (1 << 0)
-#define CX18_ALSA_DBGFLG_WARN  (1 << 0)
 #define CX18_ALSA_DBGFLG_INFO  (1 << 1)
 
 #define CX18_ALSA_DEBUG(x, type, fmt, args...) \
