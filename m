From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 16:32:35 +0000
Subject: [PATCH 0/2] oprofile_perf: Adjustments for oprofile_perf_init()
Message-Id: <8e408a15-7884-e9a1-0df2-a7419987c450@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oprofile-list@lists.sf.net, Robert Richter <rric@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 May 2017 18:28:38 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Improve a size determination
  Delete error messages for a failed memory allocation

 drivers/oprofile/oprofile_perf.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.12.3

