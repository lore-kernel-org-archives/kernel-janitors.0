From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 15 Jun 2011 16:41:01 +0000
Subject: Re: [patch 3/4] SCSI: target: don't return ERR_PTR in
Message-Id: <1308156061.20109.11.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110613201049.GJ3583@shale.localdomain>
In-Reply-To: <20110613201049.GJ3583@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, target-devel <target-devel@vger.kernel.org>

On Mon, 2011-06-13 at 23:10 +0300, Dan Carpenter wrote:
> In the original code, there were several places inside the
> target_fabric_configfs_init() function that returned NULL on error
> and one place the returned an ERR_PTR.  There are two places that
> call this function and they only check for NULL returns; they don't
> check for ERR_PTRs.  So I've changed the ERR_PTR so now the function
> only returns NULL on error.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Committed as abf2b523bbe.

Thanks!

--nab

> diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
> index ee6fad9..b17abd1 100644
> --- a/drivers/target/target_core_configfs.c
> +++ b/drivers/target/target_core_configfs.c
> @@ -312,7 +312,7 @@ struct target_fabric_configfs *target_fabric_configfs_init(
>  
>  	tf = kzalloc(sizeof(struct target_fabric_configfs), GFP_KERNEL);
>  	if (!(tf))
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>  
>  	INIT_LIST_HEAD(&tf->tf_list);
>  	atomic_set(&tf->tf_access_cnt, 0);

