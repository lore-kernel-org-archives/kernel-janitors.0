From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 20:54:52 +0000
Subject: [PATCH 2/4] w1: Improve a size determination in two functions
Message-Id: <4a01f6e8-6054-db98-a738-e42dd23a76b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
In-Reply-To: <cb845ee0-0826-6a68-1246-0beab38129c1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Evgeniy Polyakov <zbr@ioremap.net>, "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>, Sebastian Reichel <sre@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 21:17:01 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/w1/slaves/w1_ds28e04.c | 2 +-
 drivers/w1/w1.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds28e04.c b/drivers/w1/slaves/w1_ds28e04.c
index ec234b846eb3..794db5e8f46f 100644
--- a/drivers/w1/slaves/w1_ds28e04.c
+++ b/drivers/w1/slaves/w1_ds28e04.c
@@ -397,5 +397,5 @@ static int w1_f1C_add_slave(struct w1_slave *sl)
 	struct w1_f1C_data *data = NULL;
 
 	if (w1_enable_crccheck) {
-		data = kzalloc(sizeof(struct w1_f1C_data), GFP_KERNEL);
+		data = kzalloc(sizeof(*data), GFP_KERNEL);
 		if (!data)
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index f26c1ea280dd..9f71dc7aca3a 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -711,5 +711,5 @@ int w1_attach_slave_device(struct w1_master *dev, struct w1_reg_num *rn)
 	int err;
 	struct w1_netlink_msg msg;
 
-	sl = kzalloc(sizeof(struct w1_slave), GFP_KERNEL);
+	sl = kzalloc(sizeof(*sl), GFP_KERNEL);
 	if (!sl)
-- 
2.14.0

