From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:00:13 +0000
Subject: [PATCH 0/5] PowerPC: Fine-tuning for three function implementations
Message-Id: <4c0babe9-0192-1a99-7ff3-5028cc69325d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Scott Wood <scottwood@freescale.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:44:22 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in mpic_init()
  Use kmalloc_array() in ppc4xx_setup_msi_irqs()
  Use kmalloc_array() in hsta_msi_probe()
  Rename jump labels in hsta_msi_probe()
  Move three assignments in hsta_msi_probe()

 arch/powerpc/sysdev/mpic.c            |  5 +++--
 arch/powerpc/sysdev/ppc4xx_hsta_msi.c | 26 +++++++++++++-------------
 arch/powerpc/sysdev/ppc4xx_msi.c      |  4 +++-
 3 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.9.3

