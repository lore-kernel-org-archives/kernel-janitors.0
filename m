From: David Miller <davem@davemloft.net>
Date: Fri, 03 Apr 2020 01:00:20 +0000
Subject: Re: [PATCH][next] mlxsw: spectrum_trap: fix unintention integer overflow on left shift
Message-Id: <20200402.180020.506846856059927664.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402144851.565983-1-colin.king@canonical.com>
In-Reply-To: <20200402144851.565983-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  2 Apr 2020 15:48:51 +0100

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

Applied, thanks.
