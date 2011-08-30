From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Date: Tue, 30 Aug 2011 07:51:59 +0000
Subject: Re: [patch 1/2] 9p: move dereference after NULL check
Message-Id: <87sjojs5yo.fsf@skywalker.in.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110826165559.GE3775@shale.localdomain>
In-Reply-To: <20110826165559.GE3775@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Eric Van Hensbergen <ericvh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Venkateswararao Jujjuri <jvrao@linux.vnet.ibm.com>, "M. Mohan Kumar" <mohan@in.ibm.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, 26 Aug 2011 19:55:59 +0300, Dan Carpenter <error27@gmail.com> wrote:
> We dereferenced "req->tc" and "req->rc" before checking for NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/net/9p/client.c b/net/9p/client.c
> index 3f8c046..b0bcace 100644
> --- a/net/9p/client.c
> +++ b/net/9p/client.c
> @@ -248,10 +248,8 @@ static struct p9_req_t *p9_tag_alloc(struct p9_client *c, u16 tag, int max_size)
>  		init_waitqueue_head(req->wq);
>  		req->tc = kmalloc(sizeof(struct p9_fcall) + alloc_msize,
>  				  GFP_NOFS);
> -		req->tc->capacity = alloc_msize;
>  		req->rc = kmalloc(sizeof(struct p9_fcall) + alloc_msize,
>  				  GFP_NOFS);
> -		req->rc->capacity = alloc_msize;
>  		if ((!req->tc) || (!req->rc)) {
>  			printk(KERN_ERR "Couldn't grow tag array\n");
>  			kfree(req->tc);
> @@ -261,6 +259,8 @@ static struct p9_req_t *p9_tag_alloc(struct p9_client *c, u16 tag, int max_size)
>  			req->wq = NULL;
>  			return ERR_PTR(-ENOMEM);
>  		}
> +		req->tc->capacity = alloc_msize;
> +		req->rc->capacity = alloc_msize;
>  		req->tc->sdata = (char *) req->tc + sizeof(struct p9_fcall);
>  		req->rc->sdata = (char *) req->rc + sizeof(struct p9_fcall);
>  	}

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>

-aneesh
