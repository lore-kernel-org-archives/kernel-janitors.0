Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC23E479
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Nov 2023 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkU/w5dv"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFBB11F;
	Tue, 14 Nov 2023 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699957892; x=1731493892;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ur2izV+J1qprMf2LWt+wcfMywtu+U9DTlEPGtjJcaAg=;
  b=DkU/w5dvF2DoZUmQ0+cR5ZlGfFrxAV13dGI88CLRaKkFd23HIgEZ7BXq
   VBuM80q8vSLy81LSEcP8EuAwG+nK09OQjGTZ25YG8vMK2K64oZH33/fq+
   B48Pl7vUxW8NcCLIWrHeO6uCjZSUhTLT25moY7j++NgJcw0Yyw9tw56Vy
   xGSj4XHmhUeMSxlh/2SBqacwWPuUHxLHg6UECvRnhMeQxBhryy0w6MmZs
   Mf91wtCjk6CVhXxKDYYmtesYVD6iQrg/ds8hHPCb6i/BuCxbIGYwQ3Rh7
   +bC+b83l12qwV2eTQ+XGSS10fKxy54GbuinfYNyQAstCYYAa9z94gYvWM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="421726534"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="421726534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 02:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="882013550"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="882013550"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 02:31:27 -0800
Date: Tue, 14 Nov 2023 12:31:22 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
    Mark Gross <markgross@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org, 
    error27@gmail.com, vegard.nossum@oracle.com, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 3/4] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
In-Reply-To: <20231113200742.3593548-3-harshit.m.mogalapalli@oracle.com>
Message-ID: <36e7a170-bd87-4462-fc6b-eec446fbb551@linux.intel.com>
References: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com> <20231113200742.3593548-3-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-97839138-1699957890=:1748"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-97839138-1699957890=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 13 Nov 2023, Harshit Mogalapalli wrote:

> 'attr_name_kobj' is allocated using kzalloc, but on all the error paths
> it is not freed, hence we have a memory leak.
> 
> Fix the error path before kobject_init_and_add() by adding kfree().
> 
> kobject_put() must be always called after passing the object to
> kobject_init_and_add(). Only the error path which is immediately next
> to kobject_init_and_add() calls kobject_put() and not any other error
> path after it.
> 
> Fix the error handling after kobject_init_and_add() by moving the
> kobject_put() into the goto label err_other_attr_init that is already
> used by all the error paths after kobject_init_and_add().
> 
> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202309201412.on0VXJGo-lkp@intel.com/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis, only compile tested.
> 
> v3->v4: Add more explicit statement on how we are fixing it, suggested
> by Ilpo

Thanks a lot, this looks fine too now.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.


> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index a3599498c4e8..6ddca857cc4d 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -575,77 +575,79 @@ static void release_attributes_data(void)
>  /**
>   * hp_add_other_attributes() - Initialize HP custom attributes not
>   * reported by BIOS and required to support Secure Platform and Sure
>   * Start.
>   *
>   * @attr_type: Custom HP attribute not reported by BIOS
>   *
>   * Initialize all 2 types of attributes: Platform and Sure Start
>   * object.  Populates each attribute types respective properties
>   * under sysfs files.
>   *
>   * Returns zero(0) if successful. Otherwise, a negative value.
>   */
>  static int hp_add_other_attributes(int attr_type)
>  {
>  	struct kobject *attr_name_kobj;
>  	union acpi_object *obj = NULL;
>  	int ret;
>  	char *attr_name;
>  
>  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
>  	if (!attr_name_kobj)
>  		return -ENOMEM;
>  
>  	mutex_lock(&bioscfg_drv.mutex);
>  
>  	/* Check if attribute type is supported */
>  	switch (attr_type) {
>  	case HPWMI_SECURE_PLATFORM_TYPE:
>  		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
>  		attr_name = SPM_STR;
>  		break;
>  
>  	case HPWMI_SURE_START_TYPE:
>  		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
>  		attr_name = SURE_START_STR;
>  		break;
>  
>  	default:
>  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
>  		ret = -EINVAL;
> -		goto err_other_attr_init;
> +		kfree(attr_name_kobj);
> +		goto unlock_drv_mutex;
>  	}
>  
>  	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
>  				   NULL, "%s", attr_name);
>  	if (ret) {
>  		pr_err("Error encountered [%d]\n", ret);
> -		kobject_put(attr_name_kobj);
>  		goto err_other_attr_init;
>  	}
>  
>  	/* Populate attribute data */
>  	switch (attr_type) {
>  	case HPWMI_SECURE_PLATFORM_TYPE:
>  		ret = hp_populate_secure_platform_data(attr_name_kobj);
>  		break;
>  
>  	case HPWMI_SURE_START_TYPE:
>  		ret = hp_populate_sure_start_data(attr_name_kobj);
>  		break;
>  
>  	default:
>  		ret = -EINVAL;
>  	}
>  
>  	if (ret)
>  		goto err_other_attr_init;
>  
>  	mutex_unlock(&bioscfg_drv.mutex);
>  	return 0;
>  
>  err_other_attr_init:
> +	kobject_put(attr_name_kobj);
> +unlock_drv_mutex:
>  	mutex_unlock(&bioscfg_drv.mutex);
>  	kfree(obj);
>  	return ret;
>  }
> 
--8323329-97839138-1699957890=:1748--
