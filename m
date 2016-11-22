From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 22 Nov 2016 00:34:19 +0000
Subject: Re: cxl: Fix memory allocation failure test
Message-Id: <3tN60q61rdz9t17@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20161030193557.23862-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On Sun, 2016-10-30 at 19:35:57 UTC, Christophe Jaillet wrote:
> 'cxl_context_alloc()' does not return an error pointer. It is just a
> shortcut for a call to 'kzalloc' with 'sizeof(struct cxl_context)' as the
> size parameter.
> 
> So its return value should be compared with NULL.
> While fixing it, simplify a bit the code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> Acked-by: Ian Munsie <imunsie@au1.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/5cd4f5cec2374d2c09299211d2b357

cheers
