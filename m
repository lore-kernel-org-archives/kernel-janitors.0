From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Thu, 12 Jul 2012 21:47:57 +0000
Subject: Re: [patch 1/3 -next] tcm_vhost: unlock on error in tcm_vhost_drop_nexus()
Message-Id: <1342129677.18004.99.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712144752.GD24202@elgon.mountain>
In-Reply-To: <20120712144752.GD24202@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: target-devel <target-devel@vger.kernel.org>, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

On Thu, 2012-07-12 at 17:47 +0300, Dan Carpenter wrote:
> We need to unlock here before returning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
> index da0b8ac..d217bed 100644
> --- a/drivers/vhost/tcm_vhost.c
> +++ b/drivers/vhost/tcm_vhost.c
> @@ -1189,6 +1189,7 @@ static int tcm_vhost_drop_nexus(
>  	}
>  
>  	if (atomic_read(&tpg->tv_tpg_vhost_count)) {
> +		mutex_unlock(&tpg->tv_tpg_mutex);
>  		pr_err("Unable to remove TCM_vHost I_T Nexus with"
>  			" active TPG vhost count: %d\n",
>  			atomic_read(&tpg->tv_tpg_vhost_count));

Applied.  Thanks Dan!

