Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890AB147C61
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Apr 2024 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712153426; cv=none; b=V/xWFOQrdgNXUVLVT7WdciEdWXUW/wFh6GHzRj/avbcDtTxpN07kNmG/SLlO+UXm3PEp4lH4ZmnJViNTq4L6c4GJ9N/+i+e0a9/KdZBCsjSS6CDXhg33XYCYLNdA72EiKE0vQHRH93PV1LGGnx05QWyxW0TS4gXeUKv2YvCUxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712153426; c=relaxed/simple;
	bh=PoednBtoE1tvUhRclYnddbxZ7od4p002R25b+VPNj7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNB3GOJ8P8i5Oj6NuTAl+zvfVpSy6weopUS/5trXEckxaMqEb1/RoD0GqHa1Jta8zW20+pSw9xdzgG/MPbqJj1XY0kNvn7vMQY4yBb1zH8/SkKTHJCLWg9448Hv28E4m0PtoZbHMS8tYVKc4EeGq3w/n9rmx5jWbs9Y7VidStP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PMAhvDvZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PMAhvDvZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712153423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0+cDn0/ggKHKobWqWXUXd6pCIGaHqIXCgKr68nR+EE=;
	b=PMAhvDvZ/UNE8ICWmLNcmsWi0fzLWe3zJl55ywZhbanwlUZkGM+yjFVeiv5oTMTFtK67zU
	ipC5iKbhLneXSti9m74L3JCbq27ZgnswwIqucHz21bm6LmTYDdc/dQLtdacU3x4MbrTkTf
	NXm+BfIOPqMRzhrnRJUDjvkOltMvtBw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-IsV-smEBNLqdRf8N1h-ZDw-1; Wed, 03 Apr 2024 10:10:21 -0400
X-MC-Unique: IsV-smEBNLqdRf8N1h-ZDw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso3009032a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Apr 2024 07:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153420; x=1712758220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y0+cDn0/ggKHKobWqWXUXd6pCIGaHqIXCgKr68nR+EE=;
        b=K0HIopCE4QD0x3Zg9pkUDSfkyUAqSLouXHaR71JZvrnht/FWGJdTy7xTQ3kZc8GSPF
         yAGfM6CwJsqb4gRbpEQT0YvWvShwE53SEAtfN9xpCFvVHsfBajGTHCMD8WhD8NSlZgSl
         YSiLeEbVZs6xhB4C61BpeJpdXRkzaVP3PpcqAWXzfrCNSFHwEq5Tl7/5h2MQt276mKpC
         bI3Y/M4pRe8c7woGtvXZNI1Nj0kz4amj+QFK2V3SsfK2qVpDBMV3Bv6PBCoPzCxL190e
         0AMhwhAxIePjQ4qV0UfJBNZmTdxeakfA5gcEoIg/9ialQXc+PQO+rEQqK4yh1SiUHysm
         YNZw==
X-Forwarded-Encrypted: i=1; AJvYcCVNQxpdyzlFxUx0ojUxbdLGYl0jI69ElDGHxND2/VFW5lz53Co+qddAeQVqrMd1zgcvpFqmHVoO3QB4YJRCfilhUOjeI/32qbRKnJ03YQk2
X-Gm-Message-State: AOJu0YwfMPBCVPYVEaYWtYYBYXIhdgMEBFw8PPcN7M3nd681WI8Qpd04
	+nxwI39zr3vC+N/xGs8/TImF1MDCxhtZpYv73qpyiw7ihsSy4yQekM4sgSTREKmVJVFstn364fb
	xTMAaOphBh+MS2cnKgwx7WVknR9NQZWNdH3oJeaFMQxvcyEJqu6SMGF9qCFX+bRg99A==
X-Received: by 2002:a50:a446:0:b0:568:d55c:1bb3 with SMTP id v6-20020a50a446000000b00568d55c1bb3mr11923376edb.31.1712153420160;
        Wed, 03 Apr 2024 07:10:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhi00Gg7n9Ts7IAvb+tYatzzV6iMMMdxXDIzLOIHLjOh3ba8rP3luYiF+Q/5TjPb4RqxFo8w==
X-Received: by 2002:a50:a446:0:b0:568:d55c:1bb3 with SMTP id v6-20020a50a446000000b00568d55c1bb3mr11923354edb.31.1712153419787;
        Wed, 03 Apr 2024 07:10:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ig10-20020a056402458a00b0056c0a668316sm948334edb.3.2024.04.03.07.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 07:10:19 -0700 (PDT)
Message-ID: <95be6ebf-9f45-404c-a643-89dd6ee4efdf@redhat.com>
Date: Wed, 3 Apr 2024 16:10:18 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] vboxsf: Avoid an spurious warning if load_nls_xxx()
 fails
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
References: <d09eaaa4e2e08206c58a1a27ca9b3e81dc168773.1698835730.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d09eaaa4e2e08206c58a1a27ca9b3e81dc168773.1698835730.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/1/23 11:49 AM, Christophe JAILLET wrote:
> If an load_nls_xxx() function fails a few lines above, the 'sbi->bdi_id' is
> still 0.
> So, in the error handling path, we will call ida_simple_remove(..., 0)
> which is not allocated yet.
> 
> In order to prevent a spurious "ida_free called for id=0 which is not
> allocated." message, tweak the error handling path and add a new label.
> 
> Fixes: 0fd169576648 ("fs: Add VirtualBox guest shared folder (vboxsf) support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, both patches in this series look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I have added both patches to my local vboxsf branch now and I'll send
out a pull-request with this and a couple of other vboxsf fixes
soon.

Regards,

Hans





> ---
>  fs/vboxsf/super.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> index 1fb8f4df60cb..9848af78215b 100644
> --- a/fs/vboxsf/super.c
> +++ b/fs/vboxsf/super.c
> @@ -151,7 +151,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  		if (!sbi->nls) {
>  			vbg_err("vboxsf: Count not load '%s' nls\n", nls_name);
>  			err = -EINVAL;
> -			goto fail_free;
> +			goto fail_destroy_idr;
>  		}
>  	}
>  
> @@ -224,6 +224,7 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
>  		ida_simple_remove(&vboxsf_bdi_ida, sbi->bdi_id);
>  	if (sbi->nls)
>  		unload_nls(sbi->nls);
> +fail_destroy_idr:
>  	idr_destroy(&sbi->ino_idr);
>  	kfree(sbi);
>  	return err;

