From: Neil Brown <neilb@suse.de>
Date: Wed, 10 Jun 2015 20:38:26 +0000
Subject: Re: [PATCH] md: fix a build warning
Message-Id: <20150611063826.78ea7931@home.neil.brown.name>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433949658-8455-1-git-send-email-firogm@gmail.com>
	<557874B9.9010500@bfs.de>
	<alpine.DEB.2.10.1506101935390.5463@hadrien>
In-Reply-To: <alpine.DEB.2.10.1506101935390.5463@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: walter harms <wharms@bfs.de>, Firo Yang <firogm@gmail.com>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 10 Jun 2015 19:36:43 +0200 (CEST)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> 
> 
> On Wed, 10 Jun 2015, walter harms wrote:
> 
> >
> >
> > Am 10.06.2015 17:20, schrieb Firo Yang:
> > > Warning like this:
> > >
> > > drivers/md/md.c: In function ‘update_array_info’:
> > > drivers/md/md.c:6394:26: warning: logical not is only applied
> > > to the left hand side of comparison [-Wlogical-not-parentheses]
> > >       !mddev->persistent  != info->not_persistent||
> > >
> > > I fix it by enclosing !mddev->persistent with parentheses
> > >
> > > By the way, I also fixed a line over 80 characters warning outputed
> > > by ./scripts/checkpatch.pl
> > >
> > > Signed-off-by: Firo Yang <firogm@gmail.com>
> > > ---
> > >  drivers/md/md.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/md/md.c b/drivers/md/md.c
> > > index dd85be9..b420d82 100644
> > > --- a/drivers/md/md.c
> > > +++ b/drivers/md/md.c
> > > @@ -6391,9 +6391,10 @@ static int update_array_info(struct mddev *mddev, mdu_array_info_t *info)
> > >  	    mddev->ctime         != info->ctime         ||
> > >  	    mddev->level         != info->level         ||
> > >  /*	    mddev->layout        != info->layout        || */
> > > -	    !mddev->persistent	 != info->not_persistent||
> > > +	    (!mddev->persistent) != info->not_persistent ||
> >
> >
> > this looks odd,
> > would it be possible the check for = instead (and drop the !) ?
> > and it someone care for readability: It would be helpful to
> > make some more ifs here.
> 
> The original issue looks like a false positive.  If all of the other cases
> have no parentheses on the left and use !=, isn't it better to leave the
> code as is?
> 

Leaving the code as it is would leave at least one compiler generating warnings.
I don't like warnings.
So if the compiler can be "fixed" that would be good.  But it seems unlikely.

May we could do:

> > > +	    mddev->persistent != !info->not_persistent ||

That would keep the two "not"s together, avoid the need for parentheses, and
probably avoid the compiler warning.
(I think I had it the way it is because it almost reads 
   " not ...peristent != ... not_persistent"
but that isn't a strong reason)

Firo: Can you confirm that this version doesn't upset the compiler?
If if doesn't I'd definitely prefer this one. (and definitely leave out the
comment change - just change the code)

Thanks,
NeilBrown


> julia
> 
> >
> > re,
> >  wh
> >
> > >  	    mddev->chunk_sectors != info->chunk_size >> 9 ||
> > > -	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT to change */
> > > +	    /* ignore bottom 8 bits of state, and allow SB_BITMAP_PRESENT
> > > +		to change */
> > >  	    ((state^info->state) & 0xfffffe00)
> > >  		)
> > >  		return -EINVAL;
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
