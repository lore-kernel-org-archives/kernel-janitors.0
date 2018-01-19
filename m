From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jan 2018 19:52:23 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: Make function mlxsw_sp_kvdl_part_occ() static
Message-Id: <20180119.145223.1510224918323584494.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516159653-109657-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516159653-109657-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jiri@mellanox.com, idosch@mellanox.com, arkadis@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 03:27:33 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:289:5: warning:
>  symbol 'mlxsw_sp_kvdl_part_occ' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
