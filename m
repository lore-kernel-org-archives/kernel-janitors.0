Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60612B8B
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aednrvTk"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B132E5F9
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 03:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699615214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gF4lHxgy7j9d5sXIswxsFubhku8Y5vHmFoQ4XM7vaAw=;
	b=aednrvTkHrJihOdgnsYTP9BqU4DLdlbmYSH55dV51vNmScYdLnWHwEq/Q48emai4Xh5cLt
	G6ZpCrisVoBYFcjNbhnaV/aNDl2XurE5aO7hX7O3LJ0q3foXS9VV0OaRe8bU5igNV22khh
	60kzti4QXXvHNWTcIXJQ2bn/7Wf+tCY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-bZTPYNzGPWCDLeyK56NYew-1; Fri, 10 Nov 2023 06:20:12 -0500
X-MC-Unique: bZTPYNzGPWCDLeyK56NYew-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-54366567af4so2365462a12.1
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Nov 2023 03:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699615212; x=1700220012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gF4lHxgy7j9d5sXIswxsFubhku8Y5vHmFoQ4XM7vaAw=;
        b=h3CAz/tUiPbNR3vjWepkpbN1kUDLlMeAHJW4T4a1osWy77fApHVgLCvRaEyrUuyyDs
         dDyBHaCKQ8RKtdah5EFititNfsZQpwX0Xe5GDtYRhIyo0yOBhCTuEuA8eg/j5sHtTJ1e
         57t7/jfVnRmtPMGFAQJNtjWJida5pk99SsDg/4Nmy744bmP7tWjbCKAWmv2oGkiP8q1O
         yj18WDo5mw5cqkG8Se9CApQuzH9dky/Xy8qbrgITHcoHPSpqlePsQwEeJyXv6lCAscjA
         OLq03e/A0TCOkoEFg39ExTK4f6GID8hlS8hmQoEsaqLBMXgvRhsd+mcMCAi98jlzj5Jy
         k0xw==
X-Gm-Message-State: AOJu0Yxa2MvUKp9x8zjqs4LuQ+qoMBDhIbUQMAlGfMYK1c38/kCcn9wR
	N3fRFjhKpQC6rI4l0fqWQdsDWYh7Tj9NzebTg4m3aEklKy0C6c/LRq/9jwnRRhv+Ix4bom9TPAo
	0Jf/cH/yItU8d0PBDWVzPzIUO6hGH
X-Received: by 2002:a50:ec9a:0:b0:542:ff1b:6c7a with SMTP id e26-20020a50ec9a000000b00542ff1b6c7amr2147708edr.9.1699615211882;
        Fri, 10 Nov 2023 03:20:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmXV6390eaasj3SStMrY/9mKZE/oXKo2OvqfEsYFZiZM+s9jHsWrhaQ/q5jc3fY7esuMEPYg==
X-Received: by 2002:a50:ec9a:0:b0:542:ff1b:6c7a with SMTP id e26-20020a50ec9a000000b00542ff1b6c7amr2147680edr.9.1699615211530;
        Fri, 10 Nov 2023 03:20:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a16-20020a50c310000000b0053e3d8f1d9fsm1011111edb.67.2023.11.10.03.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:20:10 -0800 (PST)
Message-ID: <b821c9e6-ecac-4682-a624-1b930a671bca@redhat.com>
Date: Fri, 10 Nov 2023 12:20:10 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
Content-Language: en-US, nl
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Jorge Lopez <jorge.lopez2@hp.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, kernel test robot <lkp@intel.com>
References: <20231110090408.3383881-1-harshit.m.mogalapalli@oracle.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231110090408.3383881-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Harshit,

On 11/10/23 10:04, Harshit Mogalapalli wrote:
> 1. acpi_object *obj is unused in this function, so delete it, also
>    delete a unnecessary kfree(obj);
> 2. Fix a memory leak of 'attr_name_kobj' in the error handling path.
> 3. When kobject_init_and_add() fails on every subsequent error path call
>    kobject_put() to cleanup.

If you are fixing 3 different things, please do so in a series
of 3 patches each addressing 1 of the 3 things.

Regards,

Hans



> 
> Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202309201412.on0VXJGo-lkp@intel.com/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is only compile tested, based on static analysis.
> ---
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> index 5798b49ddaba..b28e52b64690 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> @@ -588,7 +588,6 @@ static void release_attributes_data(void)
>  static int hp_add_other_attributes(int attr_type)
>  {
>  	struct kobject *attr_name_kobj;
> -	union acpi_object *obj = NULL;
>  	int ret;
>  	char *attr_name;
>  
> @@ -596,8 +595,8 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
>  	if (!attr_name_kobj) {
> -		ret = -ENOMEM;
> -		goto err_other_attr_init;
> +		mutex_unlock(&bioscfg_drv.mutex);
> +		return -ENOMEM;
>  	}
>  
>  	/* Check if attribute type is supported */
> @@ -614,15 +613,15 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	default:
>  		pr_err("Error: Unknown attr_type: %d\n", attr_type);
> -		ret = -EINVAL;
> -		goto err_other_attr_init;
> +		kfree(attr_name_kobj);
> +		mutex_unlock(&bioscfg_drv.mutex);
> +		return -EINVAL;
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
> @@ -647,10 +646,9 @@ static int hp_add_other_attributes(int attr_type)
>  
>  	mutex_unlock(&bioscfg_drv.mutex);
>  	return 0;
> -
>  err_other_attr_init:
> +	kobject_put(attr_name_kobj);
>  	mutex_unlock(&bioscfg_drv.mutex);
> -	kfree(obj);
>  	return ret;
>  }
>  

