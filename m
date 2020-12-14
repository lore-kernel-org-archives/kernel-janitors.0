From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Dec 2020 22:31:09 +0000
Subject: [PATCH][next] Input: da7280: fix spelling mistake "sequemce" -> "sequence"
Message-Id: <20201214223109.82924-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/misc/da7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 9fdbae2edffe..37568b00873d 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -642,7 +642,7 @@ static int da7280_haptics_upload_effect(struct input_dev *dev,
 					   val);
 		if (error) {
 			dev_err(haptics->dev,
-				"Failed to update GPI sequemce: %d\n", error);
+				"Failed to update GPI sequence: %d\n", error);
 			return error;
 		}
 		break;
-- 
2.29.2
