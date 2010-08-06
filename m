From: "Tung, Chien Tin" <chien.tin.tung@intel.com>
Date: Fri, 06 Aug 2010 10:21:31 +0000
Subject: RE: [PATCH 4/42 v2] drivers/infiniband/hw/nes: Adjust confusing if
Message-Id: <2EFBCAEF10980645BBCFB605689E08E9049F35CB95@azsmsx506.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052217430.31692@ask.diku.dk>
 <20100805234831.GK9031@bicker>
In-Reply-To: <20100805234831.GK9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: "Latif, Faisal" <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, "Hefty, Sean" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> I think the white space is meant to look like this.  I did look at
> whether the "sq_cqes = 0;" should only be done if netif_queue_stopped().
> In the end I decided this was what was intended, but it would be
> better if someone more familiar with the code reviewed it.
> 
> Reported-by: Julia Lawall <julia@diku.dk>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: changed different indents

Looks to me.  Thanks for the patch.

Acked-by: Chien Tung <chien.tin.tung@intel.com>

Chien




