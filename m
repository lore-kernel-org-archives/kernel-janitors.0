From: Catalin Marinas <catalin.marinas@arm.com>
Date: Mon, 14 Aug 2017 14:38:04 +0000
Subject: Re: [PATCH 1/2] kmemleak: Delete an error message for a failed memory allocation in two functions
Message-Id: <20170814143804.d66iibto5dacvifk@armageddon.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <301bc8c9-d9f6-87be-ce1d-dc614e82b45b@users.sourceforge.net>
 <986426ab-4ca9-ee56-9712-d06c25a2ed1a@users.sourceforge.net>
 <20170814111430.lskrrg3fygpnyx6v@armageddon.cambridge.arm.com>
 <20170814130220.q5w4fsbngphniqzc@mwanda>
In-Reply-To: <20170814130220.q5w4fsbngphniqzc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Aug 14, 2017 at 04:02:21PM +0300, Dan Carpenter wrote:
> On Mon, Aug 14, 2017 at 12:14:32PM +0100, Catalin Marinas wrote:
> > On Mon, Aug 14, 2017 at 11:35:02AM +0200, SF Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Mon, 14 Aug 2017 10:50:22 +0200
> > > 
> > > Omit an extra message for a memory allocation failure in these functions.
> > > 
> > > This issue was detected by using the Coccinelle software.
> > > 
> > > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > > ---
> > >  mm/kmemleak.c | 5 +----
> > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > 
> > > diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> > > index 7780cd83a495..c6c798d90b2e 100644
> > > --- a/mm/kmemleak.c
> > > +++ b/mm/kmemleak.c
> > > @@ -555,7 +555,6 @@ static struct kmemleak_object *create_object(unsigned long ptr, size_t size,
> > >  
> > >  	object = kmem_cache_alloc(object_cache, gfp_kmemleak_mask(gfp));
> > >  	if (!object) {
> > > -		pr_warn("Cannot allocate a kmemleak_object structure\n");
> > >  		kmemleak_disable();
> > 
> > I don't really get what this patch is trying to achieve. Given that
> > kmemleak will be disabled after this, I'd rather know why it happened.
> 
> kmem_cache_alloc() will generate a stack trace and a bunch of more
> useful information if it fails.  The allocation isn't likely to fail,
> but if it does you will know.  The extra message is just wasting RAM.

Currently kmemleak uses __GFP_NOWARN for its own metadata allocation, so
we wouldn't see the sl*b warnings. I don't fully remember why I went for
this gfp flag, probably not to interfere with other messages printed by
the allocator (kmemleak_alloc is called from within sl*b).

I'm fine to drop __GFP_NOWARN and remove those extra messages.

-- 
Catalin
