From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:26:36 +0000
Subject: [PATCH 0/7] RapidIO: Adjustments for some function implementations
Message-Id: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 11:20:33 +0100

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Delete an error message for a failed memory allocation in rio_init_mports()
  Adjust 12 checks for null pointers
  Adjust five function calls together with a variable assignment
  Improve a size determination in five functions
  Delete an unnecessary variable initialisation in three functions
  Return an error code only as a constant in two functions
  Move 12 EXPORT_SYMBOL_GPL() calls to function implementations

 drivers/rapidio/rio.c | 110 ++++++++++++++++++++++----------------------------
 1 file changed, 48 insertions(+), 62 deletions(-)

-- 
2.15.1

