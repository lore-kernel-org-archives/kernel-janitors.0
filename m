From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Wed, 25 Feb 2015 16:53:19 +0000
Subject: Re: [patch] Staging: lustre: missing curly braces in ll_setattr_raw()
Message-Id: <81C36813-E27A-4CB0-A19B-951C5FF36C3D@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225132036.GG19745@mwanda>
In-Reply-To: <20150225132036.GG19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Ah! 
Nice catch.
I am not sure how I missed that while making 178ba1e0d00aca671f9a8f5f41d28fc0fe717752, it's also strange that this never triggered any ill effects in any of my testing.

Thanks!

On Feb 25, 2015, at 8:20 AM, Dan Carpenter wrote:

> From the indenting, it looks like curly braces were intended here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is not tested, and it changes how the code works.  Please review
> it a bit carefully.  Sometimes people just do weird indenting for no
> reason.
> 
> diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
> index 0c1b583..ba97d9e 100644
> --- a/drivers/staging/lustre/lustre/llite/llite_lib.c
> +++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
> @@ -1432,7 +1432,7 @@ int ll_setattr_raw(struct dentry *dentry, struct iattr *attr, bool hsm_import)
> 
> 	if (attr->ia_valid & (ATTR_SIZE |
> 			      ATTR_ATIME | ATTR_ATIME_SET |
> -			      ATTR_MTIME | ATTR_MTIME_SET))
> +			      ATTR_MTIME | ATTR_MTIME_SET)) {
> 		/* For truncate and utimes sending attributes to OSTs, setting
> 		 * mtime/atime to the past will be performed under PW [0:EOF]
> 		 * extent lock (new_size:EOF for truncate).  It may seem
> @@ -1444,6 +1444,7 @@ int ll_setattr_raw(struct dentry *dentry, struct iattr *attr, bool hsm_import)
> 		rc = ll_setattr_ost(inode, attr);
> 		if (attr->ia_valid & ATTR_SIZE)
> 			up_write(&lli->lli_trunc_sem);
> +	}
> out:
> 	if (op_data) {
> 		if (op_data->op_ioepoch) {

