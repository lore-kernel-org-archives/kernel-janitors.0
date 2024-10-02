Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E929CE7
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Oct 2024 13:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875873; cv=none; b=gSbj8IVIoltQK7bQgqGNgBw7BMQmHJ2MyE/UzMO9tz3j2H5uSgJmW8wilrXx/S3afLhxpXK5rEmO4h+poxpil5iNVsNXyEf7isYjCJR45Bqm8AgxFxf8+8Uk8WUFxRDKxmTIpD0Y7QCJT6wIRinDx0ZCEVFwbQNkunrns+fvmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875873; c=relaxed/simple;
	bh=+ewu/LMChIya5i3n0Kkp7kJPqDtAkPddWgHlanlFSC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9/aAJ7cQc3SdQuC18Pmh/pPn56Kncpt0tVkfULugpI4e3KJxwmRbOLU74W87YXafH9c2mAf7jdkCZbFemf6x7dR67z7hGUcZA6N8Yar2W9A+xE31CSsvXctdkxpKbSjQgzBbhM4DjkAmTU8Z4fvpTxneGcSaz004Hl/xKTGEdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LgC6SRyR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LgC6SRyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727875871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kG31EDHNs4XBvMsZ9DeD8Jl6inKN8cIGFR2fYCg/NOY=;
	b=LgC6SRyRCtKj8e+Sn6r2FryrpZqujgKZCH+5T6PAtJnWQQBkhUhzmbPaM6unjVp9If8rnk
	SS9g77mOPsJbPN7NtOx2uMgY+Yuqu0twSai3ASuzVJAJRxcpAOxVCrxv4Sr5ZuGKSh0KYp
	smwBQJKOtGNOfdbN1O7Zwu/SCGNjY+8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-aMl2AeonM2C25OiFTDT7YA-1; Wed, 02 Oct 2024 09:31:10 -0400
X-MC-Unique: aMl2AeonM2C25OiFTDT7YA-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82cfb2e416eso711908739f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Oct 2024 06:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727875869; x=1728480669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG31EDHNs4XBvMsZ9DeD8Jl6inKN8cIGFR2fYCg/NOY=;
        b=w4U0S2yWU+Ks9zHFWbfGUgkbA0t5gYquQEGLhP9Wu4EeKd7i2NcDDcVBK3EB4zL6rh
         MHhNSNO1LyydPsBdHvO4+IzGQZAbmTTtFHs6fIesgF45iXmsBw8/siStGPeSeV9tvNnp
         5aXGbis7JBdHuFgri8lWw8dBaUzeoup9Tqm/0eD5cKyoeq13Xfkdx+IYZp6DcoiaCoq2
         F7GWqg+JLX+EDO4JJoYRBi+HZ1F91BgYzGqPAjSw7AswAB/v+WOqPvyd9tgjIUYoMqlD
         z71yJincPbtOh8O9zAfFJxOP5jSixSaNwNQm3nc9LmS0q5+LBfQTyJi6/U9mL+Q82KIM
         8pKg==
X-Forwarded-Encrypted: i=1; AJvYcCXURID0GpLepIHCDWuMwjw1oeSVIKSz16qagiuQNAp204rWVddVM6jsOk6xRqgV44pu5N3eZ8Tvcfnou7m1Hc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWyrA3m7aRC0eWB53yY2o+JWAZas/6m8S6tDP3E2ww1o1gm+YD
	31Tex8RLCa+jhL15ncJd5qWpO8uYtKm4DcBSTENej6X7kYAEmJuAXuH2+Wr8sDs+ph6CDAhUEOZ
	Wcu1lzx573ZrmWL8mt+GeVy8rtyzwSSpm8oh9EFRSBTFfF126YVBXgrm4UjzJxIW91Q==
X-Received: by 2002:a05:6e02:1a89:b0:3a0:915d:a4a7 with SMTP id e9e14a558f8ab-3a3659148c2mr28330635ab.2.1727875869315;
        Wed, 02 Oct 2024 06:31:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAdwEKr6plwqFuxmM9ma1CDchXeNSljjdg/khGqhkhWXUo0hb9PQuzdqRTOYWHtaAWvdfBEg==
X-Received: by 2002:a05:6e02:1a89:b0:3a0:915d:a4a7 with SMTP id e9e14a558f8ab-3a3659148c2mr28330275ab.2.1727875868936;
        Wed, 02 Oct 2024 06:31:08 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344bff8d4sm36646195ab.0.2024.10.02.06.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 06:31:07 -0700 (PDT)
Message-ID: <09db55b6-385b-46e1-92e7-ee4dbfe439de@redhat.com>
Date: Wed, 2 Oct 2024 08:31:06 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] jfs: Delete a couple tabs in jfs_reconfigure()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dave Kleikamp <shaggy@kernel.org>, Christian Brauner
 <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Jan Kara <jack@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Chengming Zhou <zhouchengming@bytedance.com>,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <12768f55-47e6-4bfa-aa63-0a82b911e098@stanley.mountain>
Content-Language: en-US
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <12768f55-47e6-4bfa-aa63-0a82b911e098@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/24 3:37 AM, Dan Carpenter wrote:
> This is just a small white space cleanup.  The conversion to the new
> mount api accidentally added an extra indent on these lines.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Ugh, oops, thanks.

Reviewed-by: Eric Sandeen <sandeen@redhat.com>

> ---
>  fs/jfs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jfs/super.c b/fs/jfs/super.c
> index 223d9ac59839..508666d4ed01 100644
> --- a/fs/jfs/super.c
> +++ b/fs/jfs/super.c
> @@ -389,8 +389,8 @@ static int jfs_reconfigure(struct fs_context *fc)
>  
>  		if (!ctx->newLVSize) {
>  			ctx->newLVSize = sb_bdev_nr_blocks(sb);
> -				if (ctx->newLVSize == 0)
> -					pr_err("JFS: Cannot determine volume size\n");
> +			if (ctx->newLVSize == 0)
> +				pr_err("JFS: Cannot determine volume size\n");
>  		}
>  
>  		rc = jfs_extendfs(sb, ctx->newLVSize, 0);

