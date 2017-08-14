From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 09:33:50 +0000
Subject: [PATCH 0/2] kmemleak: Adjustments for three function implementations
Message-Id: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Aug 2017 11:30:22 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in two functions
  Use seq_puts() in print_unreferenced()

 mm/kmemleak.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.14.0

