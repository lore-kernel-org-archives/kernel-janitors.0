From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Apr 2020 08:46:24 +0000
Subject: Re: [PATCH][next] mlxsw: spectrum_trap: fix unintention integer overflow on left shift
Message-Id: <20200403084624.GA2001@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402144851.565983-1-colin.king@canonical.com>
In-Reply-To: <20200402144851.565983-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Apr 02, 2020 at 03:48:51PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Shifting the integer value 1 is evaluated using 32-bit
> arithmetic and then used in an expression that expects a 64-bit
> value, so there is potentially an integer overflow. Fix this
> by using the BIT_ULL macro to perform the shift and avoid the
> overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 13f2e64b94ea ("mlxsw: spectrum_trap: Add devlink-trap policer support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/mellanox/mlxsw/spectrum_trap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_trap.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_trap.c
> index 9096ffd89e50..fbf714d027d8 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_trap.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_trap.c
> @@ -643,7 +643,7 @@ static int mlxsw_sp_trap_policer_bs(u64 burst, u8 *p_burst_size,
>  {
>  	int bs = fls64(burst) - 1;
>  
> -	if (burst != (1 << bs)) {
> +	if (burst != (BIT_ULL(bs))) {

Please delete the extra parentheses.

	if (burst != BIT_ULL(bs)) {

regards,
dan carpenter
