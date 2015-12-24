From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 12:31:38 +0000
Subject: [PATCH 0/3] Documentation-getdelays: Fine-tuning for two functions
Message-Id: <567BE5AA.6070607@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 13:23:34 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Fix a check for container file usage in main()
  Apply a recommendation from "checkpatch.pl" in main()
  Less function calls in usage()

 Documentation/accounting/getdelays.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

-- 
2.6.3

