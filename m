From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Aug 2011 11:26:49 +0000
Subject: Re: [PATCH 1/2] arch/powerpc/platforms/cell/iommu.c: add missing of_node_put
Message-Id: <201108291326.49561.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313943001-12884-1-git-send-email-julia@diku.dk>
In-Reply-To: <1313943001-12884-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@lists.ozlabs.org, cbe-oss-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On Sunday 21 August 2011, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> np is initialized to the result of calling a function that calls
> of_node_get, so of_node_put should be called before the pointer is dropped.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e,e1,e2;
> @@
> 
> * e = \(of_find_node_by_type\|of_find_node_by_name\)(...)
>   ... when != of_node_put(e)
>       when != true e = NULL
>       when != e2 = e
>   e = e1
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
Acked-by: Arnd Bergmann <arnd@arndb.de>
