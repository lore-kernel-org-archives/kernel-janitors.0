From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 24 Oct 2017 08:09:19 +0000
Subject: Re: [4/5] powerpc-pseries: Return directly after a failed kzalloc_node() in iommu_pseries_alloc_grou
Message-Id: <3yLmBm2p69z9s9Y@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <a824fe65-1708-16ba-68d6-df0f73e0f49a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Andrew Morton <akpm@linux-foundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, David Gibson <david@gibson.dropbear.id.au>, Doug Ledford <dledford@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, 2017-10-18 at 19:26:10 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Oct 2017 20:15:32 +0200
> 
> Return directly after a call of the function "kzalloc_node" failed
> at the beginning.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/4dd9eab39c71628d113168a01473ee

cheers
