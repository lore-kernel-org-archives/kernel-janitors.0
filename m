From: Saeed Mahameed <saeed@kernel.org>
Date: Thu, 11 Feb 2021 04:17:46 +0000
Subject: Re: [PATCH net-next] net/mlx5: Fix a NULL vs IS_ERR() check
Message-Id: <e31fa9d634fc53ee806f4a59b9c0a5164c76122b.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCO+NCjissLTG1H6@mwanda> <ygnhczx8gngw.fsf@nvidia.com>
In-Reply-To: <ygnhczx8gngw.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vlad Buslov <vladbu@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Dmytro Linkin <dlinkin@nvidia.com>, Roi Dayan <roid@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2021-02-10 at 13:40 +0200, Vlad Buslov wrote:
> On Wed 10 Feb 2021 at 13:06, Dan Carpenter <dan.carpenter@oracle.com>
> wrote:
> > The mlx5_chains_get_table() function doesn't return NULL, it
> > returns
> > error pointers so we need to fix this condition.
> > 
> > Fixes: 34ca65352ddf ("net/mlx5: E-Switch, Indirect table
> > infrastructure")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, Dan!
> 
> Reviewed-by: Vlad Buslov <vladbu@nvidia.com>

Applied to net-next-mlx5

Thanks!
