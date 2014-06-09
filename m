From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jun 2014 15:21:35 +0000
Subject: [patch] [media] zoran: remove duplicate ZR050_MO_COMP define
Message-Id: <20140609152135.GQ9600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The ZR050_MO_COMP define is cut and pasted twice so we can delete the
second instance.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/zoran/zr36050.h b/drivers/media/pci/zoran/zr36050.h
index 9f52f0c..ea083ad 100644
--- a/drivers/media/pci/zoran/zr36050.h
+++ b/drivers/media/pci/zoran/zr36050.h
@@ -126,7 +126,6 @@ struct zr36050 {
 /* zr36050 mode register bits */
 
 #define ZR050_MO_COMP                0x80
-#define ZR050_MO_COMP                0x80
 #define ZR050_MO_ATP                 0x40
 #define ZR050_MO_PASS2               0x20
 #define ZR050_MO_TLM                 0x10
