From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 17:00:18 +0000
Subject: [PATCH 0/6] Fix a few typos around the word "destroy"
Message-Id: <54736422.90409@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 17:34:23 +0100
Subject: [PATCH 0/6] Fix a few typos around the word "destroy"

The word "destroy" was mistyped in some files.

Markus Elfring (6):
  isci: Fix a typo for the word "destroy"
  SCSI-libfc: Fix typos for the word "destroy"
  video: fbdev-MMP: Fix typos for the word "destroy"
  f2fs: Fix typos for the word "destroy" in jump labels
  video: fbdev-MMP: Fix a typo for the word "destroyed"
  Documentation-SCSI: Fix a typo for the word "destroy"

 Documentation/scsi/ChangeLog.lpfc | 2 +-
 drivers/scsi/isci/remote_device.c | 2 +-
 drivers/scsi/libfc/fc_fcp.c       | 4 ++--
 drivers/video/fbdev/mmp/core.c    | 6 +++---
 fs/f2fs/node.c                    | 8 ++++----
 5 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.1.3

