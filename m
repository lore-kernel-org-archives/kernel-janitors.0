From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 19:50:31 +0000
Subject: [PATCH] PM / Domains: Use seq_puts() in genpd_summary_one()
Message-Id: <7a79ee59-884a-b769-5e07-37db57687f83@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-pm@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jul 2019 21:42:31 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/base/power/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 33c30c1e6a30..7dd433fab7ec 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2796,7 +2796,7 @@ static int genpd_summary_one(struct seq_file *s,
 	 * Also genpd->name is immutable.
 	 */
 	list_for_each_entry(link, &genpd->master_links, master_node) {
-		seq_printf(s, "%s", link->slave->name);
+		seq_puts(s, link->slave->name);
 		if (!list_is_last(&link->master_node, &genpd->master_links))
 			seq_puts(s, ", ");
 	}
--
2.22.0
