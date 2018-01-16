From: David Miller <davem@davemloft.net>
Date: Tue, 16 Jan 2018 19:27:54 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: qdiscs: Make function mlxsw_sp_qdisc_prio_unoffload static
Message-Id: <20180116.142754.239112644840195298.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516012983-994-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516012983-994-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 15 Jan 2018 10:43:03 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c:464:1: warning:
>  symbol 'mlxsw_sp_qdisc_prio_unoffload' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
