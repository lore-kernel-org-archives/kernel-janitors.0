From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 16:53:09 +0000
Subject: [PATCH] drivers: visorbus: fix spelling mistake "partion" -> "partition"
Message-Id: <20180911165309.1314-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in comment, re-jig comment block
to avoid checkpatch overly wide line warning.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 include/linux/visorbus.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/visorbus.h b/include/linux/visorbus.h
index 0d8bd6769b13..4a6abff20049 100644
--- a/include/linux/visorbus.h
+++ b/include/linux/visorbus.h
@@ -222,9 +222,9 @@ struct visorchipset_state {
  *				hypervisor requests.
  * @vbus_hdr_info:		A pointer to header info. Private use by bus
  *				driver.
- * @partition_guid:		Indicates client partion id. This should be the
- *				same across all visor_devices in the current
- *				guest. Private use by bus driver only.
+ * @partition_guid:		Indicates client partition id. This should be
+ *				the same across all visor_devices in the
+ *				current guest. Private use by bus driver only.
  */
 struct visor_device {
 	struct visorchannel *visorchannel;
-- 
2.17.1
