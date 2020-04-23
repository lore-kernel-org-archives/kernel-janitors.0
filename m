From: David Miller <davem@davemloft.net>
Date: Thu, 23 Apr 2020 19:34:59 +0000
Subject: Re: [PATCH net] mlxsw: Fix some IS_ERR() vs NULL bugs
Message-Id: <20200423.123459.1317092825451472203.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200422093641.GA189235@mwanda>
In-Reply-To: <20200422093641.GA189235@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 12:36:41 +0300

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

Applied, thanks.
