From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 20 Mar 2018 10:15:29 +0000
Subject: Re: [3/3] powernv/pci: Improve a size determination in pnv_pci_init_ioda_phb()
Message-Id: <40582V075Xz9sZC@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <03b68902-629e-65ab-a5e8-d90a3613f596@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>, Alistair Popple <alistair@popple.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Gavin Shan <gwshan@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Russell Currey <ruscur@russell.cc>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2017-10-17 at 15:40:17 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 17 Oct 2017 17:18:10 +0200
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a0828cf57acce9bf941539e1f633e9

cheers
