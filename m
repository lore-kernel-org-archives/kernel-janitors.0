From: David Miller <davem@davemloft.net>
Date: Sun, 03 Jun 2018 14:36:56 +0000
Subject: Re: [PATCH net-next] net/mlx5: Make function mlx5_fpga_tls_send_teardown_cmd() static
Message-Id: <20180603.103656.143543894098036180.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527733872-149077-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527733872-149077-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: borisp@mellanox.com, saeedm@mellanox.com, leon@kernel.org, ilyal@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 02:31:12 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/mellanox/mlx5/core/fpga/tls.c:199:6: warning:
>  symbol 'mlx5_fpga_tls_send_teardown_cmd' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
