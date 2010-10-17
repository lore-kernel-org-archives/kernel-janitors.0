From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:41:16 +0000
Subject: [PATCH 2/8] char: hpet: fix information leak to userland
Message-Id: <1287326477-7940-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Clemens Ladisch <clemens@ladisch.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

Structure info is copied to userland with some padding fields unitialized.
It leads to leaking of stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/char/hpet.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index a4eee32..f6722ef 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -581,6 +581,7 @@ hpet_ioctl_common(struct hpet_dev *devp, int cmd, unsigned long arg,
 		break;
 	case HPET_INFO:
 		{
+			memset(info, 0, sizeof(*info));
 			if (devp->hd_ireqfreq)
 				info->hi_ireqfreq  					hpet_time_div(hpetp, devp->hd_ireqfreq);
-- 
1.7.0.4

