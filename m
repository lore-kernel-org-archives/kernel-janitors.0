From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Dec 2012 08:59:15 +0000
Subject: Re: [patch] aoe: use after free in aoedev_by_aoeaddr()
Message-Id: <20121210085915.GP6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121207061943.GC18220@elgon.mountain>
 <A578B7C2-D1FA-4F14-999F-E4CAA4816BB3@coraid.com>
In-Reply-To: <A578B7C2-D1FA-4F14-999F-E4CAA4816BB3@coraid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Cashin <ecashin@coraid.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Dec 07, 2012 at 07:20:10AM -0600, Ed Cashin wrote:
> On Dec 7, 2012, at 1:19 AM, Dan Carpenter wrote:
> 
> > We should return NULL on failure instead of returning a freed pointer.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
> > index e66ccbf..98f2965 100644
> > --- a/drivers/block/aoe/aoedev.c
> > +++ b/drivers/block/aoe/aoedev.c
> > @@ -461,6 +461,7 @@ aoedev_by_aoeaddr(ulong maj, int min, int do_alloc)
> > 	d->targets = kcalloc(NTARGETS, sizeof(*d->targets), GFP_ATOMIC);
> > 	if (!d->targets) {
> > 		kfree(d);
> > +		d = NULL;
> > 		goto out;
> > 	}
> > 	d->ntargets = NTARGETS;
> 
> 
> That looks good, thanks.
> 
> If smatch found that, then I have to figure out what I'm doing wrong, because
> I ran sparse and smatch on the latest patch series until they were clean.  :/

It's one of the checks which is only enabled with the --spammy
option.

regards,
dan carpenter

