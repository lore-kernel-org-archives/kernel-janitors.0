From: Julia Lawall <julia@diku.dk>
Date: Mon, 22 Aug 2011 10:37:08 +0000
Subject: Re: [PATCH 2/2] arch/powerpc/platforms/powermac/setup.c: add missing
Message-Id: <Pine.LNX.4.64.1108221236260.10948@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1313943001-12884-2-git-send-email-julia@diku.dk>
In-Reply-To: <1313943001-12884-2-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 22 Aug 2011, walter harms wrote:

> 
> >>>  arch/powerpc/platforms/powermac/setup.c |    8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
> >>> index 96580b1..970ea1d 100644
> >>> --- a/arch/powerpc/platforms/powermac/setup.c
> >>> +++ b/arch/powerpc/platforms/powermac/setup.c
> >>> @@ -494,11 +494,15 @@ static int __init pmac_declare_of_platform_devices(void)
> >>>  		return -1;
> >>>  
> >>>  	np = of_find_node_by_name(NULL, "valkyrie");
> >>> -	if (np)
> >>> +	if (np) {
> >>>  		of_platform_device_create(np, "valkyrie", NULL);
> >>> +		of_node_put(np);
> >>> +	}
> >>>  	np = of_find_node_by_name(NULL, "platinum");
> >>> -	if (np)
> >>> +	if (np) {
> >>>  		of_platform_device_create(np, "platinum", NULL);
> >>> +		of_node_put(np);
> >>> +	}
> >>>          np = of_find_node_by_type(NULL, "smu");
> >>>          if (np) {
> >>>  		of_platform_device_create(np, "smu", NULL);
> >>>
> >>
> >>
> >> hi,
> >> it seems save to call of_node_put(np) with np=NULL, i assume the same is true
> >> for of_platform_device_create().
> >>
> >> so the code collapses to:
> >>
> >> _test_node(char *name)
> >> {
> >>  struct device_node *np;
> >>  np = of_find_node_by_name(NULL, name);
> >>  of_platform_device_create(np, name, NULL);
> > 
> > of_platform_device_create seems to do a lot of work if np is NULL.  It 
> > returns NULL in the end, as far as I can see, but a lot of function calls 
> > are required.
> > 
> 
> Yes but it is called only once at init.
> but the whole code makes me burp, even if something is found he continues
> to search.

Good point.

> How do the other driver handle this ?

I will take a look.

julia
