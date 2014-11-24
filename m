From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 17:31:05 +0000
Subject: [PATCH 6/6] Documentation-SCSI: Fix a typo for the word "destroy"
Message-Id: <54736B59.7040108@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54736422.90409@users.sourceforge.net>
In-Reply-To: <54736422.90409@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>, linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 17:25:30 +0100

An identifier was corrected in a change log entry because it contained a typo.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 Documentation/scsi/ChangeLog.lpfc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scsi/ChangeLog.lpfc b/Documentation/scsi/ChangeLog.lpfc
index 2f6d595..24d6508 100644
--- a/Documentation/scsi/ChangeLog.lpfc
+++ b/Documentation/scsi/ChangeLog.lpfc
@@ -1263,7 +1263,7 @@ Changes from 20040515 to 20040526
 	* Switch from using internal bus/id/lun to similar data from
 	  scsi_device structure.
 	* Eliminate one-line function lpfc_find_target()
-	* Added slave_alloc, slave_destory
+	* Added slave_alloc, slave_destroy
 	* lpfc_scsi_cmd_start can now acquire lun pointer from
 	  scsi_device->hostdata, which is setup in slave_alloc.
 	* Eliminate unnecessary checking on every cmd just to see if we
-- 
2.1.3

