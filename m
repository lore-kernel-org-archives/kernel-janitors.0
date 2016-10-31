From: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Date: Mon, 31 Oct 2016 06:16:46 +0000
Subject: Re: [PATCH] cxl: Fix memory allocation failure test
Message-Id: <99cf0e87-a130-446b-0628-9fba55098dda@au1.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030193557.23862-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030193557.23862-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, imunsie@au1.ibm.com, fbarrat@linux.vnet.ibm.com
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

On 31/10/16 06:35, Christophe JAILLET wrote:
> 'cxl_context_alloc()' does not return an error pointer. It is just a
> shortcut for a call to 'kzalloc' with 'sizeof(struct cxl_context)' as the
> size parameter.
>
> So its return value should be compared with NULL.
> While fixing it, simplify a bit the code.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>

> ---
> un-compiled because I don't have the required  cross build environment.

Compiles on my system!

-- 
Andrew Donnellan              OzLabs, ADL Canberra
andrew.donnellan@au1.ibm.com  IBM Australia Limited

