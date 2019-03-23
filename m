From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 23 Mar 2019 11:26:59 +0000
Subject: [PATCH v2 -next] leds: lt3593: Remove unneeded assignment in lt3593_led_probe
Message-Id: <20190323112659.109934-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

As the chip can't be queried for it's current state, the "keep" option
doesn't make sense. The only option in DT should be turn the LED on or
off at probe time.Also 'flags' is never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2=EF=BC=9A remove 'keep' branch, fix patch title and description
---
 drivers/leds/leds-lt3593.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index 54f0e5dbdbd0..83e8e58d81cb 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -66,7 +66,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	struct lt3593_led_data *led_data;
 	struct fwnode_handle *child;
 	int ret, state =3D LEDS_GPIO_DEFSTATE_OFF;
-	enum gpiod_flags flags =3D GPIOD_OUT_LOW;
 	const char *tmp;
=20
 	if (!dev->of_node)
@@ -99,13 +98,8 @@ static int lt3593_led_probe(struct platform_device *pdev)
 				    &led_data->cdev.default_trigger);
=20
 	if (!fwnode_property_read_string(child, "default-state", &tmp)) {
-		if (!strcmp(tmp, "keep")) {
-			state =3D LEDS_GPIO_DEFSTATE_KEEP;
-			flags =3D GPIOD_ASIS;
-		} else if (!strcmp(tmp, "on")) {
+		if (!strcmp(tmp, "on"))
 			state =3D LEDS_GPIO_DEFSTATE_ON;
-			flags =3D GPIOD_OUT_HIGH;
-		}
 	}
=20
 	led_data->cdev.name =3D led_data->name;
