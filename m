From: David Miller <davem@davemloft.net>
Date: Wed, 22 Mar 2017 18:13:16 +0000
Subject: Re: [PATCH] mlxsw: spectrum: fix swapped order of arguments packets and bytes
Message-Id: <20170322.111316.704822691734054909.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170320113722.30311-1-colin.king@canonical.com>
In-Reply-To: <20170320113722.30311-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Mar 2017 11:37:22 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The arguments packets and bytes to call mlxsw_sp_acl_rule_get_stats are
> in the wrong order. Fix this by swapping them.
> 
> Detected by CoverityScan, CID#1419705 ("Arguments in wrong order")
> 
> Fixes: 7c1b8eb175b69add8ea ("mlxsw: spectrum: Add support for TC flower offload statistics")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
