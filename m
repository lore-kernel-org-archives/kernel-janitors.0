From: Navin P <zicrim@gmail.com>
Date: Sun, 25 Sep 2011 10:44:44 +0000
Subject: [PATCH] Remove const keyword from matrix_keypad.c
Message-Id: <4E7F034C.7090609@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: marek.vasut@gmail.com, kernel-janitors@vger.kernel.org

 Remove the const keyword as SIMPLE_DEV_PMS_OPS already defines a const struct.
 Signed-off-by: Navin P <zicrim@gmail.com>

---
 drivers/input/keyboard/matrix_keypad.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index b02e426..c127658 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -294,7 +294,7 @@ static int matrix_keypad_resume(struct device *dev)
 	return 0;
 }
 
-static const SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
+static SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
 				matrix_keypad_suspend, matrix_keypad_resume);
 #endif
 
-- 
1.7.0.4


