From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 14:36:12 +0000
Subject: [PATCH 2/4] staging: greybus: light: Use kcalloc() in two functions
Message-Id: <112064ca-41b3-6936-090a-3c229a251af7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
In-Reply-To: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Dec 2016 13:46:25 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Fixes: 2870b52bae4c81823ffcb3ed2b0626fb39d64f48 ("greybus: lights: add lights implementation")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/greybus/light.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index 8dffd8a7e762..27bfc20eb9a5 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1030,9 +1030,9 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 
 	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
-
-	light->channels = kzalloc(light->channels_count *
-				  sizeof(struct gb_channel), GFP_KERNEL);
+	light->channels = kcalloc(light->channels_count,
+				  sizeof(*light->channels),
+				  GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
 
@@ -1168,8 +1168,9 @@ static int gb_lights_create_all(struct gb_lights *glights)
 	if (ret < 0)
 		goto out;
 
-	glights->lights = kzalloc(glights->lights_count *
-				  sizeof(struct gb_light), GFP_KERNEL);
+	glights->lights = kcalloc(glights->lights_count,
+				  sizeof(*glights->lights),
+				  GFP_KERNEL);
 	if (!glights->lights) {
 		ret = -ENOMEM;
 		goto out;
-- 
2.11.0

