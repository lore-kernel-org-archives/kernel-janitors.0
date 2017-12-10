From: Colin King <colin.king@canonical.com>
Date: Sun, 10 Dec 2017 23:20:58 +0000
Subject: [PATCH][staging-next] staging: most: core: make functions print_links and most_match static
Message-Id: <20171210232058.14652-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, Andrey Shvetsov <andrey.shvetsov@k2l.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions print_links and most_match static are local to the source
and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'print_links' was not declared. Should it be static?
symbol 'most_match' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/core.c b/drivers/staging/most/core.c
index c1fba5ba7541..5ba2cd5ec1b0 100644
--- a/drivers/staging/most/core.c
+++ b/drivers/staging/most/core.c
@@ -534,7 +534,7 @@ struct show_links_data {
 	char *buf;
 };
 
-int print_links(struct device *dev, void *data)
+static int print_links(struct device *dev, void *data)
 {
 	struct show_links_data *d = data;
 	int offs = d->offs;
@@ -803,7 +803,7 @@ static const struct attribute_group *mc_attr_groups[] = {
 	NULL,
 };
 
-int most_match(struct device *dev, struct device_driver *drv)
+static int most_match(struct device *dev, struct device_driver *drv)
 {
 	if (!strcmp(dev_name(dev), "most"))
 		return 0;
-- 
2.14.1

