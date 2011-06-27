From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jun 2011 04:59:54 +0000
Subject: Re: [patch] nouveau: free the memory in nouveau_gart_manager_del()
Message-Id: <Pine.LNX.4.64.1106270659200.3775@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110625055324.GS14591@shale.localdomain>
In-Reply-To: <20110625055324.GS14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 27 Jun 2011, walter harms wrote:

> great bug to make sure that mem is never freed :)
> 
> @julia,
> 
> can coccinelle find this type  ?

Yes, I looked and didn't find any other than this one.

julia

> they will never cause an error just a memleack that never
> will be notices before its to late.
> 
> re,
>  wh
> 
> 
> Am 25.06.2011 07:53, schrieb Dan Carpenter:
> > In the original code the kfree() doesn't do anything because
> > "mem->mm_node" has been set to NULL.  This was introduced in
> > d2f96666c56a "drm/nouveau: create temp vmas for both src and dst of
> > bo moves"
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > index 765f0e5..ab79bf8 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> > @@ -846,8 +846,8 @@ nouveau_gart_manager_del(struct ttm_mem_type_manager *man,
> >  			 struct ttm_mem_reg *mem)
> >  {
> >  	nouveau_mem_node_cleanup(mem->mm_node);
> > -	mem->mm_node = NULL;
> >  	kfree(mem->mm_node);
> > +	mem->mm_node = NULL;
> >  }
> >  
> >  static int
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
