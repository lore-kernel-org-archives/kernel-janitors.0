From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 20:11:49 +0000
Subject: [PATCH 0/3] OrangeFS: Adjustments for some function implementations
Message-Id: <6802994a-a537-2e00-e7d8-c1b822879f76@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Brandenburg <martin@omnibond.com>, Mike Marshall <hubcap@omnibond.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 17 Aug 2017 21:54:32 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete error messages for a failed memory allocation in five functions
  Use kcalloc() in orangefs_prepare_cdm_array()
  Adjust three checks for null pointers

 fs/orangefs/acl.c              |  2 +-
 fs/orangefs/devorangefs-req.c  |  9 +++------
 fs/orangefs/orangefs-bufmap.c  | 10 ++--------
 fs/orangefs/orangefs-debugfs.c |  5 +----
 fs/orangefs/orangefs-mod.c     |  1 -
 fs/orangefs/super.c            |  4 +---
 fs/orangefs/xattr.c            |  4 ++--
 7 files changed, 10 insertions(+), 25 deletions(-)

-- 
2.14.0

