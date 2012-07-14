From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Sat, 14 Jul 2012 22:21:59 +0000
Subject: Re: [patch -next] tcm_vhost: another strlen() off by one
Message-Id: <1342304519.18004.230.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120713104547.GA31435@elgon.mountain>
In-Reply-To: <20120713104547.GA31435@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: target-devel <target-devel@vger.kernel.org>, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

On Fri, 2012-07-13 at 13:45 +0300, Dan Carpenter wrote:
> strlen() doesn't count the NUL terminator.  I missed this one in the
> patches I sent yesterday.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
> index 29850cb..ea72198 100644
> --- a/drivers/vhost/tcm_vhost.c
> +++ b/drivers/vhost/tcm_vhost.c
> @@ -1424,7 +1424,7 @@ static struct se_wwn *tcm_vhost_make_tport(
>  	return ERR_PTR(-EINVAL);
>  
>  check_len:
> -	if (strlen(name) > TCM_VHOST_NAMELEN) {
> +	if (strlen(name) >= TCM_VHOST_NAMELEN) {
>  		pr_err("Emulated %s Address: %s, exceeds"
>  			" max: %d\n", name, tcm_vhost_dump_proto_id(tport),
>  			TCM_VHOST_NAMELEN);

Applied + squashed into the initial merge commit in for-next-merge.

Thanks DanC!

--nab

