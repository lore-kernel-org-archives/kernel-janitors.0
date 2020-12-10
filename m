From: Jason Gunthorpe <jgg@nvidia.com>
Date: Thu, 10 Dec 2020 17:29:41 +0000
Subject: Re: [PATCH] RDMA/restrack: update kernel documentation for ib_create_named_qp()
Message-Id: <20201210172941.GC2117013@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201207173255.13355-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201207173255.13355-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Doug Ledford <dledford@redhat.com>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>

On Mon, Dec 07, 2020 at 06:32:55PM +0100, Lukas Bulwahn wrote:
> Commit 66f57b871efc ("RDMA/restrack: Support all QP types") extends
> ib_create_qp() to a named ib_create_named_qp(), which takes the caller's
> name as argument, but it did not add the new argument description to the
> function's kerneldoc.
> 
> make htmldocs warns:
> 
>   ./drivers/infiniband/core/verbs.c:1206: warning: Function parameter or
>   member 'caller' not described in 'ib_create_named_qp'
> 
> Add a description for this new argument based on the description of the
> same argument in other related functions.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/infiniband/core/verbs.c | 1 +
>  1 file changed, 1 insertion(+)

Applies to for-next, thanks

Jason
