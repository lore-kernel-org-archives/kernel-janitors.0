From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Sep 2017 10:20:57 +0000
Subject: [PATCH][staging-next] staging: typec: fusb302: make structure fusb302_psy_desc static
Message-Id: <20170901102057.17637-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Hans de Goede <hdegoede@redhat.com>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Frans Klaver <fransklaver@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The const structure fusb302_psy_desc is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warnings
symbol 'fusb302_psy_desc' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/typec/fusb302/fusb302.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/typec/fusb302/fusb302.c b/drivers/staging/typec/fusb302/fusb302.c
index cf6355f59cd9..fc6a3cf74eb3 100644
--- a/drivers/staging/typec/fusb302/fusb302.c
+++ b/drivers/staging/typec/fusb302/fusb302.c
@@ -1723,7 +1723,7 @@ static enum power_supply_property fusb302_psy_properties[] = {
 	POWER_SUPPLY_PROP_CURRENT_MAX,
 };
 
-const struct power_supply_desc fusb302_psy_desc = {
+static const struct power_supply_desc fusb302_psy_desc = {
 	.name		= "fusb302-typec-source",
 	.type		= POWER_SUPPLY_TYPE_USB_TYPE_C,
 	.properties	= fusb302_psy_properties,
-- 
2.14.1

