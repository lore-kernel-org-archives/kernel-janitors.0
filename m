From: Boris Bodemann <bobo.barbarossa@gmail.com>
Date: Thu, 27 Nov 2014 16:13:01 +0000
Subject: [PATCH 1/1] esas2r: Correct typos of "validate" in a comment
Message-Id: <54774D8D.2030204@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bradley Grove <linuxdrivers@attotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, trivial@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Boris Bodemann <bobo.barbarossa@gmail.com>

Correct typos of "validate" in a comment

Signed-off-by: Boris Bodemann <bobo.barbarossa@gmail.com>
---
diff -up a/drivers/scsi/esas2r/esas2r_flash.c b/drivers/scsi/esas2r/esas2r_flash.c
--- a/drivers/scsi/esas2r/esas2r_flash.c        2014-11-21 18:24:10.000000000 +0100
+++ b/drivers/scsi/esas2r/esas2r_flash.c        2014-11-27 14:49:03.029899303 +0100
@@ -684,9 +684,9 @@ static u16 calc_fi_checksum(struct esas2
  *              1)  verify the fi_version is correct
  *              2)  verify the checksum of the entire image.
  *              3)  validate the adap_typ, action and length fields.
- *              4)  valdiate each component header. check the img_type and
+ *              4)  validate each component header. check the img_type and
  *                  length fields
- *              5)  valdiate each component image.  validate signatures and
+ *              5)  validate each component image.  validate signatures and
  *                  local checksums
  */
 static bool verify_fi(struct esas2r_adapter *a,
