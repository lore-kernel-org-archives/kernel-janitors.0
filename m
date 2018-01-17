From: Arkadi Sharshevsky <arkadis@mellanox.com>
Date: Wed, 17 Jan 2018 13:18:42 +0000
Subject: Re: [PATCH net-next] mlxsw: spectrum: Make function mlxsw_sp_kvdl_part_occ() static
Message-Id: <5ed5784c-f997-60eb-84f0-5e9996406fbf@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516159653-109657-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516159653-109657-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 01/17/2018 05:27 AM, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:289:5: warning:
>  symbol 'mlxsw_sp_kvdl_part_occ' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Arkadi Sharshevsky <arkadis@mellanox.com>

> ---
>  drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
> index cfacc17..55f9d2d 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
> @@ -286,7 +286,7 @@ static void mlxsw_sp_kvdl_parts_fini(struct mlxsw_sp *mlxsw_sp)
>  		mlxsw_sp_kvdl_part_fini(mlxsw_sp, i);
>  }
>  
> -u64 mlxsw_sp_kvdl_part_occ(struct mlxsw_sp_kvdl_part *part)
> +static u64 mlxsw_sp_kvdl_part_occ(struct mlxsw_sp_kvdl_part *part)
>  {
>  	unsigned int nr_entries;
>  	int bit = -1;
> 
