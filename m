From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 09 Nov 2020 11:12:59 +0000
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: fix init_bios_attributes() error handling
Message-Id: <a4f6be26-1270-8923-c8c4-a68b1d680414@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201103101735.GB1127762@mwanda>
In-Reply-To: <20201103101735.GB1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Divya Bharathi <divya.bharathi@dell.com>
Cc: Mark Gross <mgross@linux.intel.com>, Prasanth KSR <prasanth.ksr@dell.com>, Mario Limonciello <mario.limonciello@dell.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 11/3/20 11:17 AM, Dan Carpenter wrote:
> Calling release_attributes_data() while holding the "wmi_priv.mutex"
> will lead to a dead lock.  The other problem is that if kzalloc() fails
> then this should return -ENOMEM but currently it returns success.
> 
> Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> The "platform/x86: Introduce support ... " commit doesn't use the patch
> prefix which the driver will use going forward.  That means that whoever
> fixes the first bug has to pick the patch prefix and sometimes people
> are not happy with that.
> 
>  drivers/platform/x86/dell-wmi-sysman/sysman.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> index 3842575a6c18..055556d5c70d 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/sysman.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/sysman.c
> @@ -443,8 +443,10 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  
>  		/* build attribute */
>  		attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
> -		if (!attr_name_kobj)
> +		if (!attr_name_kobj) {
> +			retval = -ENOMEM;
>  			goto err_attr_init;
> +		}
>  
>  		attr_name_kobj->kset = tmp_set;
>  
> @@ -486,13 +488,13 @@ static int init_bios_attributes(int attr_type, const char *guid)
>  		elements = obj ? obj->package.elements : NULL;
>  	}
>  
> -	goto out;
> +	mutex_unlock(&wmi_priv.mutex);
> +	return 0;
>  
>  err_attr_init:
> +	mutex_unlock(&wmi_priv.mutex);
>  	release_attributes_data();
>  	kfree(obj);
> -out:
> -	mutex_unlock(&wmi_priv.mutex);
>  	return retval;
>  }
>  
> 
