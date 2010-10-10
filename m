From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:31 +0000
Subject: [PATCH] drivers: mfd: fix off by one error
Message-Id: <1286731711-17865-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Samuel Ortiz <sameo@linux.intel.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org

snprintf() is overflowed iff result is greater or equal than
argument "size".

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/mfd/mc13xxx-core.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
index 93258ad..cd4d670 100644
--- a/drivers/mfd/mc13xxx-core.c
+++ b/drivers/mfd/mc13xxx-core.c
@@ -696,7 +696,7 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
 	};
 
 	/* there is no asnprintf in the kernel :-( */
-	if (snprintf(buf, sizeof(buf), format, name) > sizeof(buf))
+	if (snprintf(buf, sizeof(buf), format, name) >= sizeof(buf))
 		return -E2BIG;
 
 	cell.name = kmemdup(buf, strlen(buf) + 1, GFP_KERNEL);
-- 
1.7.0.4

