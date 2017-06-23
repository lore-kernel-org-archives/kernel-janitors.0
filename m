From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 23 Jun 2017 16:13:39 +0000
Subject: [RFC] MIPS: OCTEON: Spurious code in 'arch/mips/cavium-octeon/octeon-usb.c'
Message-Id: <20170623161339.7159-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr, ralf@linux-mips.org, james.hogan@imgtec.com, Steven.Hill@cavium.com, david.daney@cavium.com
Cc: linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org

Hi,

The coccinelle script located at https://github.com/coccinelle/coccinellery/blob/master/notnull/notnull2.cocci
triggered a spurious code in 'arch/mips/cavium-octeon/octeon-usb.c'

It seems that 'dwc3_octeon_device_init()' can never return success (i.e. 0).
The 'do...while' loop exits only if 'node = NULL'. But, in such a case,
-ENODEV will be returned at the beginning of the loop.

I may miss something obvious, but I can't see how this code is supposed to
work.

Best regards.

CJ
