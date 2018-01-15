From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 15:12:58 +0000
Subject: [PATCH 0/3] mfd/sm501: Adjustments for five function implementations
Message-Id: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 Jan 2018 16:11:22 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in two functions
  Adjust 12 checks for null pointers

 drivers/mfd/sm501.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

-- 
2.15.1

