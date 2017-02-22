From: "Tobin C. Harding" <me@tobin.cc>
Date: Wed, 22 Feb 2017 05:49:08 +0000
Subject: [PATCH 0/3] cciss: Fix coccinelle/checkpatch warnings.
Message-Id: <1487742551-10839-1-git-send-email-me@tobin.cc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, "Tobin C. Harding" <me@tobin.cc>

Coccinelle warns about unnesesary cast on call to kmalloc(). Checkpatch
emits various warnings when parsing file.

Clean up two checkpatch warnings. Remove trailing whitespace and
clean up opending brace position. Remove unnesesary cast on kmalloc().

Tobin C. Harding (3):
  cciss: Fix checkpatch TRAILING_WHITESPACE
  cciss: Fix checkpatch OPEN_BRACE
  cciss: Remove kmalloc cast

 drivers/block/cciss_scsi.c | 182 ++++++++++++++++++++++-----------------------
 1 file changed, 88 insertions(+), 94 deletions(-)

-- 
2.7.4

