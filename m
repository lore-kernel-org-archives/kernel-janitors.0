From: Max Gurtovoy <maxg@mellanox.com>
Date: Thu, 05 Sep 2019 14:59:18 +0000
Subject: Re: [PATCH] nvme: tcp: remove redundant assignment to variable ret
Message-Id: <105245d1-26b7-2e4d-0aad-0ba1b6fe323c@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905143435.2864-1-colin.king@canonical.com>
In-Reply-To: <20190905143435.2864-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 9/5/2019 5:34 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable ret is being initialized with a value that is never read
> and is being re-assigned immediately afterwards. The assignment is
> redundant and hence can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/nvme/host/tcp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 2d8ba31cb691..d91be6ddfe25 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1824,7 +1824,7 @@ static void nvme_tcp_reconnect_or_remove(struct nvme_ctrl *ctrl)
>   static int nvme_tcp_setup_ctrl(struct nvme_ctrl *ctrl, bool new)
>   {
>   	struct nvmf_ctrl_options *opts = ctrl->opts;
> -	int ret = -EINVAL;
> +	int ret;
>   
>   	ret = nvme_tcp_configure_admin_queue(ctrl, new);
>   	if (ret)

Looks fine,

Reviewed-by: Max Gurtovoy <maxg@mellanox.com>
