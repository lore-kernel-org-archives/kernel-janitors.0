From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 12 Mar 2018 12:24:59 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum_kvdl: Make some functions static
Message-Id: <20180312122459.GC2111@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1520857524-163487-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1520857524-163487-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, rkadi Sharshevsky <arkadis@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Mon, Mar 12, 2018 at 01:25:24PM CET, weiyongjun1@huawei.com wrote:
>Fixes the following sparse warnings:
>
>drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:371:5: warning:
> symbol 'mlxsw_sp_kvdl_single_occ_get' was not declared. Should it be static?
>drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:384:5: warning:
> symbol 'mlxsw_sp_kvdl_chunks_occ_get' was not declared. Should it be static?
>drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:397:5: warning:
> symbol 'mlxsw_sp_kvdl_large_chunks_occ_get' was not declared. Should it be static?
>
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>

Thanks!
