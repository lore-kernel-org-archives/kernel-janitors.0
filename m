From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 29 Oct 2006 19:02:35 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/message
Message-Id: <20061029190235.GB4900@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2006 at 02:42:37PM -0600, Matthew Wilcox wrote:
> On Mon, Oct 23, 2006 at 10:19:10PM +0200, Eric Sesterhenn wrote:
> >  	if (mpt_config(ioc, &cfg) = 0) {
> > -		mem = kmalloc(iocpage3sz, GFP_ATOMIC);
> > +		mem = kmemdup((u8 *) pIoc3, iocpage3sz, GFP_ATOMIC);
> >  		if (mem) {
> > -			memcpy(mem, (u8 *)pIoc3, iocpage3sz);
> >  			ioc->raid_data.pIocPg3 = (IOCPage3_t *) mem;
>
> I don't think the cast is really needed

Agree. {} also became unneeded. Fixed locally.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
