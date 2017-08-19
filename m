From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 16:54:14 +0000
Subject: [PATCH 0/3] eCryptfs: Adjustments for several function implementations
Message-Id: <56e0a575-2a9e-120f-6a22-96d9fa4b151e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ecryptfs@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 18:15:14 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete 21 error messages for a failed memory allocation
  Return an error code only as a constant in ecryptfs_add_global_auth_tok()
  Adjust four checks for null pointers

 fs/ecryptfs/crypto.c    | 22 +++-------------------
 fs/ecryptfs/inode.c     |  3 ---
 fs/ecryptfs/keystore.c  | 46 +++++++++++-----------------------------------
 fs/ecryptfs/messaging.c |  6 ------
 fs/ecryptfs/miscdev.c   |  6 +-----
 fs/ecryptfs/mmap.c      |  2 --
 6 files changed, 15 insertions(+), 70 deletions(-)

-- 
2.14.0

