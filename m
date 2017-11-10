From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 12:45:19 +0000
Subject: [PATCH 0/4] ASN.1: Fine-tuning for three function implementations
Message-Id: <960a8501-03b0-95d9-c2bf-4633e48e73a6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Nov 2017 13:38:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Adjust two function calls together with a variable assignment
  Improve exiting from parse_type()
  Improve exiting from build_type_list()
  Use common error handling code in main()

 scripts/asn1_compiler.c | 100 ++++++++++++++++++++++++------------------------
 1 file changed, 51 insertions(+), 49 deletions(-)

-- 
2.15.0

