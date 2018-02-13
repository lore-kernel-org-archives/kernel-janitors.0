From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 18:32:43 +0000
Subject: [PATCH 0/2] FireWire-nosy: Adjustments for three function implementations
Message-Id: <c4e817a2-1554-2480-9469-9d06543b1eee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 19:30:19 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in add_card()
  Adjust eight checks for null pointers

 drivers/firewire/nosy.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

-- 
2.16.1

