From: David Miller <davem@davemloft.net>
Date: Wed, 14 Jun 2017 19:33:08 +0000
Subject: Re: [PATCH net-next] net/mlxfw: fix a NULL dereference
Message-Id: <20170614.153308.341504181230845534.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614104152.GM29394@elgon.mountain>
In-Reply-To: <20170614104152.GM29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yotamg@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 13:41:52 +0300

> If we hit this error path we end up returning ERR_PTR(0) which is NULL.
> The caller is not expecting that so it results in a NULL dereference.
> 
> Fixes: 410ed13cae39 ("Add the mlxfw module for Mellanox firmware flash process")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
