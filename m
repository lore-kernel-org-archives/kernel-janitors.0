From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 11:53:38 +0000
Subject: [PATCH 0/2] alpha-module: Adjustments for module_frob_arch_sections()
Message-Id: <21258632-0cde-f750-5864-406dc6dfad20@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Richard Henderson <rth@twiddle.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 13:11:23 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Improve a size determination
  Delete an error message for a failed memory allocation

 arch/alpha/kernel/module.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.12.3

