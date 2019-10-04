From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 04 Oct 2019 17:56:34 +0000
Subject: Re: [PATCH] RDMA/core: Fix an error handling path in 'res_get_common_doit()'
Message-Id: <20191004175634.GA24049@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190818091044.8845-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190818091044.8845-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dledford@redhat.com, leon@kernel.org, parav@mellanox.com, majd@mellanox.com, markz@mellanox.com, swise@opengridcomputing.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 18, 2019 at 11:10:44AM +0200, Christophe JAILLET wrote:
> According to surrounding error paths, it is likely that 'goto err_get;' is
> expected here. Otherwise, a call to 'rdma_restrack_put(res);' would be
> missing.
> 
> Fixes: c5dfe0ea6ffa ("RDMA/nldev: Add resource tracker doit callback")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/infiniband/core/nldev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-rc, thanks

Jason
