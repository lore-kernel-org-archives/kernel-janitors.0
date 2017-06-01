From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Jun 2017 15:56:20 +0000
Subject: [PATCH 0/3] ARM: dmabounce: Adjustments for four function implementations
Message-Id: <697e7810-d280-08f3-2a24-026ff41e15a3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Jun 2017 17:34:56 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Improve a size determination in two functions
  Delete an error message for a failed memory allocation in two functions
  Combine substrings for two messages

 arch/arm/common/dmabounce.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

-- 
2.13.0

