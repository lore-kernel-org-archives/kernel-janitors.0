From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 12:41:14 +0000
Subject: [PATCH 2/3] extcon: Fix a typo in three comment lines
Message-Id: <251c60e8-4e20-b64c-24a5-27d477d05f4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
In-Reply-To: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Apr 2017 22:15:20 +0200

Adjust three words in this description for a function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index acb847bc1619..8eccf7b14937 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -964,12 +964,12 @@ EXPORT_SYMBOL_GPL(extcon_unregister_notifier);
 
 /**
  * extcon_register_notifier_all() - Register a notifier block for all connectors
- * @edev:	the extcon device that has the external connecotr.
+ * @edev:	the extcon device that has the external connector.
  * @nb:		a notifier block to be registered.
  *
- * This fucntion registers a notifier block in order to receive the state
+ * This function registers a notifier block in order to receive the state
  * change of all supported external connectors from extcon device.
- * And The second parameter given to the callback of nb (val) is
+ * And the second parameter given to the callback of nb (val) is
  * the current state and third parameter is the edev pointer.
  *
  * Returns 0 if success or error number if fail
-- 
2.12.2

