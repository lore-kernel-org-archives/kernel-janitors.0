From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 23 Oct 2006 20:42:37 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/message
Message-Id: <20061023204237.GL25210@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2006 at 10:19:10PM +0200, Eric Sesterhenn wrote:
>  	if (mpt_config(ioc, &cfg) = 0) {
> -		mem = kmalloc(iocpage3sz, GFP_ATOMIC);
> +		mem = kmemdup((u8 *) pIoc3, iocpage3sz, GFP_ATOMIC);
>  		if (mem) {
> -			memcpy(mem, (u8 *)pIoc3, iocpage3sz);
>  			ioc->raid_data.pIocPg3 = (IOCPage3_t *) mem;

I don't think the cast is really needed
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
