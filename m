From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jan 2018 19:36:09 +0000
Subject: Re: [PATCH][next] mlxsw: spectrum: make function mlxsw_sp_kvdl_part_occ static
Message-Id: <20180119.143609.1806788195162325204.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180117105746.19646-1-colin.king@canonical.com>
In-Reply-To: <20180117105746.19646-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 10:57:46 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function mlxsw_sp_kvdl_part_occ  is local to the source and does
> not need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'mlxsw_sp_kvdl_part_occ' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
