Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF81201010
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Nov 2024 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979598; cv=none; b=RdJxpNbzZUtzQ27XFA1LtiVnl+jmNGIrf7ZGn6ZsARs93a5q1Jbpu4ozAxnRqVSq+GvZAE5QkyRCMXfo13lb4XcolPei6sRo5dtLT4joBD2AxnjJJhcMon91U+vMFSJ+cg5e//ScA3P6DXoSWOs8oBfmGHyXgdzmPv3+1YiFCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979598; c=relaxed/simple;
	bh=aYiIP03SY6jmHIWhVxqc2razauiuaJpdwe7Db3aiDwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnZMbc/j2NXWoim8+Rz6LNvKoDR0pR1ZIzQXTyilfCi30PjX5PMgH9h1n9g6Pm3bQYT9MFZQ51o+UtCLOd+hLS1Evh38oErTZ7H2jqR0o3b+nJ0lUlpyZ8GWEqDZGC4Ll+hhIgyAhZFEPOcskL2fEO1Xq4ahJn20yjOGrg/PuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JHPKT84R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JHPKT84R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730979595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EA/iYGB3oGwnF5w9tBZu49KsTbyhHMqrDxnVd+WD4sQ=;
	b=JHPKT84RqYubec04djK72ZYaH2LafIiYGriI0tNeYK42hYSs7KeYKnRPjkmQOb6zXLo+o6
	P+ooPJq6N8xp/CnbjWVXa/78vbEAIW+K1oxL1cp0gh18NA1/6lCP/VqGPiTbIyQCvSZV/o
	K4RPwu283l+LHN28Di8JerfcxzTclvE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-_8wsrPNnMIiC79DuvaHODA-1; Thu, 07 Nov 2024 06:39:54 -0500
X-MC-Unique: _8wsrPNnMIiC79DuvaHODA-1
X-Mimecast-MFC-AGG-ID: _8wsrPNnMIiC79DuvaHODA
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99ea3e1448so72908066b.3
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Nov 2024 03:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730979593; x=1731584393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EA/iYGB3oGwnF5w9tBZu49KsTbyhHMqrDxnVd+WD4sQ=;
        b=mUFmDG7soyLvWWbN3OS86TL7+yI8yh8q3AxlVS1ZQbomnajqN41AX7WwlIqQCeQ/WV
         0m9EYt83H1FBdtvC/OYste0UBucBnNoSuktEtZiIDb9tCrLm+mUkEuZ3F1sPL8QBLVlk
         P0mJatlpGqWIlOIYE/i7kawkaEQaXf33S1I/c9pmP0JfVU3lIXt9DrsocGlfH4Em5Kez
         sSGjA41zNVevhJuD1vjo2UAN25lsYFtAgDLsTPqxkNsOvSkhZ/Q29u4KuRxRdVOyympi
         o0mEunhgePgDQMVXI8WpecpytfLBe48b6eDckT2T7s/KwXJAflSPQ0K/DvHeOumaUI+x
         R3nw==
X-Gm-Message-State: AOJu0YyLdpLl5ioq/R6I9CNdh+lWOsV28uSJ8TetGhFOWzMczqw/crne
	WVGT6AzqjJ9HEAj4rAPzxrOJk2ShGsyMDCqXLq+hsxNpmJuFbuUrwyWKq0G25s3OaUjyjGTdsUQ
	2ucGllmqyT8xxZbCiyUztDtOlpoxvrIPVPrdbDyozXGWFk/0uM7C6tiuiI8xJt0GfbA==
X-Received: by 2002:a17:907:9713:b0:a9d:e01e:ffa9 with SMTP id a640c23a62f3a-a9de5f82589mr3922227366b.33.1730979592781;
        Thu, 07 Nov 2024 03:39:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGMjODC7IA0rrPQcJ9821kuZN/3mvp1M92v02uHWL0l3kGRWKuh5tiOnKwVCYiv6eM85PpNAQ==
X-Received: by 2002:a17:907:9713:b0:a9d:e01e:ffa9 with SMTP id a640c23a62f3a-a9de5f82589mr3922225466b.33.1730979592322;
        Thu, 07 Nov 2024 03:39:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a18a03sm81606166b.9.2024.11.07.03.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 03:39:51 -0800 (PST)
Message-ID: <7210b428-13ed-4f96-a940-71f3d9a2352c@redhat.com>
Date: Thu, 7 Nov 2024 12:39:51 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86: hp: hp-bioscfg: remove redundant if
 statement
To: Colin Ian King <colin.i.king@gmail.com>, Jorge Lopez
 <jorge.lopez2@hp.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241107113543.17137-1-colin.i.king@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241107113543.17137-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Nov-24 12:35 PM, Colin Ian King wrote:
> The if statement performs the same action if the strcmp result is
> true or false since there is identical code on both branches. The
> if statement is redundant and can be replaced with just one call
> to sysfs_remove_group.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  .../platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> index 35936c05e45b..187b372123ed 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> @@ -531,14 +531,9 @@ void hp_exit_password_attributes(void)
>  		struct kobject *attr_name_kobj =
>  			bioscfg_drv.password_data[instance_id].attr_name_kobj;
>  
> -		if (attr_name_kobj) {
> -			if (!strcmp(attr_name_kobj->name, SETUP_PASSWD))
> -				sysfs_remove_group(attr_name_kobj,
> -						   &password_attr_group);
> -			else
> -				sysfs_remove_group(attr_name_kobj,
> -						   &password_attr_group);
> -		}
> +		if (attr_name_kobj)
> +			sysfs_remove_group(attr_name_kobj,
> +					   &password_attr_group);
>  	}
>  	bioscfg_drv.password_instances_count = 0;
>  	kfree(bioscfg_drv.password_data);

