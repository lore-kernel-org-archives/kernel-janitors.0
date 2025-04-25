Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C8422B8C1
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 06:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745561198; cv=none; b=Hr9jr+k10KvCIWatWirBx/37cAZPob+ddXWEPLC+K9nu42SbyJUe+F1syk3lJt0j57ninGJvOnv/ScdLuYUXsnTTA/Rk59j75wFPo2y+ZuttkjYWssIAQQDPMweXSlOOJ48nYSwNq5v3GD1pBidYf4EsRviz0pqRzXjqHLERxjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745561198; c=relaxed/simple;
	bh=CpBT/GJTl/qOHB8XXefQW8z5QInEFr8XQOgxoGfmDlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZQfzfYcSQ7J89AZvRWyRxPfPxJQnTQ2ZaIcPKrjZediXk5dDIq2AYJkNQOfpMaOllVHp6Kma0Ef1hxDgH7zcuxLpmlmM1yZTD2qWEO1vvs3RflHbdcqTJ+UWT65RP418HobW3GAA7Enl7Tv05JDHYOhUMQHB1WLRrzW0L3Ynq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFtSTVxY; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFtSTVxY"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso2533782e0c.1
        for <kernel-janitors@vger.kernel.org>; Thu, 24 Apr 2025 23:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745561195; x=1746165995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=RFtSTVxYzNOCGv2rnwTHN+3CiPKXQBATPCXeP6dr7gaQRpBhBoalnkY+LbUx0sk0K0
         uyWj5fDaidv+PnkUuO8tbvCDnuKmBCzQIZWOz1hEBc76bo18OqEBD5Oss8u10URqGgRQ
         BMs/R/kC1OEknsAsU25OZXJvGLGWnmeq+yhLXDIU5LhKz4jUdWSM0/q/rcBT1Vb5UIYp
         yibnkVOsVcZ4vQj/iAJ+eQ3TvnlV6RbQDIgst7u5CJ7Rlkd6Q4jQmnIFsYxEr9SWwjN/
         NmYo42eVBTKO60T5mAo/Q11+g3gVoJLKhg4TExj0Wq0SNGr03vP1PeV/Gv6UA8BHCwAk
         PWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745561195; x=1746165995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajgJc89GPboKToxuB8Pj0D0uNjRPDnR6q+9b48EFZ2E=;
        b=nXSfiepSzOO/+wkxe4BU6004g445pwtYhuUV1otk7s8xz04ui9SaFfEVsg4k2T3t9j
         1wRxsI5Q9/jL8ldOdDHNdZ7L9+gh2kMYN5pieZERY1LjB6C3uowML2g9axR0CpY1YWED
         5devzDJzj7DsFzqKdGyKrt3F2nED1BFxigDGGc8q+LzNzQMovUR3TVsX0OqbrIniTh9L
         h0FYiJc5xkyQIoz1DslzDkov4kjL3eFHzSIId4w1raRd8LWz99hTkGCMnZsJYhI1Oiib
         sdGRxcGfLP56hWuE2bmgbUTnkzk2Cwb6pvbNQGxbVFagYTl3lQoKCKp0BEFbssW+MUsq
         Sc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWf9y56A6EcLL8HvyJJ6iM362zdx6uWU0Eh/WvZJ0skZe08YN5Hsxzhk1VobpG+UPJuAddIfSYMg3PeLpcnDD4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8nG+/r5/ZUTVOUZC6fhapvnfbfMSr9F8FFb5DC+By+C1/KPbw
	ExmAF/hcVzS0Zbs6zH7xvl4YiAbphFhjPvMUz3mUbieddQnEsiEaMjG0NmBdYIG5lnbFQyu+P+I
	KOd76qEv2V6fu0OGhNRZ8VG0GtSAhm1auWwtW8g==
X-Gm-Gg: ASbGnctvRwsVbuWJta7mJDoLYE3bZYdjE4oKvoScpmESMtQcNs0RfCWJqEPqS12Uvi7
	UzbyfRWeNEiEAZBoA9ga0eqwH1Lto3JkdfyeUzpZd5ypbwpi2ZgPaC77r3P92kPeKpHm8uGPmH6
	55xPLi6LHy+FqQ4yGqPJ8EIQZSywD/Rz3dxh3V8C/Tio88HZYaMYJo34RL
X-Google-Smtp-Source: AGHT+IHk3Sh1recRtL0I0FAiNETtYwurKFY0CJ0FDTy8w0bAg/KMEvL/1tmqPiwb61pQkrz7JWUirq46fq8oitTFWfU=
X-Received: by 2002:a05:6102:3e87:b0:4c1:9526:a636 with SMTP id
 ada2fe7eead31-4d543fb6341mr362655137.15.1745561195672; Thu, 24 Apr 2025
 23:06:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
In-Reply-To: <aAkhvV0nSbrsef1P@stanley.mountain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 25 Apr 2025 11:36:24 +0530
X-Gm-Features: ATxdqUHyh1sPNfszHFCKsjMSGrXxYsTXLBiYXGTypFcI7J1MgDaUy852FfJYen0
Message-ID: <CA+G9fYu1GagoVWnhNFnknWf0_zk-O+5XQXDiL-XUdt8knhJYaQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marek Vasut <marex@denx.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Apr 2025 at 22:52, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> The "ret" variable isn't initialized if we don't enter the loop.  For
> example,  if "channel->state" is not SMD_CHANNEL_OPENED.
>
> Fixes: 33e3820dda88 ("rpmsg: smd: Use spinlock in tx path")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Naresh, could you test this patch and see if it fixes the boot
> problems you saw?

Dan, This patch fixes the reported problem.

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Links:
 - https://lkft.validation.linaro.org/scheduler/job/8244118#L2441

>
>  drivers/rpmsg/qcom_smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40d386809d6b..bb161def3175 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -746,7 +746,7 @@ static int __qcom_smd_send(struct qcom_smd_channel *channel, const void *data,
>         __le32 hdr[5] = { cpu_to_le32(len), };
>         int tlen = sizeof(hdr) + len;
>         unsigned long flags;
> -       int ret;
> +       int ret = 0;
>
>         /* Word aligned channels only accept word size aligned data */
>         if (channel->info_word && len % 4)
> --
> 2.47.2
>
