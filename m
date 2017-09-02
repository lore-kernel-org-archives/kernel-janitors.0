From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 13:08:49 +0000
Subject: [PATCH 3/4] [media] adv7842: Delete an error message for a failed memory allocation in adv7842_probe
Message-Id: <399f1b38-8e53-a52b-8386-4d067444eda9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e67e095-4931-b78f-a925-7335326ab69c@users.sourceforge.net>
In-Reply-To: <0e67e095-4931-b78f-a925-7335326ab69c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 12:50:19 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/i2c/adv7842.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index 303effda1a2e..366a294edd7b 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -3471,7 +3471,5 @@ static int adv7842_probe(struct i2c_client *client,
-	if (!state) {
-		v4l_err(client, "Could not allocate adv7842_state memory!\n");
+	if (!state)
 		return -ENOMEM;
-	}
 
 	/* platform data */
 	state->pdata = *pdata;
-- 
2.14.1

