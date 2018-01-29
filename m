From: Jonathan Toppins <jtoppins@redhat.com>
Date: Mon, 29 Jan 2018 14:19:15 +0000
Subject: Re: [PATCH 0/2] RDMA/bnxt_re: Adjustments for bnxt_qplib_alloc_dpi_tbl()
Message-Id: <efe2cc42-f0dc-4102-b8c8-e7edb79f9c81@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <19c755a6-8c52-bbd5-a425-48fc08cecd4f@users.sourceforge.net>
In-Reply-To: <19c755a6-8c52-bbd5-a425-48fc08cecd4f-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Somnath Kotur <somnath.kotur-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sriharsha Basavapatna <sriharsha.basavapatna-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Himanshu Jha <himanshujha199640-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On 01/27/2018 03:15 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 27 Jan 2018 21:10:12 +0100
> 
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete two error messages for a failed memory allocation
>   Use common error handling code
> 
>  drivers/infiniband/hw/bnxt_re/qplib_res.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 

I like it.

Acked-by: Jonathan Toppins <jtoppins@redhat.com>
