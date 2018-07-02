From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 08:21:16 +0000
Subject: [PATCH] hpet: remove redundant pointer hpet
Message-Id: <20180702082116.13991-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer hpet is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'hpet' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/hpet.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index be426eb2a353..4a22b4b41aef 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -579,7 +579,6 @@ hpet_ioctl_common(struct hpet_dev *devp, unsigned int cmd, unsigned long arg,
 		  struct hpet_info *info)
 {
 	struct hpet_timer __iomem *timer;
-	struct hpet __iomem *hpet;
 	struct hpets *hpetp;
 	int err;
 	unsigned long v;
@@ -591,7 +590,6 @@ hpet_ioctl_common(struct hpet_dev *devp, unsigned int cmd, unsigned long arg,
 	case HPET_DPI:
 	case HPET_IRQFREQ:
 		timer = devp->hd_timer;
-		hpet = devp->hd_hpet;
 		hpetp = devp->hd_hpets;
 		break;
 	case HPET_IE_ON:
-- 
2.17.1

