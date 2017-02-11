From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Sat, 11 Feb 2017 15:32:59 +0000
Subject: Re: [PATCH 4/5] IB/hfi1: Use memdup_user() rather than duplicating its implementation in hfi1_user_s
Message-Id: <477c8499-93ad-253d-aa2b-8f209ecfad62@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
 <b19e44b3-601f-c642-b8d3-12c000511ce2@users.sourceforge.net>
In-Reply-To: <b19e44b3-601f-c642-b8d3-12c000511ce2-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 02/10/2017 04:04 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Feb 2017 21:01:55 +0100
>
> Reuse existing functionality from memdup_user() instead of keeping
> duplicate source code.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks for the patch, but this one is already taken care of along with 
other similar uses of kmalloc/copy:

http://marc.info/?l=linux-rdma&m8656088729538&w=2

Will review the rest of the patch series soon.

-Denny
