From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 20:40:57 +0000
Subject: [PATCH 0/3] mfd/abx500-core: Adjustments for eight function implementations
Message-Id: <d1862d7a-412e-9aaf-8200-bb2070ee402a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 14 Jan 2018 21:38:42 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
    in abx500_register_ops()
  Improve two size determinations in abx500_register_ops()
  Adjust 14 checks for null pointers

 drivers/mfd/abx500-core.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

-- 
2.15.1

