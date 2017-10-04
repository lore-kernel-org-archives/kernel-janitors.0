From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 18:43:52 +0000
Subject: [PATCH 0/5] CRIS v32: Adjustments for crisv32_nand_flash_probe()
Message-Id: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 20:33:20 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Delete a jump target
  Delete an unnecessary local variable
  Split a condition check

 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 17 ++++----------
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 31 ++++++++++++--------------
 2 files changed, 18 insertions(+), 30 deletions(-)

-- 
2.14.2

