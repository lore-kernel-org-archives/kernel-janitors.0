From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Thu, 06 Apr 2017 00:37:50 +0000
Subject: Re: [PATCH 0/5] IB/qib: Fine-tuning for four function implementations
Message-Id: <300e66f1-7a27-8e6f-7ee0-f4998e22b78f@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
In-Reply-To: <c16b18ac-287f-5faf-b79a-c86e2adfa22c-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 04/05/2017 09:50 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 5 Apr 2017 15:34:32 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (5):
>   Use kcalloc() in qib_init_iba7322_funcs()
>   Use kmalloc_array() in qib_init_7322_variables()
>   Use kcalloc() in qib_alloc_devdata()
>   Use kcalloc() in qib_init_pportdata()
>   Adjust two size determinations in qib_init_pportdata()
>
>  drivers/infiniband/hw/qib/qib_iba7322.c | 20 ++++++++++++--------
>  drivers/infiniband/hw/qib/qib_init.c    | 27 +++++++++++++--------------
>  2 files changed, 25 insertions(+), 22 deletions(-)
>

Doug,

I haven't reviewed these in detail yet but seems be along the lines of 
the patchset you decided not to take for cxgb [1]. I recommend not 
picking this up either. If something in here catches our eye Mike or I 
one will Ack it.

[1] http://marc.info/?l=linux-rdma&m9141638506039&w=2

-Denny
