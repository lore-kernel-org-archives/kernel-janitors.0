From: Chien Tin Tung <chien.tin.tung@intel.com>
Date: Tue, 05 Sep 2017 14:40:41 +0000
Subject: Re: [PATCH][V2] RDMA/nes: do not leak uninitialized resp.reserved to userspace Content-Type: text/pl
Message-Id: <20170905144041.GA13068@ctung-MOBL3.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170904133705.3980-1-colin.king@canonical.com>
In-Reply-To: <20170904133705.3980-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Faisal Latif <faisal.latif-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, Sep 04, 2017 at 02:37:05PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> resp.reserved has not been initialized and so the copy_to_user (via
> ib_copy_to_udata) is copying uninitialized data from the stack back
> to user space which is a potential information leak. Fix this by
> initializing all of resp to zero.

Reserved field is not copied as the length of reserved is subtracted
from the size of resp and passed to ib_copy_to_udata.

 if (ib_copy_to_udata(udata, &resp, sizeof resp - sizeof resp.reserved)) {


This patch is not necessary.

Chien
