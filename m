From: "Steve Wise" <swise@opengridcomputing.com>
Date: Thu, 30 Nov 2017 16:41:50 +0000
Subject: RE: [PATCH] iw_cxgb4: make pointer reg_workq static
Message-Id: <00fe01d369fa$1f325890$5d9709b0$@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171130133006.19699-1-colin.king@canonical.com>
In-Reply-To: <20171130133006.19699-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Colin King' <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, 'Steve Wise' <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, 'Doug Ledford' <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, 'Jason Gunthorpe' <jgg-uk2M96/98Pc@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bharat-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org

> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer reg_workq is local to the source and does not need to be
> in global scope, so make it static.
> 
> Cleans up sparse warning:
> drivers/infiniband/hw/cxgb4/device.c:69:25: warning: symbol 'reg_workq'
> was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Looks correct.  This fixes a recent commit.

Reviewed-by: Steve Wise <swise@opengridcomputing.com>
Fixes: 1c8f1da5d851 ("iw_cxgb4: Fix possible circular dependency locking warning")

Thanks,

Steve.

