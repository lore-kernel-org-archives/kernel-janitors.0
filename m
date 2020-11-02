From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Nov 2020 11:12:03 +0000
Subject: [PATCH][next] SFH: remove redundant initialization of pointer cl_data
Message-Id: <20201102111203.693741-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nehal Shah <nehal-bakulchandra.shah@amd.com>, Sandeep Singh <sandeep.singh@amd.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer cl_data is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3d1ccac5d99a..7eaf519737c0 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -133,7 +133,7 @@ static void amd_sfh_work_buffer(struct work_struct *work)
 
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
-	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	struct amdtp_cl_data *cl_data;
 	struct amd_mp2_sensor_info info;
 	struct device *dev;
 	u32 feature_report_size;
-- 
2.27.0
