From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Dec 2018 22:44:19 +0000
Subject: [PATCH] gru: clean up indentation issue, remove spaces
Message-Id: <20181221224419.15284-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dimitri Sivanich <sivanich@sgi.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of statements that have extra spaces in the identation,
fix this by removing them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/sgi-gru/grufault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
index 93be82fc338a..2ec5808ba464 100644
--- a/drivers/misc/sgi-gru/grufault.c
+++ b/drivers/misc/sgi-gru/grufault.c
@@ -616,8 +616,8 @@ irqreturn_t gru_intr_mblade(int irq, void *dev_id)
 	for_each_possible_blade(blade) {
 		if (uv_blade_nr_possible_cpus(blade))
 			continue;
-		 gru_intr(0, blade);
-		 gru_intr(1, blade);
+		gru_intr(0, blade);
+		gru_intr(1, blade);
 	}
 	return IRQ_HANDLED;
 }
-- 
2.19.1
