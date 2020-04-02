From: Ido Schimmel <idosch@mellanox.com>
Date: Thu, 02 Apr 2020 15:48:59 +0000
Subject: Re: [PATCH][next] mlxsw: spectrum_trap: fix unintention integer overflow on left shift
Message-Id: <20200402154859.GA2453139@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402144851.565983-1-colin.king@canonical.com>
In-Reply-To: <20200402144851.565983-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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

For net:

Reviewed-by: Ido Schimmel <idosch@mellanox.com>
Tested-by: Ido Schimmel <idosch@mellanox.com>

Thanks
