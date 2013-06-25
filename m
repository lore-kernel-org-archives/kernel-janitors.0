From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Tue, 25 Jun 2013 06:16:23 +0000
Subject: Re: [patch] iscsi-target: missing kfree() on error path
Message-Id: <1372140983.23664.436.camel@haakon3.risingtidesystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130624154657.GB31984@elgon.mountain>
In-Reply-To: <20130624154657.GB31984@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Roland Dreier <roland@purestorage.com>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2013-06-24 at 18:46 +0300, Dan Carpenter wrote:
> We need to free "payload" before returning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
> index c1106bb..1e59630 100644
> --- a/drivers/target/iscsi/iscsi_target.c
> +++ b/drivers/target/iscsi/iscsi_target.c
> @@ -3426,6 +3426,7 @@ static int iscsit_build_sendtargets_response(struct iscsi_cmd *cmd)
>  		if (!text_ptr) {
>  			pr_err("Unable to locate '=' string in text_in:"
>  			       " %s\n", text_in);
> +			kfree(payload);
>  			return -EINVAL;
>  		}
>  		/*
> --

Applied to for-next.

Thanks Dan!

--nab

