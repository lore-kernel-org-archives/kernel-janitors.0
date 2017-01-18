From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 16:45:44 +0000
Subject: [PATCH 0/3] m68k: Fine-tuning for sys_cacheflush()
Message-Id: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Jan 2017 17:42:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Return directly after a failed capable()
  Delete an unnecessary variable assignment
  Add some spaces for better code readability

 arch/m68k/kernel/sys_m68k.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

-- 
2.11.0

