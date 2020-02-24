From: santosh.shilimkar@oracle.com
Date: Mon, 24 Feb 2020 17:52:30 +0000
Subject: Re: [PATCH] net/rds: Fix a debug message
Message-Id: <d5188793-68c3-b2a3-d4d8-fbf8d5d9ff88@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224103215.utw3zaa6nmcb5vrz@kili.mountain>
In-Reply-To: <20200224103215.utw3zaa6nmcb5vrz@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hans Westgaard Ry <hans.westgaard.ry@oracle.com>, Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org

On 2/24/20 2:32 AM, Dan Carpenter wrote:
> This should display the error code but instead it just prints "1".
> 
> Fixes: 2eafa1746f17 ("net/rds: Handle ODP mr registration/unregistration")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
Right.

Acked-by: Santosh Shilimkar <santosh.shilimkar@oracle.com>
