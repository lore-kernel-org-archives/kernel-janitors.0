From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 27 Jan 2017 00:40:36 +0000
Subject: Re: powerpc/powernv/pci: Use kmalloc_array() in two functions
Message-Id: <3v8g1d0rqgz9tk0@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <817567b2-cdf6-7f7b-6041-9a026ea10a0f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Alistair Popple <alistair@popple.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Gavin Shan <gwshan@linux.vnet.ibm.com>, Ian Munsie <imunsie@au1.ibm.com>, Paul Mackerras <paulus@samba.org>, Wei Yang <weiyang@linux.vnet.ibm.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>

On Wed, 2016-08-24 at 20:36:54 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 24 Aug 2016 22:26:37 +0200
> 
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus reuse the corresponding function "kmalloc_array".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/fb37e12896c1ba0407012fe8cdc0b0

cheers
