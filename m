From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 17 Sep 2012 07:11:42 +0000
Subject: Re: drivers/gpu/drm/vmwgfx/vmwgfx_resource.c: alloc with no test
Message-Id: <20120917071142.GG29883@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120917003446.GA12394@localhost>
In-Reply-To: <20120917003446.GA12394@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thomas,

On Mon, Sep 17, 2012 at 08:46:27AM +0200, Thomas Hellstrom wrote:
> Hi,
> 
> You're right. The line below tests for sizes instead of offsets. I'm
> about to fix this in an upcoming patch
> series, so I won't submit a separate patch for this.
 
A separate fix would be more suitable for -stable backport?

Thanks,
Fengguang

> On 09/17/2012 02:34 AM, Fengguang Wu wrote:
> >Hi Thomas,
> >
> >FYI, coccinelle warns about
> >
> >drivers/gpu/drm/vmwgfx/vmwgfx_resource.c:1355:1-13: alloc with no test, possible model on line 1402
> >
> >vim +1355 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> >   1345	
> >   1346		memcpy(srf->mip_levels, req->mip_levels, sizeof(srf->mip_levels));
> >   1347		srf->num_sizes = num_sizes;
> >   1348		user_srf->size = size;
> >   1349	
> >   1350		srf->sizes = kmalloc(srf->num_sizes * sizeof(*srf->sizes), GFP_KERNEL);
> >   1351		if (unlikely(srf->sizes = NULL)) {
> >   1352			ret = -ENOMEM;
> >   1353			goto out_no_sizes;
> >   1354		}
> >>1355		srf->offsets = kmalloc(srf->num_sizes * sizeof(*srf->offsets),
> >   1356				       GFP_KERNEL);
> >   1357		if (unlikely(srf->sizes = NULL)) {
> >   1358			ret = -ENOMEM;
> >   1359			goto out_no_offsets;
> >   1360		}
> >   1361	
> >   1362		user_sizes = (struct drm_vmw_size __user *)(unsigned long)
> >   1363		    req->size_addr;
> >   1364	
> >   1365		ret = copy_from_user(srf->sizes, user_sizes,
> >
> >Which is likely a copy/paste error introduced by commit
> >
> >         commit 5bb39e818169783ee17ddbbefbd7bd16a4383fec
> >         Author:     Thomas Hellstrom <thellstrom@vmware.com>
> >         AuthorDate: Tue Oct 4 20:13:33 2011 +0200
> >         Commit:     Dave Airlie <airlied@redhat.com>
> >         CommitDate: Wed Oct 5 10:17:31 2011 +0100
> >
> >Thanks,
> >Fengguang
