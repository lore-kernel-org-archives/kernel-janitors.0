From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Jun 2017 13:24:17 +0000
Subject: [PATCH][target-devel-next] tcmu: make array tcmu_attrib_attrs static const
Message-Id: <20170613132417.20397-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A . Bellinger" <nab@linux-iscsi.org>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The guid intel_dsm_guid does not need to be in global scope, so make
it static.

Cleans up sparse warning:
"symbol 'tcmu_attrib_attrs' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/target/target_core_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/target_core_user.c b/drivers/target/target_core_user.c
index afc1fd6bacaf..04fb3f720895 100644
--- a/drivers/target/target_core_user.c
+++ b/drivers/target/target_core_user.c
@@ -1672,7 +1672,7 @@ static ssize_t tcmu_emulate_write_cache_store(struct config_item *item,
 }
 CONFIGFS_ATTR(tcmu_, emulate_write_cache);
 
-struct configfs_attribute *tcmu_attrib_attrs[] = {
+static struct configfs_attribute *tcmu_attrib_attrs[] = {
 	&tcmu_attr_cmd_time_out,
 	&tcmu_attr_dev_path,
 	&tcmu_attr_dev_size,
-- 
2.11.0

