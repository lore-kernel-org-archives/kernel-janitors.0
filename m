From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 03 Oct 2010 17:22:48 +0000
Subject: [PATCH v2] staging: ft1000: fix kernel info leak to userland for statistics
Message-Id: <1286126569-20666-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Marek Belisko <marek.belisko@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

get_stat_data is not fully initialized before copy_to_user() call,
e.g. LedStat is not always set.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
index 65087ce..b666ae6 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_chdev.c
@@ -623,7 +623,7 @@ static int ft1000_ChIoctl (struct file *File, unsigned int Command,
         break;
     case IOCTL_GET_DSP_STAT_CMD:
         //DEBUG("FT1000:ft1000_ChIoctl: IOCTL_FT1000_GET_DSP_STAT called\n");
-
+	memset(&get_stat_data, 0, sizeof(get_stat_data));
         memcpy(get_stat_data.DspVer, info->DspVer, DSPVERSZ);
         memcpy(get_stat_data.HwSerNum, info->HwSerNum, HWSERNUMSZ);
         memcpy(get_stat_data.Sku, info->Sku, SKUSZ);
-- 
1.7.0.4

