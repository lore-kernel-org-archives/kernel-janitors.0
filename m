From: Hiroshi Doyu <hdoyu@nvidia.com>
Date: Tue, 24 Jul 2012 08:45:11 +0000
Subject: Re: [PATCH 5/7] drivers/iommu/tegra-smmu.c: remove invalid reference to list iterator variable
Message-Id: <20120724114511.2315bf9f76165bad5af37ce6@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1341747464-1772-1-git-send-email-Julia.Lawall@lip6.fr>
	<1341747464-1772-6-git-send-email-Julia.Lawall@lip6.fr>
	<500D90F9.7030909@wwwdotorg.org>
In-Reply-To: <500D90F9.7030909-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi Julia,

On Mon, 23 Jul 2012 19:59:21 +0200
Stephen Warren <swarren@wwwdotorg.org> wrote:

> On 07/08/2012 05:37 AM, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Julia,
> 
> It looks like this patch hasn't seen any replies since you didn't CC the
> maintainers of this code. I've CC'd them now.
> 
> > If list_for_each_entry, etc complete a traversal of the list, the iterator
> > variable ends up pointing to an address at an offset from the list head,
> > and not a meaningful structure.  Thus this value should not be used after
> > the end of the iterator.  Replace c->dev by dev, which is the value that
> > c->dev has been compared to.
> > 
> > This problem was found using Coccinelle (http://coccinelle.lip6.fr/).
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Acked-by: Stephen Warren <swarren@wwwdotorg.org>

Acked-by: Hiroshi DOYU <hdoyu@nvidia.com>
Ok to me too. Thanks.
