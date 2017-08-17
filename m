From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 20:14:39 +0000
Subject: [PATCH 2/3] orangefs: Use kcalloc() in orangefs_prepare_cdm_array()
Message-Id: <705dd4fa-3daf-08fb-23c8-1888b67bc1ce@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
In-Reply-To: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Brandenburg <martin@omnibond.com>, Mike Marshall <hubcap@omnibond.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 21:18:01 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/orangefs/orangefs-debugfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index 93fe8f8e60f1..5f59917fd631 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -571,7 +571,5 @@ static int orangefs_prepare_cdm_array(char *debug_array_string)
 		goto out;
 	}
 
-	cdm_array -		kzalloc(cdm_element_count * sizeof(struct client_debug_mask),
-			GFP_KERNEL);
+	cdm_array = kcalloc(cdm_element_count, sizeof(*cdm_array), GFP_KERNEL);
 	if (!cdm_array) {
-- 
2.14.0

