From: Heiko Stuebner <heiko@sntech.de>
Date: Mon, 14 Jan 2019 10:09:05 +0000
Subject: Re: [PATCH 3/4] drm/rockchip: add missing of_node_put
Message-Id: <10335721.Px6jQUZGiA@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547369264-24831-1-git-send-email-Julia.Lawall@lip6.fr>
 <3397932.PmTvevuZIG@phil> <20190114100556.GC10517@phenom.ffwll.local>
In-Reply-To: <20190114100556.GC10517@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, linux-arm-kernel@lists.infradead.org

Am Montag, 14. Januar 2019, 11:05:56 CET schrieb Daniel Vetter:
> On Sun, Jan 13, 2019 at 07:48:49PM +0100, Heiko Stuebner wrote:
> > Am Sonntag, 13. Januar 2019, 09:47:43 CET schrieb Julia Lawall:
> > > The device node iterators perform an of_node_get on each iteration, so a
> > > jump out of the loop requires an of_node_put.
> > > 
> > > The semantic patch that fixes this problem is as follows
> > > (http://coccinelle.lip6.fr):
> > > 
> > > // <smpl>
> > > @@
> > > expression root,e;
> > > local idexpression child;
> > > iterator name for_each_child_of_node;
> > > @@
> > > 
> > >  for_each_child_of_node(root, child) {
> > >    ... when != of_node_put(child)
> > >        when != e = child
> > > +  of_node_put(child);
> > > ?  break;
> > >    ...
> > > }
> > > ... when != child
> > > // </smpl>
> > > 
> > > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > I've added a fixes+stable tag and applied it to drm-misc-fixes
> 
> All of them or just this one here? These cleanup patches have a high
> chance of falling through cracks, so taking them all usually works out
> better ...

That is the only one I got, so right now I only applied this one in my inbox.
Weekend and such resulted in me not going looking for other ones.

Heiko
