From: Or Gerlitz <ogerlitz@mellanox.com>
Date: Wed, 13 Jul 2016 11:40:26 +0000
Subject: Re: [patch] net/mlx5: missing error code in esw_create_offloads_fdb_table()
Message-Id: <24af412f-7fa5-fa2e-c605-21ea5d45f5ff@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713100825.GD29468@mwanda>
 <83d5a5bb-dbf5-6c8f-39ea-320d55026a9d@mellanox.com>
In-Reply-To: <83d5a5bb-dbf5-6c8f-39ea-320d55026a9d@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matan Barak <matanb@mellanox.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Leon Romanovsky <leonro@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On 7/13/2016 2:19 PM, Matan Barak wrote:
> I'm not sure EINVAL is the right error here though.
> Maybe -ENOTSUPP is a bit more appropriate here. 

I agree, Dan, can you please change to be along Matan's suggestion?

Or.

