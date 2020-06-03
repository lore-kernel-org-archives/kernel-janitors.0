From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 13:57:42 +0000
Subject: [PATCH] input: alps: remove redundant assignment to variable ret
Message-Id: <20200603135742.130852-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/mouse/alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 34700eda0429..b067bfd2699c 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1929,7 +1929,7 @@ static int alps_monitor_mode(struct psmouse *psmouse, bool enable)
 static int alps_absolute_mode_v6(struct psmouse *psmouse)
 {
 	u16 reg_val = 0x181;
-	int ret = -1;
+	int ret;
 
 	/* enter monitor mode, to write the register */
 	if (alps_monitor_mode(psmouse, true))
-- 
2.25.1
