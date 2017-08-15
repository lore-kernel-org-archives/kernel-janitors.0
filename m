From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 15:35:42 +0000
Subject: [PATCH 0/3] fs-udf: Adjustments for some function implementations
Message-Id: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 17:10:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in two functions
  Improve six size determinations
  Adjust two checks for null pointers

 fs/udf/inode.c | 13 ++++---------
 fs/udf/namei.c |  2 +-
 fs/udf/super.c | 12 +++++-------
 3 files changed, 10 insertions(+), 17 deletions(-)

-- 
2.14.0

