From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Nov 2018 11:56:45 +0000
Subject: [PATCH] staging: most: use format specifier "%s" in snprintf
Message-Id: <20181109115645.18279-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Passing string ch_data_type[i].name as the format specifier is
potentially hazardous because it could (although very unlikely to)
have a format specifier embedded in it causing issues when parsing
the non-existent arguments to these.  Follow best practice by using
the "%s" format string for the string.

Cleans up clang warning:
format string is not a string literal (potentially insecure) [-Wformat-security]

Fixes: e7f2b70fd3a9 ("staging: most: replace multiple if..else with table lookup")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/core.c b/drivers/staging/most/core.c
index 6a18cf73c85e..18936cdb1083 100644
--- a/drivers/staging/most/core.c
+++ b/drivers/staging/most/core.c
@@ -351,7 +351,7 @@ static ssize_t set_datatype_show(struct device *dev,
 
 	for (i = 0; i < ARRAY_SIZE(ch_data_type); i++) {
 		if (c->cfg.data_type & ch_data_type[i].most_ch_data_type)
-			return snprintf(buf, PAGE_SIZE, ch_data_type[i].name);
+			return snprintf(buf, PAGE_SIZE, "%s", ch_data_type[i].name);
 	}
 	return snprintf(buf, PAGE_SIZE, "unconfigured\n");
 }
-- 
2.19.1
