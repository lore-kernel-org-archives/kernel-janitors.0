From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 01 Jul 2010 18:27:24 +0000
Subject: Re: [PATCH 10/25] scsi/sg: remove casts from void*
Message-Id: <20100701182724.GA22466@shinshilla>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277990204-22157-1-git-send-email-segooon@gmail.com>
 <20100701173805.GW19184@bicker>
In-Reply-To: <20100701173805.GW19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Andrew

On Thu, Jul 01, 2010 at 19:38 +0200, Dan Carpenter wrote:
> On Thu, Jul 01, 2010 at 05:16:43PM +0400, Kulikov Vasiliy wrote:
> > -	Sg_fd *sfp;
> > +	Sg_fd *sfp = filp->private_data;
>                      ^^^^^^^^^^^^^^^^^^
> 	Dereferenced here.
> 
> >  	unsigned long req_sz, len, sa;
> >  	Sg_scatter_hold *rsv_schp;
> >  	int k, length;
> >  
> > -	if ((!filp) || (!vma) || (!(sfp = (Sg_fd *) filp->private_data)))
> > +	if ((!filp) || (!vma) || !(sfp))
>              ^^^^^
> 
> 	Checked here.
Oops, I've loosed it... The problem is that this driver is not even compileable.
Patch v2 coming soon)
