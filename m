From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:41:20 +0000
Subject: [PATCH 3/8] char: mwave: fix information leak to userland
Message-Id: <1287326481-7985-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org

Structure rAbilities is copied to userland with uart_enable, mwave_os_name
and bios_task_name array end elements and some padding fields unitialized.
It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/char/mwave/mwavedd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/mwave/mwavedd.c b/drivers/char/mwave/mwavedd.c
index 1d82d58..73b6880 100644
--- a/drivers/char/mwave/mwavedd.c
+++ b/drivers/char/mwave/mwavedd.c
@@ -165,6 +165,7 @@ static long mwave_ioctl(struct file *file, unsigned int iocmd,
 				"mwavedd::mwave_ioctl,"
 				" IOCTL_MW_DSP_ABILITIES calling"
 				" tp3780I_QueryAbilities\n");
+			memset(&rAbilities, 0, sizeof(MW_ABILITIES));
 			mutex_lock(&mwave_mutex);
 			retval = tp3780I_QueryAbilities(&pDrvData->rBDData,
 					&rAbilities);
-- 
1.7.0.4

