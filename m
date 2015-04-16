From: Tomas Henzl <thenzl@redhat.com>
Date: Thu, 16 Apr 2015 12:22:15 +0000
Subject: Re: [patch] csiostor: fix an error code in csio_hw_init()
Message-Id: <552FA977.9070302@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150414143219.GA30421@mwanda>
In-Reply-To: <20150414143219.GA30421@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <JBottomley@odin.com>
Cc: "David S. Miller" <davem@davemloft.net>, Hariprasad Shenai <hariprasad@chelsio.com>, Praveen Madhavan <praveenm@chelsio.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/14/2015 04:32 PM, Dan Carpenter wrote:
> We should return -ENOMEM if kzalloc() fails here instead of returning
> success.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/csiostor/csio_hw.c b/drivers/scsi/csiostor/csio_hw.c
> index 2e66f34..622bdab 100644
> --- a/drivers/scsi/csiostor/csio_hw.c
> +++ b/drivers/scsi/csiostor/csio_hw.c
> @@ -3928,6 +3928,7 @@ csio_hw_init(struct csio_hw *hw)
>  
>  		evt_entry = kzalloc(sizeof(struct csio_evt_msg), GFP_KERNEL);
>  		if (!evt_entry) {
> +			rv = -ENOMEM;
>  			csio_err(hw, "Failed to initialize eventq");
>  			goto err_evtq_cleanup;
>  		}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Reviewed-by: Tomas Henzl <thenzl@redhat.com>

Tomas

