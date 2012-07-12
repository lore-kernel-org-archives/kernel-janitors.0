From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Thu, 12 Jul 2012 21:49:22 +0000
Subject: Re: [patch 3/3 -next] tcm_vhost: call kfree() on an error path
Message-Id: <1342129762.18004.101.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712144852.GF24202@elgon.mountain>
In-Reply-To: <20120712144852.GF24202@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, target-devel <target-devel@vger.kernel.org>

On Thu, 2012-07-12 at 17:48 +0300, Dan Carpenter wrote:
> There is a memory leak here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
> index 57d39c5..29850cb 100644
> --- a/drivers/vhost/tcm_vhost.c
> +++ b/drivers/vhost/tcm_vhost.c
> @@ -1420,6 +1420,7 @@ static struct se_wwn *tcm_vhost_make_tport(
>  
>  	pr_err("Unable to locate prefix for emulated Target Port:"
>  			" %s\n", name);
> +	kfree(tport);
>  	return ERR_PTR(-EINVAL);
>  
>  check_len:

Applied to for-next-merge, and folding the series into the initial merge
commit now..

Thank you!

--nab

