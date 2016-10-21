From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 21 Oct 2016 05:03:27 +0000
Subject: [PATCH 0/6] FRV-setup: Fine-tuning for six function implementations
Message-Id: <1405b16a-c470-531d-458d-fb6042b93230@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 20 Oct 2016 22:44:22 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use seq_puts() in show_cpuinfo()
  Use seq_putc() in show_cpuinfo()
  Add some spaces for better code readability
  Move "else" closer to a brace
  Fix indentation in two lines
  Move statements for "case" to separate lines

 arch/frv/kernel/setup.c | 62 +++++++++++++++++++++++++------------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

-- 
2.10.1

