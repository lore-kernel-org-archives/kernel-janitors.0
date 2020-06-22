From: Colin King <colin.king@canonical.com>
Date: Mon, 22 Jun 2020 16:31:44 +0000
Subject: [PATCH] input: i8042: remove redundant assignment to variable retval
Message-Id: <20200622163144.107815-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rajat Jain <rajatja@google.com>, Stephen Boyd <swboyd@chromium.org>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/serio/i8042.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 0dddf273afd9..cbaae80065e1 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -796,7 +796,7 @@ static int __init i8042_toggle_aux(bool on)
 
 static int __init i8042_check_aux(void)
 {
-	int retval = -1;
+	int retval;
 	bool irq_registered = false;
 	bool aux_loop_broken = false;
 	unsigned long flags;
-- 
2.27.0
