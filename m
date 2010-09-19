From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:54:49 +0000
Subject: [PATCH 04/14] memstick: core: fix device_register() error handling
Message-Id: <1284900889-24369-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/memstick/core/memstick.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
index c00fe82..4303b7e 100644
--- a/drivers/memstick/core/memstick.c
+++ b/drivers/memstick/core/memstick.c
@@ -465,6 +465,7 @@ static void memstick_check(struct work_struct *work)
 		if (!host->card) {
 			host->card = card;
 			if (device_register(&card->dev)) {
+				put_device(&card->dev);
 				kfree(host->card);
 				host->card = NULL;
 			}
-- 
1.7.0.4

