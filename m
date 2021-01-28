From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2021 09:35:51 +0000
Subject: [PATCH] Input: elo - fix an error code in elo_connect()
Message-Id: <YBKFd5CvDu+jVmfW@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Shaun Jackman <sjackman@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

If elo_setup_10() fails then this should return an error code instead
of success.

Fixes: fae3006e4b42 ("Input: elo - add support for non-pressure-sensitive touchscreens")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/touchscreen/elo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elo.c b/drivers/input/touchscreen/elo.c
index e0bacd34866a..4b2fb73da5e2 100644
--- a/drivers/input/touchscreen/elo.c
+++ b/drivers/input/touchscreen/elo.c
@@ -341,8 +341,10 @@ static int elo_connect(struct serio *serio, struct serio_driver *drv)
 	switch (elo->id) {
 
 	case 0: /* 10-byte protocol */
-		if (elo_setup_10(elo))
+		if (elo_setup_10(elo)) {
+			err = -EINVAL;
 			goto fail3;
+		}
 
 		break;
 
-- 
2.29.2
