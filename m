From: Gal Pressman <galpress@amazon.com>
Date: Mon, 21 Sep 2020 07:13:43 +0000
Subject: Re: [PATCH 05/14] RDMA/efa: drop double zeroing
Message-Id: <ee835ad6-c1fc-cd48-fc70-f42e2ded3ac0@amazon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Yossi Leybovich <sleybo@amazon.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/09/2020 14:26, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x,n,flags;
> @@
> 
> x = 
> - kcalloc
> + kmalloc_array
>   (n,sizeof(*x),flags)
> ...
> sg_init_table(x,n)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Thanks Julia,
Acked-by: Gal Pressman <galpress@amazon.com>
