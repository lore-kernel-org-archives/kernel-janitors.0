From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 08:23:29 +0000
Subject: [PATCH 0/2] powerpc/82xx: Adjustments for pq2ads_pci_init_irq()
Message-Id: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Enrico Weigelt <lkml@metux.net>, Kate Stewart <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 10:16:32 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary of_node_put() call
  Use common error handling code

 arch/powerpc/platforms/82xx/pq2ads-pci-pic.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

--
2.23.0
