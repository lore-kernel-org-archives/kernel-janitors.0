From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 13:06:16 +0000
Subject: [PATCH 1/4] [media] adv7604: Delete an error message for a failed memory allocation in adv76xx_probe
Message-Id: <e714ab2d-4d08-8103-6d05-2eee7a58ba10@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e67e095-4931-b78f-a925-7335326ab69c@users.sourceforge.net>
In-Reply-To: <0e67e095-4931-b78f-a925-7335326ab69c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 11:28:55 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/i2c/adv7604.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index 660bacb8f7d9..cc693ef71f33 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -3319,7 +3319,5 @@ static int adv76xx_probe(struct i2c_client *client,
-	if (!state) {
-		v4l_err(client, "Could not allocate adv76xx_state memory!\n");
+	if (!state)
 		return -ENOMEM;
-	}
 
 	state->i2c_clients[ADV76XX_PAGE_IO] = client;
 
-- 
2.14.1

