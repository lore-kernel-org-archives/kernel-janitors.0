From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Wed, 26 Jan 2011 22:53:09 +0000
Subject: Re: [patch] [SCSI] target: allow release() to be called on NULL
Message-Id: <1296082389.14831.67.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110126085825.GM2721@bicker>
In-Reply-To: <20110126085825.GM2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: James Bottomley <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2011-01-26 at 11:58 +0300, Dan Carpenter wrote:
> This is a cleanup and not a bugfix.
> 
> container_of() does pointer math and the result of that math can
> basically not be NULL here so "se_dev" is non-NULL.
> 
> Normally release() type functions accept a NULL parameter.  I don't
> think target_core_dev_release() is ever called with a NULL parameter but
> it's a cleaner to allow that.
> 
> So instead of checking "se_dev", I've changed it to check "item".
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
> index 2764510..d9dcd9d 100644
> --- a/drivers/target/target_core_configfs.c
> +++ b/drivers/target/target_core_configfs.c
> @@ -1973,7 +1973,7 @@ static void target_core_dev_release(struct config_item *item)
>  				struct se_subsystem_dev, se_dev_group);
>  	struct config_group *dev_cg;
>  
> -	if (!(se_dev))
> +	if (!item)
>  		return;
>  
>  	dev_cg = &se_dev->se_dev_group;

Yeah, these types of NULL pointer checks from container_of() in struct
configfs_item_operations->release() callbacks to free the extra
foo->default_groups allocation are left-over paranoia.  This is the only
one of these left in target_core_configfs.c code, and the callback will
never be null from fs/configfs/item.c:config_item_cleanup() anyways.

Ill go ahead and commit the following:

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index 99e07ba..30ae3af 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -2003,12 +2003,8 @@ static void target_core_dev_release(struct config_item *item)
 {
        struct se_subsystem_dev *se_dev = container_of(to_config_group(item),
                                struct se_subsystem_dev, se_dev_group);
-       struct config_group *dev_cg;
+       struct config_group *dev_cg = &se_dev->se_dev_group;
 
-       if (!(se_dev))
-               return;
-
-       dev_cg = &se_dev->se_dev_group;
        kfree(dev_cg->default_groups);
 }




