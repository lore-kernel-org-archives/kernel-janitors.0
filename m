From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 16:58:58 +0000
Subject: [PATCH] firmware: vpd: fix spelling mistake "partion" -> "partition"
Message-Id: <20180911165858.3015-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in comment

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/firmware/google/vpd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 1aa67bb5d8c0..c0c0b4e4e281 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -198,7 +198,7 @@ static int vpd_section_init(const char *name, struct vpd_section *sec,
 
 	sec->name = name;
 
-	/* We want to export the raw partion with name ${name}_raw */
+	/* We want to export the raw partition with name ${name}_raw */
 	sec->raw_name = kasprintf(GFP_KERNEL, "%s_raw", name);
 	if (!sec->raw_name) {
 		err = -ENOMEM;
-- 
2.17.1
