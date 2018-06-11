From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Jun 2018 08:32:20 +0000
Subject: [PATCH] media: bt8xx: bttv: fix spelling mistake: "culpit" -> "culprit"
Message-Id: <20180611083220.24130-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_notice message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/bt8xx/bttv-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/bttv-driver.c b/drivers/media/pci/bt8xx/bttv-driver.c
index de3f44b8dec6..cf05e11da01b 100644
--- a/drivers/media/pci/bt8xx/bttv-driver.c
+++ b/drivers/media/pci/bt8xx/bttv-driver.c
@@ -3511,7 +3511,7 @@ static void bttv_irq_debug_low_latency(struct bttv *btv, u32 rc)
 	}
 	pr_notice("%d: Uhm. Looks like we have unusual high IRQ latencies\n",
 		  btv->c.nr);
-	pr_notice("%d: Lets try to catch the culpit red-handed ...\n",
+	pr_notice("%d: Lets try to catch the culprit red-handed ...\n",
 		  btv->c.nr);
 	dump_stack();
 }
-- 
2.17.0

