From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Tue, 19 May 2015 18:44:32 +0000
Subject: Re: [patch -next] target: double locking typo in core_clear_lun_from_tpg()
Message-Id: <1432061072.19713.2.camel@haakon3.risingtidesystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150519120419.GA12107@mwanda>
In-Reply-To: <20150519120419.GA12107@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2015-05-19 at 15:04 +0300, Dan Carpenter wrote:
> We accidentally deadlock instead of unlocking.
> 
> Fixes: 08d20ff62cde ('target: Acquire lun_entry_mutex during core_disable_device_list_for_node')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
> index 2f4c8fa..20618df 100644
> --- a/drivers/target/target_core_device.c
> +++ b/drivers/target/target_core_device.c
> @@ -433,7 +433,7 @@ void core_clear_lun_from_tpg(struct se_lun *lun, struct se_portal_group *tpg)
>  
>  			core_disable_device_list_for_node(lun, deve, nacl, tpg);
>  		}
> -		mutex_lock(&nacl->lun_entry_mutex);
> +		mutex_unlock(&nacl->lun_entry_mutex);
>  	}
>  	mutex_unlock(&tpg->acl_node_mutex);
>  }

Applied to for-next, and will squash into the original soon.

Thanks Dan!

--nab

