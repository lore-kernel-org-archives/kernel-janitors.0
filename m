From: Julia Lawall <julia@diku.dk>
Date: Thu, 04 Aug 2011 10:29:34 +0000
Subject: [PATCH 4/4] drivers/leds/leds-pca9532.c: delete useless initialization
Message-Id: <1312453774-23333-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312453774-23333-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312453774-23333-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Riku Voipio <riku.voipio@iki.fi>
Cc: kernel-janitors@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete nontrivial initialization that is immediately overwritten by the
result of an allocation function.

The semantic match that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier i;
expression e;
@@

(
T i = \(0\|NULL\|ERR_PTR(...)\);
|
-T i = e;
+T i;
)
... when != i
i = \(kzalloc\|kcalloc\|kmalloc\)(...);

// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/leds/leds-pca9532.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -447,7 +447,7 @@ exit:
 static int pca9532_probe(struct i2c_client *client,
 	const struct i2c_device_id *id)
 {
-	struct pca9532_data *data = i2c_get_clientdata(client);
+	struct pca9532_data *data;
 	struct pca9532_platform_data *pca9532_pdata = client->dev.platform_data;
 	int err;
 

