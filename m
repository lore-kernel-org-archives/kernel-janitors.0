From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Fri, 19 Aug 2016 15:42:29 +0000
Subject: RE: [PATCH] IB/qib: Use memdup_user() rather than duplicating its implementation
Message-Id: <32E1700B9017364D9B60AED9960492BC2D0AF84E@fmsmsx120.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <620b3961-6e05-6638-4ca8-18766acc91f4@users.sourceforge.net>
 <32E1700B9017364D9B60AED9960492BC2D0AF815@fmsmsx120.amr.corp.intel.com>
 <20160819154106.GC18515@leon.nu>
In-Reply-To: <20160819154106.GC18515-2ukJVAZIZ/Y@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>

> >
> > The bail_tmp: label is then not needed.
> 
> You still need to free tmp allocation if qib_eeprom_write failed and this is
> your bail_tmp.
> 

Typo.   The bail: label is not needed.

Mike
