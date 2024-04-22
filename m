Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461314F9E1
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 13:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713792720; cv=none; b=A823kNdfV/gWNqdv+L78FzZrY6A8Q0PW6ZeJaO/IGx7YGfKqsfU8i87asyssMJkzd8SpJv1Qa5ejDx+GDc4WPDYv514fXhXeUJNyaEt3CaG58dNrPuStXA+ccxXJpRgGsGvwJvvdk1O6JgRjFFKkx4ibtuNYJfYeFMQp08yNjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713792720; c=relaxed/simple;
	bh=awX5B76+HzKgX2w5I2DsXCUaJAK/mYe3tND15fSkqMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t7tdMWNdlg/XGg5Qc2pzOStgS7OcAO/8CPbwfZB8Tao98VeX8CddYXh2ppLWTUeSxm/lsrw2oVVyhFNrY2J9HNhFTPMiJJzcD5w1iFHRStyQXTm/3QekMQTtSvV0gt2fbdquDx1fUNUFlPD469vHpMllaCnc1KQCqAOn9eqLZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HeI52t5p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HeI52t5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713792717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANX+xaTgZeaaXkTxg9wkNgDys/2r+xl16Yffp7Qdk4w=;
	b=HeI52t5pmDLAUOI7ed32Q4LZxYVb8qc097HSrgD+/hAE0KluPwbqj/fPlLPMt4QIoEqHNS
	GVAvhOpivNcoaTrKCgVZJBnTOAmstokZINDaaHVL7AvZg+Mpjq7sSWSRruep8wya3qzeNM
	Pnd+i7+Tu29ZiT15z0fIUC/fpu8jLVU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-tPHV3FwoPXClnDmywPoYsQ-1; Mon, 22 Apr 2024 09:31:56 -0400
X-MC-Unique: tPHV3FwoPXClnDmywPoYsQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51a2113040so210576666b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 06:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792715; x=1714397515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANX+xaTgZeaaXkTxg9wkNgDys/2r+xl16Yffp7Qdk4w=;
        b=UxmRCg3KFY/b4pGdcX6v5reBrLQNcD0PqRbDgd8TxtH1qUzd+OenF/U8Py02SMTI6d
         CDw+2Y92W7G41U3Qy0ddMKgD+rIm5UVIfHHKf1z0CCpdePu3g95RvH3BTRvD+r5qXoVX
         V+IuGIs6ZOlmm6KTv5LPBmRVNGw+ygg6F32WFMlRzLPvMn6kwy0Iwe0Q1RspPIA4sp9c
         K1BFqh6eNmXyjMw7FCgYsstxufGI68ydUV5aJ76ciRF16mj0ze4N3qsexsVkH3oNmeOn
         MHk7sg6+yscTeZXVJPSKsABfViMSsrV6ryoqdP2tnpQINa2YqVAvx/ov/zWWqTpOBTiy
         i5uw==
X-Gm-Message-State: AOJu0Yzce4Swy9DAGtCfkneh1SDGJ9v+lbUzIm5Z/0Jgs0yoXOgh8e20
	a3OBUSY+OHo8zx3sovjtS+7fx8oiqyfjKvtjCxbd0bQl8Ox4IRNEj6RpDQE7CGGPszOanDSiuVs
	lqp2Mnmk47RLCkk6QKkM9BOHkByNNzWyQkGl0NfHBiGSc4PoMy3nOPAh4HG0RsAx3LQ==
X-Received: by 2002:a17:907:94cb:b0:a55:b272:ea02 with SMTP id dn11-20020a17090794cb00b00a55b272ea02mr2618065ejc.75.1713792714911;
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG82ZH8/Jtju0mhAdG8/PW4XqvBdwQxaB7D0jxdPhLmOnBwNV/D0nX8zuy+43rjCw52vpCfaQ==
X-Received: by 2002:a17:907:94cb:b0:a55:b272:ea02 with SMTP id dn11-20020a17090794cb00b00a55b272ea02mr2618055ejc.75.1713792714632;
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170907360200b00a55a8ec5879sm2130351ejc.116.2024.04.22.06.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:31:54 -0700 (PDT)
Message-ID: <25965583-4d8a-4e7a-9a2e-83ec2faa4187@redhat.com>
Date: Mon, 22 Apr 2024 15:31:53 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86/intel/pmc: Fix PCH names in comments
To: Colin Ian King <colin.i.king@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240418215202.879171-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240418215202.879171-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/18/24 11:52 PM, Colin Ian King wrote:
> The PCH names in the pmc drivers are incorrect in the comments,
> fix these.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

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
>  drivers/platform/x86/intel/pmc/arl.c | 2 +-
>  drivers/platform/x86/intel/pmc/lnl.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/arl.c b/drivers/platform/x86/intel/pmc/arl.c
> index 34b4cd23bfe5..e10527c4e3e0 100644
> --- a/drivers/platform/x86/intel/pmc/arl.c
> +++ b/drivers/platform/x86/intel/pmc/arl.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * This file contains platform specific structure definitions
> - * and init function used by Meteor Lake PCH.
> + * and init function used by Arrow Lake PCH.
>   *
>   * Copyright (c) 2022, Intel Corporation.
>   * All Rights Reserved.
> diff --git a/drivers/platform/x86/intel/pmc/lnl.c b/drivers/platform/x86/intel/pmc/lnl.c
> index 068d72504683..ec89e7dda103 100644
> --- a/drivers/platform/x86/intel/pmc/lnl.c
> +++ b/drivers/platform/x86/intel/pmc/lnl.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
>   * This file contains platform specific structure definitions
> - * and init function used by Meteor Lake PCH.
> + * and init function used by Lunar Lake PCH.
>   *
>   * Copyright (c) 2022, Intel Corporation.
>   * All Rights Reserved.

