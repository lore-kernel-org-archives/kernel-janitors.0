From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 23:08:21 +0000
Subject: [PATCH] extcon: remove redundant assignment to variable idx
Message-Id: <20200415230821.1567410-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable idx is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/extcon/extcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 2dfbfec572f9..0a6438cbb3f3 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -900,7 +900,7 @@ int extcon_register_notifier(struct extcon_dev *edev, unsigned int id,
 			     struct notifier_block *nb)
 {
 	unsigned long flags;
-	int ret, idx = -EINVAL;
+	int ret, idx;
 
 	if (!edev || !nb)
 		return -EINVAL;
-- 
2.25.1
