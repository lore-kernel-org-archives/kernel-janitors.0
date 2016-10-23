From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 21:10:14 +0000
Subject: [PATCH 0/2] M68K: Fine-tuning for two function implementations
Message-Id: <cc9b366d-4d5e-3ed6-4665-cbc577c69f74@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-m68k@lists.linux-m68k.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>, Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 23 Oct 2016 23:05:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use seq_puts() in amiga_get_hardware_list()
  Use seq_puts() in atari_get_hardware_list()

 arch/m68k/amiga/config.c | 3 +--
 arch/m68k/atari/config.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.10.1

