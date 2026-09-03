Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953D03E0749
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 19:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788462406; cv=none; b=teHwD9rrR3fk51RarYkkW1UGIWF/W8Pl4ytnqWVJ11PKST+uA55R5zfRxfOcV7xE0JM6TBR+uQisUUEihemCbGn7nqMBa82o1W/ZAPgwQ2+q8ze7Kb9DNuKhNzfUc6nrYk+ys6mAZkdAXkJMVCq+mBXDgMT4fIBtfPYZMOt1d/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788462406; c=relaxed/simple;
	bh=fY7oQw8c3LKHlU69NMdT27cOAg14tbfxLSzOFE9RJ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1MxEz/ejAFlj5D7EJpaP78qZMQqaztxTSL1L4IINXPxRF9ADypVHohjYNScG74Tht0gG9wsRPm2edlJNxuuBP0EgtyYKNo7djDK7PSQDMIibNsoYbWX4b9kurO2qROGaqPXFrHWajsakF277MSDiq6O5c+oE3maUSUXysC+FsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=huxNDWXr; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYflEeef; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huxNDWXr";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYflEeef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788462393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
	b=huxNDWXrwXzOKKjpRuYa9Vif07x5hJtxPLuT3/wScjsKKx6RpfBSrgkVmoFnrg3vWM5mKA
	kuSoeMrGsN0QsKV4eZTxDkZM09eS/B2dpUNB2ndq6URdYI9exFsloqHmyniH0TjcL93uie
	T6wESOJrC5S3Bxw0FC/YgJNfJ/P3pwI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-ECaVepfrNY2aQsKMize2ig-1; Thu, 03 Sep 2026 15:06:29 -0400
X-MC-Unique: ECaVepfrNY2aQsKMize2ig-1
X-Mimecast-MFC-AGG-ID: ECaVepfrNY2aQsKMize2ig_1788462389
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so38640985a.1
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 12:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788462389; x=1789067189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
        b=CYflEeefHpR8aTsSQhh6/Xn4TGyxEvPbYE8HJZQIVIlU+cVOvkHj2/bSZt/Y/lGohN
         Q+UvZO6XmJ7OkjxFNaoQhtJaey0XRlf7XLysLCmFplppAHJBKNYjSuNRDOYIiTyNFqXx
         IojmTa6VRR/PyZpKhcvRm99NTUSmlF3NXfH1Vfg0iIyUPYVFymg1FeFfyIZQf3gwdZTg
         ejkofHbQiWK/ScOgLPeDKxMyaALosHA0STUrPC2TSJscqVa9eZsLBAvRmmQKaa/66F6e
         /h4NLHZP2lbtoplf9tR0WvcBfzdBpv5neXfpq0Ig4qumMli1YPeYaorkswCTUsXdTCoU
         198Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462389; x=1789067189;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyoPKwWPVR6am9+jaZNykBIgFNjq3alkuLbTD4euEoU=;
        b=L9ObEUDNyIAK82/DZk7mQyKEAxBxv5pCtXl8G3xp5+6Vbc4vf6FmmWpEO/q3U2EpiV
         n1gTuS18HrAswFCRvjz7d/P2N+6NdeQ9TmA98CidIxGoBkQq/Ui2yMrGkAhNvPGcSHi8
         omujgxwcRm2Is7orcpjIvHfRV+TSixCGkv4XqWMum/qsMax4/v9Jlow2cJtB9QB90v6K
         fvcynNtcSAH+q8rBJjjoEOM7TAhfa3fhRBYF/PWW8+224QBqk86e6tugimyODGDQq+WM
         TN9dpuXlP0GgvUuvsW4NDz73K95EP6w9yIjevIcxraPCGr1f0uLgVFMwz9Q0YPQBzj3Z
         9ssQ==
X-Gm-Message-State: AFuF++mNxLVuvYFq3CYwxvk+KzoERPf4zA4ewARNf1B09PYvDk0amYpz
	1doXj86AxXhNJsMMZrXPDjzOoajNmhfUr6kbIFMZv8wpsAvw8GtraOHQU366z+lH+32zNEVv47G
	td6XKV29XQvpB1nEkBqcSqjNHxlspMegARWr05XA0PYBpiNHdyr4dxz9pCrh75xXBVomlZp4Qgj
	RqAgt1
X-Gm-Gg: AYBFou0tlXb9Zrxb8zEX2xsUx52xKRsMLA2prqKeIgUBYpTvnySvOX43ZYiWA02t8rz
	zkLq1uVAeDfx+wTqzRGlPuVoLK8ojS7LlQ4jTjc7RZdE5S+ksF5MHn4xXVkJyaZVvczftvHPKrY
	wz+oavn7349St6iDozQJCtcBppMB3W3uzFdY/Ls45e5LAuPGt4SyCnuWctzMYnZmhoBek/mm/kl
	x80j6I2a1EdUns8WFKZet1jhfhRhd2T7ctvfpZoWdMCSTwcCKXt6IZy1DB4Dns0fopd79bBqkMv
	TlY9ocpBGWjwRFhJSmoVhBj4L3B0euze3LkfX2Xz907kpTA4BRvbfvPgI6eKF8dCeeFpdFLWnSP
	kEfjghm6ytX/UXqJUcMXlUnz6sy6yWibBfNVRcOpz//l+F0rO
X-Received: by 2002:a05:620a:394b:b0:939:1459:efb2 with SMTP id af79cd13be357-939804008ffmr68369985a.24.1788462388848;
        Thu, 03 Sep 2026 12:06:28 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:939:1459:efb2 with SMTP id af79cd13be357-939804008ffmr68360185a.24.1788462388230;
        Thu, 03 Sep 2026 12:06:28 -0700 (PDT)
Received: from ?IPV6:2600:4040:530f:b400:d348:ae32:97a6:8a0d? ([2600:4040:530f:b400:d348:ae32:97a6:8a0d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406496e5sm1340806d6.11.2026.09.03.12.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 12:06:27 -0700 (PDT)
Message-ID: <1d2cd544-97a6-4ddd-8758-048bbd104eb5@redhat.com>
Date: Thu, 3 Sep 2026 15:06:27 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] dm vdo: Fix spelling mistake "postive" ->
 "positive"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903152325.16304-1-colin.i.king@gmail.com>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <20260903152325.16304-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I had to look at this for quite a while to figure out what was going on.
We made the same spelling error twice in the same function and somehow 
only noticed the first one previously? Anyway,

Reviewed-by: Matthew Sakai <msakai@redhat.com>

On 9/3/26 11:23 AM, Colin Ian King wrote:
> There is another spelling mistake in a vdo_log_error message that
> I somehow overlooked last time. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
> index 1d8375cc3c3e..043549b1fc2e 100644
> --- a/drivers/md/dm-vdo/dm-vdo-target.c
> +++ b/drivers/md/dm-vdo/dm-vdo-target.c
> @@ -443,7 +443,7 @@ static int __must_check parse_slab_size(const char *slab_str, block_count_t *sla
>   
>   	result = kstrtoull(slab_str, 10, &value);
>   	if (result) {
> -		vdo_log_error("optional parameter error: invalid slab size, must be a postive integer");
> +		vdo_log_error("optional parameter error: invalid slab size, must be a positive integer");
>   		return -EINVAL;
>   	}
>   

