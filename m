From: David Disseldorp <ddiss@suse.de>
Date: Tue, 13 Dec 2016 13:17:59 +0000
Subject: Re: [patch]  target/iscsi: double free in lio_target_tiqn_addtpg()
Message-Id: <20161213141759.04213887@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161213122703.GB7519@elgon.mountain>
In-Reply-To: <20161213122703.GB7519@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Dec 2016 15:27:04 +0300, Dan Carpenter wrote:

> This iscsit_tpg_add_portal_group() function is only called from
> lio_target_tiqn_addtpg().  Both functions free the "tpg" pointer on
> error so it's a double free bug.  The memory is allocated in the caller
> so it should be freed in the caller and not here.
> 
> Fixes: e48354ce078c ("iscsi-target: Add iSCSI fabric support for target v4.1")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/iscsi/iscsi_target_tpg.c b/drivers/target/iscsi/iscsi_target_tpg.c
> index 0814e5894a96..205a509b0dfb 100644
> --- a/drivers/target/iscsi/iscsi_target_tpg.c
> +++ b/drivers/target/iscsi/iscsi_target_tpg.c
> @@ -260,7 +260,6 @@ int iscsit_tpg_add_portal_group(struct iscsi_tiqn *tiqn, struct iscsi_portal_gro
>  		iscsi_release_param_list(tpg->param_list);
>  		tpg->param_list = NULL;
>  	}
> -	kfree(tpg);
>  	return -ENOMEM;
>  }

Looks good, and works for me if I manually trigger the error path.
Reviewed-by: David Disseldorp <ddiss@suse.de>
