From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 24 Oct 2006 17:51:23 +0000
Subject: Re: [KJ] [Patch] kmemdup() cleanup in drivers/pci/
Message-Id: <20061024175123.GA5337@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2006 at 06:36:35PM +0200, walter harms wrote:
> to add some cream you may like to use (i did not check the types):
> ret = kmemdup(des, sizeof(*des), GFP_KERNEL);
> that make it independet of the type.

When this was last discussed on l-k, it was shown that some prefer

	sizeof(*p)

some
	sizeof(struct foo)

so patches to make one style dominant are not welcome.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
