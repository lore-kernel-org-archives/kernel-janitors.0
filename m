From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Mon, 13 Aug 2018 11:23:13 +0000
Subject: Re: powerpc: fix size calculation using resource_size()
Message-Id: <41ptdG50hMz9sCn@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180808115724.gh5mbbi6twzqbqao@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jia Hongtao <B38951@freescale.com>
Cc: Rob Herring <robh@kernel.org>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org

On Wed, 2018-08-08 at 11:57:24 UTC, Dan Carpenter wrote:
> The problem is the the calculation should be "end - start + 1" but the
> plus one is missing in this calculation.
> 
> Fixes: 8626816e905e ("powerpc: add support for MPIC message register API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c42d3be0c06f0c1c416054022aa535

cheers
