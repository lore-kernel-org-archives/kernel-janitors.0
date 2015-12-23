From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 18:12:21 +0000
Subject: [PATCH 4/5] block-LDM: Less function calls in ldm_validate_privheads() after error detection
Message-Id: <567AE405.9030308@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567A6CDB.4030703@users.sourceforge.net>
 <alpine.DEB.2.10.1512231140090.4367@hadrien>
 <567AE1C6.9020108@users.sourceforge.net>
In-Reply-To: <567AE1C6.9020108@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ntfs-dev@lists.sourceforge.net, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Richard Russon <ldm@flatcap.org>
Cc: Julia Lawall <julia.lawall@lip6.fr>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 23 Dec 2015 14:31:01 +0100

The kfree() function was called by the ldm_validate_privheads() function
during error handling even if the passed variable "ph" contained
a null pointer.

* Corresponding implementation details could be improved by adjustments
  for jump targets according to the Linux coding style convention.

* The variable "result" will eventually be set to an appropriate value.
  Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/partitions/ldm.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index 3118d24..6fc9150 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -335,16 +335,20 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 	struct privhead *ph[3] = { ph1 };
 	Sector sect;
 	u8 *data;
-	bool result = false;
+	bool result;
 	long num_sects;
 	int i;
 
 	BUG_ON (!state || !ph1);
 
 	ph[1] = kmalloc (sizeof (*ph[1]), GFP_KERNEL);
+	if (!ph[1])
+		return false;
 	ph[2] = kmalloc (sizeof (*ph[2]), GFP_KERNEL);
-	if (!ph[1] || !ph[2])
-		goto out;
+	if (!ph[2]) {
+		result = false;
+		goto free_a_head;
+	}
 
 	/* off[1 & 2] are relative to ph[0]->config_start */
 	ph[0]->config_start = 0;
@@ -355,14 +359,15 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 					&sect);
 		if (!data) {
 			ldm_crit ("Disk read failed.");
-			goto out;
+			result = false;
+			goto free_another_head;
 		}
 		result = ldm_parse_privhead (data, ph[i]);
 		put_dev_sector (sect);
 		if (!result) {
 			ldm_error ("Cannot find PRIVHEAD %d.", i+1); /* Log again */
 			if (i < 2)
-				goto out;	/* Already logged */
+				goto free_another_head;	/* Already logged */
 			else
 				break;	/* FIXME ignore for now, 3rd PH can fail on odd-sized disks */
 		}
@@ -373,30 +378,31 @@ static bool ldm_validate_privheads(struct parsed_partitions *state,
 	if ((ph[0]->config_start > num_sects) ||
 	   ((ph[0]->config_start + ph[0]->config_size) > num_sects)) {
 		ldm_crit ("Database extends beyond the end of the disk.");
-		goto out;
+		goto free_another_head;
 	}
 
 	if ((ph[0]->logical_disk_start > ph[0]->config_start) ||
 	   ((ph[0]->logical_disk_start + ph[0]->logical_disk_size)
 		    > ph[0]->config_start)) {
 		ldm_crit ("Disk and database overlap.");
-		goto out;
+		goto free_another_head;
 	}
 
 	if (!ldm_compare_privheads (ph[0], ph[1])) {
 		ldm_crit ("Primary and backup PRIVHEADs don't match.");
-		goto out;
+		goto free_another_head;
 	}
 	/* FIXME ignore this for now
 	if (!ldm_compare_privheads (ph[0], ph[2])) {
 		ldm_crit ("Primary and backup PRIVHEADs don't match.");
-		goto out;
+		goto free_another_head;
 	}*/
 	ldm_debug ("Validated PRIVHEADs successfully.");
 	result = true;
-out:
-	kfree (ph[1]);
-	kfree (ph[2]);
+free_another_head:
+	kfree(ph[2]);
+free_a_head:
+	kfree(ph[1]);
 	return result;
 }
 
-- 
2.6.3

