From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Aug 2010 19:46:23 +0000
Subject: Re: [PATCH 4/5] drivers/char/agp: Eliminate memory leak
Message-Id: <Pine.LNX.4.64.1008242146040.14009@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008241639130.15172@ask.diku.dk>
 <20100824171644.GL29330@bicker>
In-Reply-To: <20100824171644.GL29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 24 Aug 2010, Dan Carpenter wrote:

> On Tue, Aug 24, 2010 at 04:39:29PM +0200, Julia Lawall wrote:
> >  
> > -	error = agp_add_bridge(bridge);
> > +	return agp_add_bridge(bridge);
> >  
> 
> 	error = agp_add_bridge(bridge);
> 	if (error)
> 		goto fail;
> 	return 0;

Good point.  I will send another patch.

julia

> >  fail:
> > +	kfree(fake_bridge_dev);
> >  	return error;
> >  }
> >  
> 
> regards,
> dan carpenter
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
