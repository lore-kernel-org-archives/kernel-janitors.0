From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Tue, 23 Oct 2012 19:57:11 +0000
Subject: [PATCH 08/23] cx25840: Replace memcpy with struct assignment
Message-Id: <1351022246-8201-8-git-send-email-elezegarcia@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>

This kind of memcpy() is error-prone. Its replacement with a struct
assignment is prefered because it's type-safe and much easier to read.

Found by coccinelle. Hand patched and reviewed.
Tested by compilation only.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier struct_name;
struct struct_name to;
struct struct_name from;
expression E;
@@
-memcpy(&(to), &(from), E);
+to = from;
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/media/i2c/cx25840/cx25840-ir.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/cx25840/cx25840-ir.c b/drivers/media/i2c/cx25840/cx25840-ir.c
index 38ce76e..9ae977b 100644
--- a/drivers/media/i2c/cx25840/cx25840-ir.c
+++ b/drivers/media/i2c/cx25840/cx25840-ir.c
@@ -1251,13 +1251,11 @@ int cx25840_ir_probe(struct v4l2_subdev *sd)
 		cx25840_write4(ir_state->c, CX25840_IR_IRQEN_REG, 0);
 
 	mutex_init(&ir_state->rx_params_lock);
-	memcpy(&default_params, &default_rx_params,
-		       sizeof(struct v4l2_subdev_ir_parameters));
+	default_params = default_rx_params;
 	v4l2_subdev_call(sd, ir, rx_s_parameters, &default_params);
 
 	mutex_init(&ir_state->tx_params_lock);
-	memcpy(&default_params, &default_tx_params,
-		       sizeof(struct v4l2_subdev_ir_parameters));
+	default_params = default_tx_params;
 	v4l2_subdev_call(sd, ir, tx_s_parameters, &default_params);
 
 	return 0;
-- 
1.7.4.4

