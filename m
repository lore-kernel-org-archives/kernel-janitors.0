From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 22 Nov 2016 00:34:18 +0000
Subject: Re: cxl: Fix error handling
Message-Id: <3tN60p71nwz9s5w@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20161030213451.24624-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2016-10-30 at 21:34:51 UTC, Christophe Jaillet wrote:
> 'cxl_dev_context_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> Acked-by: Ian Munsie <imunsie@au1.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/28e323e5a0b21b3665eb6e136ca8bb

cheers
