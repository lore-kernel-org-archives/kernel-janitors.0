Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C27D337102
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641936; cv=none; b=lVe73RzHtLDWM1EcB5ndQl9EI7xZEdYPoFjFxOrmzxsZzVNm7F6CzRO//Fmzxz0CEnuTrHKP0Y7HH4SoMmDrzxMZ4E7RVy2/C8OYJqGHt1wXxXWnCQ7ldY3vSiMyBfwkX3ATMD+IitnCNFz2hYqfeVAuujGYQMI7TYz/H/Y6dQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641936; c=relaxed/simple;
	bh=a/PRqwHCM3ePs6OGfOUCvop0NTpl4VFk2TuFv1Vo9l8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OGZi7YyRntpHVHuxWf/wjMS6xKsPSTROpbUlC36HiLS9DtcqCxNZEGhfxrBTDzwECen3DSCdYwHIsdzTVXa3nhDc+eZOPxcLYDp2Mwqit86WZCdwP0Bow7ymy/YDZbcb2YEtBhFScVzBUbLatvHi+FswVdv9UZvsi6l9k5PlZCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AmOLuPlI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TS29kyG0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AmOLuPlI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TS29kyG0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763641932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6u/B0hyLbYqyZMSxsyCVEeXGSKwBFnSMtY/RgygB0IM=;
	b=AmOLuPlIllwMJoEqSFLad6QepANlNIDZN82qeptxMBN1YnvF/PkHF4Xo6TPrxJosu4/10q
	c0/grZXMWSVR5q4FDKAgsmU5UR5RAY4HvPwFYWCz6SMTbsXCSVXobRluhtq4mft4AW02EK
	sGm4MV4eiKfIlnAHgf3hhYzAThqTdrM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-4so-mDS3OqibjFsOh0kGpQ-1; Thu, 20 Nov 2025 07:32:08 -0500
X-MC-Unique: 4so-mDS3OqibjFsOh0kGpQ-1
X-Mimecast-MFC-AGG-ID: 4so-mDS3OqibjFsOh0kGpQ_1763641928
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so344019585a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Nov 2025 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763641928; x=1764246728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u/B0hyLbYqyZMSxsyCVEeXGSKwBFnSMtY/RgygB0IM=;
        b=TS29kyG09opwKuqN/fKV6BCM/qaJTVa5dWvefLwT/EoWvocgIP8105IQyOHkndtMPY
         OYbz/jjHpI2EPn1AT6nC1QBltOFZiyj3DUXg/GENLHonfs+yYGvLZ/mCUjclSTeL0VyZ
         oyeOHJGm9u+PhBR9HxBCipxWfXMklArZnto/xnClzHrLAlgU3ATMNXIl4H7v3R+SmzUB
         c6KA0iCIDDzG8/5HTjstk9VPcf04QTz63l39xc9waoIj079XmNyi2oLfuPeeMQEpc9u4
         QkacjXxQLB09ikBg6ta8avdyCtAxr+rno8Xmel+v4UzN9gCjkOOp4FBLkDM6vUmSJgy8
         yC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641928; x=1764246728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6u/B0hyLbYqyZMSxsyCVEeXGSKwBFnSMtY/RgygB0IM=;
        b=M0YeW/QdKq7WE1XsUHokiSv1eTazm9VWpy929nlqM6V3orQlz1XUnrLOmjaB1UWaz3
         8gSrgFW0I6k0YYzL20W9EeUl56QKR5hv/hG5sCt6Oobb+eIG4mXfOSGTuMV2HWz/yV7W
         mBL4oilwk5bVwee1LNrcdEaT7IheOSRuUh6yU0LCzbU3fVoJz/6le3LYTPBWXzjJ/iZi
         eK3mXprSRMJ37gjABW86uLbW4o8DOlUDK8fA4EjnTdDCI9SkM09n4tawTbkiiYzvUA/K
         JOObZwFToJuS3o+5elJQFuV2kj+HJAATTiMc36UJqwB7jECQ9zTLrv99msKMJ4+cJD5q
         Jg2A==
