From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 05 Nov 2019 18:52:18 +0000
Subject: [PATCH 0/2] misc: xilinx_sdfec: Adjustments for xsdfec_add_ldpc()
Message-Id: <af1ff373-56c0-ca49-36dd-15666d183c95@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Derek Kiernan <derek.kiernan@xilinx.com>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Simek <michal.simek@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Nov 2019 19:45:05 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user() rather than duplicating its implementation
  Combine three condition checks into one statement

 drivers/misc/xilinx_sdfec.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

--
2.24.0
