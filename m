From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 21 May 2015 21:29:18 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <alpine.DEB.2.10.1505212328500.5370@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>  <1432237849-53947-11-git-send-email-shuey@purdue.edu> <1432242004.20840.68.camel@perches.com>
In-Reply-To: <1432242004.20840.68.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Mike Shuey <shuey@purdue.edu>, oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org



On Thu, 21 May 2015, Joe Perches wrote:

> On Thu, 2015-05-21 at 15:50 -0400, Mike Shuey wrote:
> > Fix many checkpatch.pl warnings.
> []
> > diff --git a/drivers/staging/lustre/lnet/lnet/acceptor.c b/drivers/staging/lustre/lnet/lnet/acceptor.c
> []
> > @@ -99,38 +99,42 @@ lnet_connect_console_error(int rc, lnet_nid_t peer_nid,
> >  	switch (rc) {
> >  	/* "normal" errors */
> >  	case -ECONNREFUSED:
> > -		CNETERR("Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
> > -			libcfs_nid2str(peer_nid),
> > -			&peer_ip, peer_port);
> > +		CNETERR(
> > +			"Connection to %s at host %pI4h on port %d was refused: check that Lustre is running on that node.\n",
> > +			libcfs_nid2str(peer_nid), &peer_ip, peer_port);
>
> These are not improvements and checkpatch messages aren't dicta.
>
> Please don't convert code unless the conversion makes it better
> for a human reader.
>
> These don't.

I haven't looked into it, but perhaps there is a standard kernel printing
function that these could be converted to directly?

julia
