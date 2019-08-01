From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 01 Aug 2019 08:31:44 +0000
Subject: [PATCH 0/2] powerpc/xive: 2 small tweaks in 'xive_irq_bitmap_add()'
Message-Id: <cover.1564647619.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, allison@lohutok.net, tglx@linutronix.de, clg@kaod.org, groug@kaod.org
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

The first patch uses GFP_KERNEL instead of GFP_ATOMIC.
The 2nd adds a check for memory allocation failure.

Christophe JAILLET (2):
  powerpc/xive: Use GFP_KERNEL instead of GFP_ATOMIC in
    'xive_irq_bitmap_add()'
  powerpc/xive: Add a check for memory allocation failure

 arch/powerpc/sysdev/xive/spapr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.20.1
