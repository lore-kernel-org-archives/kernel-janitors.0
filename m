Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574E13A269
	for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 09:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802190; cv=none; b=MidvVCv4KMWyPVy0i3JLc1LEh/g+RUKrRduahnwoi6aR4LO+KzhTQQlQRAa/2dxX+pfZanbGHkIu42MF8+Jz0Luk06JXTD1yMqcNDKqTQqtE7vZwr8WFpCIDkWSaHSrVKPLDBgqLeSA+XNoidy6dsByAapz3n/bH/2PNLAmzpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802190; c=relaxed/simple;
	bh=GVk5OV/h2v884ljEBZx1wxeGLOe6kBRIDF8Asd89Iyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SG9+mprkm2qEoW/iNZ1NVD3zp3ENOfnU54QrloTgPEdfhqVoXJDLo32zQdzQ+XdnKOgQJiPHwjmLrMjAeqF9JMOwaMKMBLAfFPYtXqxmQQbNyo9H5jU69hBbe2wsHuHkLtxp12YWcXKfVPHqcKOT3thkcShXvqj/uwSoWExn/P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IQWi7Vcs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IQWi7Vcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a2KHdQxlr+nCK+72i7BoiThRuJXfjIGAcKBIGrSIL78=;
	b=IQWi7Vcs9qZtK6mqVO6Xd04tUU8nAeuA9GOxwIFBaE1wDbp2tuClkIPyaBa2NdfuDDXlPQ
	p3/STW7YBFVr9jxUOP0ZqhNjNurBnAJwwZCWjX86ZxK48wThXp1+tEQFXi8lG3+qhlLPIu
	+UX2SX8UiA+HDGpUuYxDfvlFgPChQLg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-S1J8fKJ2N5aGkMixgBmgmA-1; Mon, 27 May 2024 05:29:46 -0400
X-MC-Unique: S1J8fKJ2N5aGkMixgBmgmA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a5a84e7c884so286549266b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 27 May 2024 02:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802185; x=1717406985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2KHdQxlr+nCK+72i7BoiThRuJXfjIGAcKBIGrSIL78=;
        b=KW0DZ8LPuhtIp1Vo9omlvdxtHc7Pyd7m5DZmKbKHdwGaUIJXMfVOpJbiOMBv6aFR0Z
         ge2PnKrI9tT2etkv2EYlnA/mNy/Wfw9HwBFuoFDa/6t6VkTnhwB2XKcSqtCpihsTL2e4
         vU/2JidEsOllYBYJ6MBy66MYO0Tn2baYYNJFN8LnghWRn0f+v8F1tN1zWHyA9NHeINN6
         RWgHmkEUfhxoAVA1f7/mFGgRlyAinLSydFTqxMMQDX4ZD5LRdcKHqrMncEx++Tee9I32
         s37gR2yuNhgGv0Y1gAiRghs4bMM97GKr/inIDh40fEH4LTIREDx841kJ6JpSOFxOmiuL
         XDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqxJYYHYP8B+rsfwKhXVykn+tnpM503z6f8WPLrX/F5j531V4vW7EynFaDxVg0tv9XdETNED93mK/sJzbPe6IKNqCLtZHAizfbLRwmPh9G
X-Gm-Message-State: AOJu0Yyp3hNfxf6Vvi/RqCmc8LYjdMZiou6aQuJIKLJ7Uk5TPJZmaJj/
	ptdXFZZ+DelxqBd94cf4VRJUgxcNcJRyeFSqYPDutlb8A0OVlQHQnFuhhsQuUyBznSaAlaPRwZS
	EMi2SqtW6IgwxO32E2RV/Klzg0qI7RZ6Do9/qD/S4M4Rl4QKjUxYsG/BlU4LhxSnoJg==
X-Received: by 2002:a17:906:b15:b0:a5a:15f6:157f with SMTP id a640c23a62f3a-a62641b42fcmr573358166b.14.1716802185024;
        Mon, 27 May 2024 02:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY7hYRzJQt/K0T3Xo6dt+GVQ6bfmi9PMBGZAhv1A5DH1gxbNqtbSUlQN9ac3tQ+gdHgt1I2Q==
X-Received: by 2002:a17:906:b15:b0:a5a:15f6:157f with SMTP id a640c23a62f3a-a62641b42fcmr573356966b.14.1716802184553;
        Mon, 27 May 2024 02:29:44 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c9376edsm466532366b.59.2024.05.27.02.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:29:44 -0700 (PDT)
Message-ID: <e6db0add-e290-4fac-b90c-da264939693d@redhat.com>
Date: Mon, 27 May 2024 11:29:43 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: ISST: fix use-after-free in
 tpmi_sst_dev_remove()
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
References: <20240517144946.289615-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240517144946.289615-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/17/24 4:49 PM, Harshit Mogalapalli wrote:
> In tpmi_sst_dev_remove(), tpmi_sst is dereferenced after being freed.
> Fix this by reordering the kfree() post the dereference.
> 
> Fixes: 9d1d36268f3d ("platform/x86: ISST: Support partitioned systems")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
> v1->v2: Add R.B from Hans and fix commit message wrapping to 75 chars.
> This is found by smatch and only compile tested.
> ---
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> index 7bac7841ff0a..7fa360073f6e 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
> @@ -1610,8 +1610,8 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
>  	tpmi_sst->partition_mask_current &= ~BIT(plat_info->partition);
>  	/* Free the package instance when the all partitions are removed */
>  	if (!tpmi_sst->partition_mask_current) {
> -		kfree(tpmi_sst);
>  		isst_common.sst_inst[tpmi_sst->package_id] = NULL;
> +		kfree(tpmi_sst);
>  	}
>  	mutex_unlock(&isst_tpmi_dev_lock);
>  }

