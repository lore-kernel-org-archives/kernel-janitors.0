From: "Michael S. Tsirkin" <mst@redhat.com>
Date: Wed, 15 Jul 2015 11:28:46 +0000
Subject: Re: [patch] vhost: NULL vs ERR_PTR bug
Message-Id: <20150715142420-mutt-send-email-mst@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150715111659.GA22854@mwanda>
In-Reply-To: <20150715111659.GA22854@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

On Wed, Jul 15, 2015 at 02:16:59PM +0300, Dan Carpenter wrote:
> There is only one caller for vhost_kvzalloc() and it expects NULL on
> allocation failure.  Most people would probably expect that so let's
> change ERR_PTR(-ENOMEM) to NULL.
> 
> Fixes: 4de7255f7d2b ('vhost: extend memory regions allocation to vmalloc')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ouch. Thanks a lot for noticing this, and it's a good thing
you did before Linus merged it.
I'll squash this into Igor's patch and redo my pull request.

> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index a9fe859..99d613b 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -686,7 +686,7 @@ static void *vhost_kvzalloc(unsigned long size)
>  	if (!n) {
>  		n = vzalloc(size);
>  		if (!n)
> -			return ERR_PTR(-ENOMEM);
> +			return NULL;
>  	}
>  	return n;
>  }