X-Forwarded-Encrypted: i=1; AJvYcCUIWJgDw4fYhPJz3RGVYjByePwHbVDzVAMjzYANUKNJXV7R5ArS3b05JEzr5U4GBVJKx6qY6X8Cs6VH+uUdq58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3U79NTJ6+503sUJccJS/GVkPLwz5fZgQKc07kXdYDYEJEOD0d
	ucqIypLm8YOzi7TFZzl02ol5qh49L0s0I+LxlMEZ+Uky/GaPNluyu1DFfAlK9emwyj2FVo3jd6R
	u6wQzgmlleBAGei3fiXQwGNSS5mRoppQxCTFSjBZnhtDFIDmNgEfHmg2q9BoiWaMPBghn1g==
X-Gm-Gg: ASbGncu4k4LAlAiXuSfAZwXb3pkT8Bg1kPnN58hv5/Bxkc/bkyxA6nDcVbXj5LrPmuv
	e5DDyfIrrf5TZ9y8zb8p4Mw9A8cfTNlSOBDOeGHx7/2RSePZPjVGRMcoSZAVgHI2bU0MSzDzF6q
	s61N3YtWsB6CNPHTCpsqKHwL6gIS7s53lSqlOTVsR65CLngwS4tiawm4HPow1o+vbMXqh39gI3F
	pE1sn4WgA2FWVVbYj1fs/pV9AluE1ajzb3y7MQ9pbYP9LQn+b/gwXqdNvlgvxK0MOKzqpUBDy5r
	xU7nP37MQs1iFcF7K+eyBDT97/pIs5y/RWVVhA/u1uBy7tPqq4hMZpx3TLkkCbtwRg4jyvvMpi3
	HmUprwR1mGw==
X-Received: by 2002:a05:620a:4510:b0:89e:c659:3f99 with SMTP id af79cd13be357-8b3271f3b97mr408120885a.6.1763641928036;
        Thu, 20 Nov 2025 04:32:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEQ/LqEz04B/HpHsjuRcrpYuYfHMx1VrNW1buaRB4EKjlwSgxldECJxxjLXOdZZILs6q2TrA==
X-Received: by 2002:a05:620a:4510:b0:89e:c659:3f99 with SMTP id af79cd13be357-8b3271f3b97mr408115185a.6.1763641927469;
        Thu, 20 Nov 2025 04:32:07 -0800 (PST)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295c32fbsm142408185a.33.2025.11.20.04.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:32:06 -0800 (PST)
Message-ID: <e314be75-c171-40dd-8298-dce40f65d93b@redhat.com>
Date: Thu, 20 Nov 2025 07:32:06 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] intel_th: core: fix null pointer dereference in
 intel_th_irq
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Jerry Hoemann <jerry.hoemann@hpe.com>
References: <20251118212106.541728-1-darcari@redhat.com>
 <32755d36-050e-413f-93b9-55d8306c165d@web.de>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <32755d36-050e-413f-93b9-55d8306c165d@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 11/19/25 7:55 AM, Markus Elfring wrote:
>> In certain cases intel_th_irq can reference a null entry in
>> the th->thdev array.  This results in the splat shown below.
>> The problem is that intel_th_output_enable() can modify the
>> thdev[] array at the same time intel_th_irq is referencing
>> the same array.  This can be fixed by disabling interrupts
>> during the call to intel_th_output_enable().
> 
> 1. Would another imperative wording become helpful for an improved change description?
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.18-rc6#n94

I feel like the description explains the problem well. However, do you 
have alternate wording you would like to suggest?

> 
> 2. You may occasionally put more than 60 characters into text lines
>     of such a change description.
I can redo the body of the commit and submit a v3 if the maintainer is 
interested in applying a patch of this nature.

> 
> 3. Would a summary phrase like “Prevent null pointer dereference
>     in intel_th_output_enable()” be more appropriate?
The null pointer deference occurs in intel_th_irq. So I could change it 
to "Prevent null pointer dererference in intel_th_irq".

Before I do anything else with this patch I'd like to hear back from 
Alexander. There's no reason to refactor a patch that won't be committed.

Thanks,
-DA

> 
> 
> Regards,
> Markus
> 

