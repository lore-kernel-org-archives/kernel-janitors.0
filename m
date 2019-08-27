From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 27 Aug 2019 16:27:20 +0000
Subject: Re: [PATCH] RDMA/iwpm: Delete =?utf-8?Q?un?= =?utf-8?Q?necessary_checks_before_the_macro_call_=E2=80
Message-Id: <20190827162720.GA19357@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <16df4c50-1f61-d7c4-3fc8-3073666d281d@web.de>
In-Reply-To: <16df4c50-1f61-d7c4-3fc8-3073666d281d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Johannes Berg <johannes.berg@intel.com>, Leon Romanovsky <leon@kernel.org>, Parav Pandit <parav@mellanox.com>, Steve Wise <swise@opengridcomputing.com>, Tatyana Nikolova <Tatyana.E.Nikolova@intel.com>, YueHaibing <yuehaibing@huawei.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Aug 21, 2019 at 07:47:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 21 Aug 2019 19:30:09 +0200
> 
> The dev_kfree_skb() function performs also input parameter validation.
> Thus the test around the shown calls is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/core/iwpm_msg.c  | 9 +++------
>  drivers/infiniband/core/iwpm_util.c | 9 +++------
>  2 files changed, 6 insertions(+), 12 deletions(-)

Applied to for-next, thanks

Jason
