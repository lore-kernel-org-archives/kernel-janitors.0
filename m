From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 04 May 2017 20:10:54 +0000
Subject: [PATCH 9/9] mfd: max8925-i2c: Drop unnecessary static
Message-Id: <1493928654-18768-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Drop static on a local variable, when the variable is initialized before
any use, on every possible execution path through the function.  The static
has no benefit, and dropping it reduces the code size.

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

The change in code size is indicates by the following output from the size
command.

before:
   text    data     bss     dec     hex filename
   2579     240      16    2835     b13 drivers/mfd/max8925-i2c.o

after:
   text    data     bss     dec     hex filename
   2531     240       8    2779     adb drivers/mfd/max8925-i2c.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/max8925-i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index 5c80aea..1006323 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -151,7 +151,7 @@ static int max8925_probe(struct i2c_client *client,
 				   const struct i2c_device_id *id)
 {
 	struct max8925_platform_data *pdata = dev_get_platdata(&client->dev);
-	static struct max8925_chip *chip;
+	struct max8925_chip *chip;
 	struct device_node *node = client->dev.of_node;
 
 	if (node && !pdata) {

