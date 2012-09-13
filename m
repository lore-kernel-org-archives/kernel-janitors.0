From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Sep 2012 14:42:05 +0000
Subject: Re: [PATCH 1/9] drivers/block/aoe/aoecmd.c: Remove useless kfree
Message-Id: <20120913144205.GN19396@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347462407-13499-1-git-send-email-peter.senna@gmail.com>
 <5051E9F3.4020708@bfs.de>
In-Reply-To: <5051E9F3.4020708@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, "Ed L. Cashin" <ecashin@coraid.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 13, 2012 at 04:13:07PM +0200, walter harms wrote:
> > diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
> > index 5461faa..cbb0521 100644
> > --- a/drivers/block/aoe/aoecmd.c
> > +++ b/drivers/block/aoe/aoecmd.c
> > @@ -1257,7 +1257,6 @@ addtgt(struct aoedev *d, char *addr, ulong nframes)
> >  	}
> >  	t = kcalloc(1, sizeof *t, GFP_ATOMIC);
> >  	if (!t) {
> > -		kfree(t);
> >  		printk(KERN_INFO "aoe: cannot allocate memory to add target\n");
> >  		return NULL;
> >  	}
> > 
> 
> 
> this should read kzalloc(sizeof (*t), GFP_ATOMIC);
> see: [PATCH 3/9] drivers/gpu/drm/ttm/ttm_page_alloc_dma.c: Remove useless kfree

I already fixed this one last week actually.  I did it the way
Walter suggests.

regards,
dan carpenter

