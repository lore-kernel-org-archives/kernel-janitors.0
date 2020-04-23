From: Ido Schimmel <idosch@idosch.org>
Date: Thu, 23 Apr 2020 08:06:27 +0000
Subject: Re: [PATCH net] mlxsw: Fix some IS_ERR() vs NULL bugs
Message-Id: <20200423080627.GA3616668@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422093641.GA189235@mwanda>
In-Reply-To: <20200422093641.GA189235@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Apr 22, 2020 at 12:36:41PM +0300, Dan Carpenter wrote:
> The mlxsw_sp_acl_rulei_create() function is supposed to return an error
> pointer from mlxsw_afa_block_create().  The problem is that these
> functions both return NULL instead of error pointers.  Half the callers
> expect NULL and half expect error pointers so it could lead to a NULL
> dereference on failure.
> 
> This patch changes both of them to return error pointers and changes all
> the callers which checked for NULL to check for IS_ERR() instead.
> 
> Fixes: 4cda7d8d7098 ("mlxsw: core: Introduce flexible actions support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Thanks, Dan.
