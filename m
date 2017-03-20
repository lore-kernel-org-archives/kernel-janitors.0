From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 20 Mar 2017 12:20:42 +0000
Subject: Re: [PATCH] mlxsw: spectrum: fix swapped order of arguments packets and bytes
Message-Id: <20170320122042.GA1883@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170320113722.30311-1-colin.king@canonical.com>
In-Reply-To: <20170320113722.30311-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Mon, Mar 20, 2017 at 12:37:22PM CET, colin.king@canonical.com wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>The arguments packets and bytes to call mlxsw_sp_acl_rule_get_stats are
>in the wrong order. Fix this by swapping them.
>
>Detected by CoverityScan, CID#1419705 ("Arguments in wrong order")
>
>Fixes: 7c1b8eb175b69add8ea ("mlxsw: spectrum: Add support for TC flower offload statistics")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
