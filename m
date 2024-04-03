Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527091494B4
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Apr 2024 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153389; cv=none; b=MQXtELq4xHPEp5B36WJobAzZ7O+v0J39387hel6ceqe+l3751IlfLbVXMFXY9FjMbe9c9n5eTcz/u4EDsjv8LltMm7Ytf2iOGs1OMICAQ+cgxotEL8h7d3x28XXHxBmy7KvgoOdxy5FZm57kEQbROXBf+5I5+YUX3ao6hpsF+Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153389; c=relaxed/simple;
	bh=uaBB+wQsNV6UWh9EWCIicCJ/cZxkRwz+9E3hPzTRRxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOXIbV3njhIScxF7w75sL7CJvheDiNmR23saPbyvSNy7VcFn8CNWM01Ak0kpyLXprXYqg7NMy1/44syz5N5LWXfEIDxbfw0tIjEny+7Im0lGdPAQFZCE7V/sgVMOznq4D7vaMs7skfZ2gOw2jvGYphn6QjM/DzEG2xIBpdJ3aOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IyJL8Y5f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IyJL8Y5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712153387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dbCAJSaH9jFId+0gZzIqDck5z9baO02AHMcYssDIEM=;
	b=IyJL8Y5fm1JzQ0EnLxXFdeJEsUWJ/7M7gcCuJW9WGNcap55omrMLIsNOOyxaj5uB8nKZxd
	YfXCMMlpXAcQjLU/yK61bqIPYA5WUEBGcgZURxfksrMjdEGG/4OfJFCtLgBz6N5dWIR24a
	+20zVrsL+TcIx4dkZu0sA4iD3dMIVi8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-trZ5-otBOsatAhzMA-QDXQ-1; Wed, 03 Apr 2024 10:09:42 -0400
X-MC-Unique: trZ5-otBOsatAhzMA-QDXQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-56c5ce6dd4dso3864970a12.2
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Apr 2024 07:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153381; x=1712758181;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dbCAJSaH9jFId+0gZzIqDck5z9baO02AHMcYssDIEM=;
        b=AEIXsQAUzdbKuDCE9xQOY5zFmPDM8OTYVc5OESY01VnGpfwUrzkOs7bwN3yKS0dpqZ
         forWVjEFm7wzNi9vtAf5o25oEy7O+fQUO9G1y1GW9X01kwfTxkWYMea5FdDBUYQKOg34
         ob8/qBF+NJqvATfQ5tFDoB/tGdgHUFRlEpew24qMbwEnEbaKr4cMekmmwcQ+JKjIYawd
         QTQIV0Y+fCwLZUVsJIvdl5kCIfTwYUCOqBxMyjPbUvZUtneQGL8jLaKOGq7rSne1ZSWG
         +D4DXz7Ag0X21dW9+yMbi3/fUf/1Y1t5otwM8CA9ue8YIMbrGa8xfxcagsvoJ4Nd1OF/
         Skvw==
X-Gm-Message-State: AOJu0Yxmd/WDUOJ1o4akFdnVLrE1SvF+HHLCdgeC8KSyLC4YjymYTDO3
	9UrdsmPSXT4FDE2D8vlLU5wMdhiJ9OQJoq+kJ6ILWajJ+VRnfPXcIakObWmoXDlU6XhcBYpOxgN
	N+QcTH/ZW5zRgWuQwd3Xwvslntl8oJy6fXsLjvncyG6Kzrp55J/GK8K9SPJy615GlYA==
X-Received: by 2002:a05:6402:518f:b0:566:ca0:4a91 with SMTP id q15-20020a056402518f00b005660ca04a91mr12828057edd.2.1712153381708;
        Wed, 03 Apr 2024 07:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5knLeof+HgcpRtumWCQlmMftyzct6dVwSxv5H+k5eapOlsocG/j7R3Dvj1z53sLwMEafApw==
X-Received: by 2002:a05:6402:518f:b0:566:ca0:4a91 with SMTP id q15-20020a056402518f00b005660ca04a91mr12828043edd.2.1712153381364;
        Wed, 03 Apr 2024 07:09:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r17-20020a056402019100b0056c4a0ccaacsm8024402edv.83.2024.04.03.07.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 07:09:40 -0700 (PDT)
Message-ID: <7591adba-0603-4843-b228-a0bf20fd116f@redhat.com>
Date: Wed, 3 Apr 2024 16:09:40 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] vboxsf: remove redundant variable out_len
To: Colin Ian King <colin.i.king@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240229225138.351909-1-colin.i.king@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240229225138.351909-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/29/24 11:51 PM, Colin Ian King wrote:
> The variable out_len is being used to accumulate the number of
> bytes but it is not being used for any other purpose. The variable
> is redundant and can be removed.
> 
> Cleans up clang scan build warning:
> fs/vboxsf/utils.c:443:9: warning: variable 'out_len' set but not
> used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have added this to my local vboxsf branch now and I'll send
out a pull-request with this and a couple of other vboxsf fixes
soon.

Regards,

Hans



> ---
>  fs/vboxsf/utils.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
> index 72ac9320e6a3..9515bbf0b54c 100644
> --- a/fs/vboxsf/utils.c
> +++ b/fs/vboxsf/utils.c
> @@ -440,7 +440,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  {
>  	const char *in;
>  	char *out;
> -	size_t out_len;
>  	size_t out_bound_len;
>  	size_t in_bound_len;
>  
> @@ -448,7 +447,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  	in_bound_len = utf8_len;
>  
>  	out = name;
> -	out_len = 0;
>  	/* Reserve space for terminating 0 */
>  	out_bound_len = name_bound_len - 1;
>  
> @@ -469,7 +467,6 @@ int vboxsf_nlscpy(struct vboxsf_sbi *sbi, char *name, size_t name_bound_len,
>  
>  		out += nb;
>  		out_bound_len -= nb;
> -		out_len += nb;
>  	}
>  
>  	*out = 0;

