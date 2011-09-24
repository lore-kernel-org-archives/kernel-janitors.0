From: Zic Rim <zicrim@gmail.com>
Date: Sat, 24 Sep 2011 09:48:31 +0000
Subject: [patch ] remove redundant const in matrix_keypad.c
Message-Id: <CAMvewQKTJL0CdL25v7MizgJUexSmbb7E1u=9LNRu2yhdBCMROQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

SIMPLE_DEV_PM_OPS defins a const struct , no need to prefix with  const.

Signed-off-by: Navin P <zicrim@gmail.com>


diff --git a/drivers/input/keyboard/matrix_keypad.c
b/drivers/input/keyboard/matrix_keypad.c
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
