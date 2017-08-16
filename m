From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 13:26:17 +0000
Subject: [PATCH 0/2] UBIFS: Adjustments for some function implementations
Message-Id: <bd8107ce-fc62-db39-8134-59dca314da7c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 15:21:23 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in dbg_check_orphans()
  Improve 19 size determinations

 fs/ubifs/log.c      |  2 +-
 fs/ubifs/lpt.c      | 12 ++++++------
 fs/ubifs/orphan.c   | 10 ++++------
 fs/ubifs/recovery.c |  2 +-
 fs/ubifs/replay.c   |  8 ++++----
 fs/ubifs/scan.c     |  4 ++--
 fs/ubifs/super.c    |  2 +-
 fs/ubifs/tnc.c      |  2 +-
 8 files changed, 20 insertions(+), 22 deletions(-)

-- 
2.14.0

