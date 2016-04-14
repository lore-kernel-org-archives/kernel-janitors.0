From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:32:31 +0000
Subject: [patch] target/transport: Silence unitialized variable warnings
Message-Id: <20160414093231.GB16549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Bart Van Assche <bart.vanassche@sandisk.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The core_scsi3_ua_for_check_condition() can return without initializing
these variables.  I have initialized them to zero so that it triggers a
WARN_ON_ONCE() in that situation.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
index ab2bf12..851e634 100644
--- a/drivers/target/target_core_transport.c
+++ b/drivers/target/target_core_transport.c
@@ -2884,7 +2884,8 @@ static int translate_sense_reason(struct se_cmd *cmd, sense_reason_t reason)
 	const struct sense_info *si;
 	u8 *buffer = cmd->sense_buffer;
 	int r = (__force int)reason;
-	u8 asc, ascq;
+	u8 asc = 0;
+	u8 ascq = 0;
 	bool desc_format = target_sense_desc_format(cmd->se_dev);
 
 	if (r < ARRAY_SIZE(sense_info_table) && sense_info_table[r].key)
