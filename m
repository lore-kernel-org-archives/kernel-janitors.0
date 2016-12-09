From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 14:37:56 +0000
Subject: [PATCH 3/4] staging: greybus: light: Check return value of a kstrndup() call in gb_lights_light_conf
Message-Id: <f6479c52-4dd1-fec4-f659-2fe64d5024fd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
In-Reply-To: <a2db1eee-eb2c-07b6-2144-3e262facbef9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 9 Dec 2016 14:36:16 +0100

A return value was not checked after a call of the function "kstrndup".
This issue was detected by using the Coccinelle software.

Add a bit of exception handling.

Fixes: 2870b52bae4c81823ffcb3ed2b0626fb39d64f48 ("greybus: lights: add lights implementation")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/greybus/light.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index 27bfc20eb9a5..c9c377f40f56 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1030,6 +1030,9 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 
 	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
+	if (!light->name)
+		return -ENOMEM;
+
 	light->channels = kcalloc(light->channels_count,
 				  sizeof(*light->channels),
 				  GFP_KERNEL);
-- 
2.11.0

