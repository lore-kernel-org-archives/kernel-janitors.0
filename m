From: Dan Carpenter <error27@gmail.com>
Date: Thu, 10 Jun 2010 09:32:30 +0000
Subject: Re: [patch] enic: cleanup vic_provinfo_alloc()
Message-Id: <20100610093230.GM5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100610075903.GL5483@bicker> <4C10AEE9.4090804@bfs.de>
In-Reply-To: <4C10AEE9.4090804@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Scott Feldman <scofeldm@cisco.com>, Vasanthy Kolluri <vkolluri@cisco.com>, Roopa Prabhu <roprabhu@cisco.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 10, 2010 at 11:22:49AM +0200, walter harms wrote:
> > +	vp = kzalloc(VIC_PROVINFO_MAX_DATA, flags);
> > +	if (!vp)
> >  		return NULL;
> >  
> >  	memcpy(vp->oui, oui, sizeof(vp->oui));
> > --
> 
> 
> This looks like memdup() ?
> 

No.  VIC_PROVINFO_MAX_DATA is larger than sizeof(vp->oui).

regards,
dan carpenter

> re,
>  wh
