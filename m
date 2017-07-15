From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Jul 2017 20:07:46 +0000
Subject: [PATCH 11/11] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <1500149266-32357-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any possible use.  Thus, the static has no benefit.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@bad exists@
position p;
identifier x;
type T;
@@
static T x@p;
...
x = <+...x...+>

@@
identifier x;
expression e;
type T;
position p != bad.p;
@@
-static
 T x@p;
 ... when != x
     when strict
?x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
These patches are all independent of each other.

 drivers/mfd/max8925-i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_clie
 				   const struct i2c_device_id *id)
 {
 	struct max8925_platform_data *pdata = dev_get_platdata(&client->dev);
-	static struct max8925_chip *chip;
+	struct max8925_chip *chip;
 	struct device_node *node = client->dev.of_node;
 
 	if (node && !pdata) {

