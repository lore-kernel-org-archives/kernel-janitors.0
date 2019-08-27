From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 12:40:42 +0000
Subject: [PATCH 0/2] PowerPC-pSeries: Adjustments for dlpar_store()
Message-Id: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frank.rowand@sony.com>, Gen Zhang <blackgod016574@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Nathan Lynch <nathanl@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 14:33:21 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an unnecessary kfree() call
  Delete an error message for a failed string duplication

 arch/powerpc/platforms/pseries/dlpar.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--
2.23.0
