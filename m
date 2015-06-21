From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 21 Jun 2015 10:29:12 +0000
Subject: Re: [PATCH 09/12] staging: lustre: obdclass: Use !x to check for kzalloc failure
Message-Id: <alpine.DEB.2.02.1506211222350.2047@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr> <1434819550-3193-10-git-send-email-Julia.Lawall@lip6.fr> <55868BCE.4060803@bfs.de>
In-Reply-To: <55868BCE.4060803@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Oleg Drokin <oleg.drokin@intel.com>, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

> > @@ -885,7 +885,7 @@ static int lmd_parse_mgssec(struct lustr
> >  		length = tail - ptr;
> >  
> >  	lmd->lmd_mgssec = kzalloc(length + 1, GFP_NOFS);
> > -	if (lmd->lmd_mgssec = NULL)
> > +	if (!lmd->lmd_mgssec)
> >  		return -ENOMEM;
> >  
> >  	memcpy(lmd->lmd_mgssec, ptr, length);
> looks like memdup()

kmemdup has the same length for both calls.  There is kstrndup, but it
recalculates the length, which looks unnecessary here.

julia
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
