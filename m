From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Oct 2020 05:57:09 +0000
Subject: [PATCH] scsi: isci: Fix a typo in a comment
Message-Id: <20201003055709.766119-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: intel-linux-scu@intel.com, artur.paszkiewicz@intel.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/remtoe/remote/
and add a missing '.'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/isci/remote_node_table.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/isci/remote_node_table.h b/drivers/scsi/isci/remote_node_table.h
index 721ab982d2ac..0ddfdda2b248 100644
--- a/drivers/scsi/isci/remote_node_table.h
+++ b/drivers/scsi/isci/remote_node_table.h
@@ -61,7 +61,7 @@
 /**
  *
  *
- * Remote node sets are sets of remote node index in the remtoe node table The
+ * Remote node sets are sets of remote node index in the remote node table. The
  * SCU hardware requires that STP remote node entries take three consecutive
  * remote node index so the table is arranged in sets of three. The bits are
  * used as 0111 0111 to make a byte and the bits define the set of three remote
-- 
2.25.1
