From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Thu, 08 Jun 2017 04:07:36 +0000
Subject: Re: cxl: Unlock on error in probe
Message-Id: <3wjsMX598Gz9s9Y@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170505053458.csrwd2kjber44r4o@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>

On Fri, 2017-05-05 at 05:34:58 UTC, Dan Carpenter wrote:
> We should unlock if get_cxl_adapter() fails.
> 
> Fixes: 594ff7d067ca ("cxl: Support to flash a new image on the adapter from a guest")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/58d876fa7181f2f393190c1d32c056

cheers
