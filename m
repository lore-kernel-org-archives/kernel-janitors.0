From: Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Tue, 02 Jun 2015 12:15:38 +0000
Subject: Re: [patch]  hv: util: checking the wrong variable
Message-Id: <87wpzmwbkl.fsf@vitty.brq.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We don't catch this allocation failure because there is a typo and we
> check the wrong variable.
>
> Fixes: 14b50f80c32d ('Drivers: hv: util: introduce hv_utils_transport abstraction')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Thanks, Dan!

>
> diff --git a/drivers/hv/hv_utils_transport.c b/drivers/hv/hv_utils_transport.c
> index ea7ba5e..6a9d80a 100644
> --- a/drivers/hv/hv_utils_transport.c
> +++ b/drivers/hv/hv_utils_transport.c
> @@ -186,7 +186,7 @@ int hvutil_transport_send(struct hvutil_transport *hvt, void *msg, int len)
>  		return -EINVAL;
>  	} else if (hvt->mode = HVUTIL_TRANSPORT_NETLINK) {
>  		cn_msg = kzalloc(sizeof(*cn_msg) + len, GFP_ATOMIC);
> -		if (!msg)
> +		if (!cn_msg)
>  			return -ENOMEM;
>  		cn_msg->id.idx = hvt->cn_id.idx;
>  		cn_msg->id.val = hvt->cn_id.val;

-- 
  Vitaly
