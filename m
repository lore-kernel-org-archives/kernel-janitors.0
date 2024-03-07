Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7576F1EB2B
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Mar 2024 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709823704; cv=none; b=Pp4s8F54NPY6USEDP4f4mS8nN1QtX7YsOFO+0b0piKlCoFzwp2Jotwmi/jCwOaNlpGB2DoCZMOZTHGGDF7MpSP52dN92y/V3bP5nKYTsBC35Sk8F9wO5CHY0jtzMi2FPBS21IN+wub0XoSqj1y7EbHbHIBBUP5iopQk08VYS6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709823704; c=relaxed/simple;
	bh=ipDoqaGJry8XFBbFQETVEMjCjvVX2Nh/sKemer023uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1dH+Xy1D2EixRbSXLFn4xojVznNohfMk49nxLhmSQwsuh99CYByowg9Ck338vByFeXHPjkxzfGyP+RSEqGJgPhhiR/yCqKjBUjamlOMJHmK1FriaDGWgLPsZGgGU4/pVrSfLK+GWZpRflnsf+Z8fjavq6Jxelbxc8bCdpVAajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVfDVpD2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVfDVpD2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412eddd165eso8168095e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Mar 2024 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709823701; x=1710428501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOmqNU1lRIv+DURE4y+VSSKM4JviZ9Mjbtz+cTDb3pQ=;
        b=oVfDVpD2rEQcNN+t1VExQRRMXde6sCLxfdQiGKZcaNkRFCwS+mUYEOiuHxEf89vQwN
         0rnqYvoDVqIDtQ9rIeVSw164hEIkTEgvpy6TMNIuJGKvbMZnHx+4XFcizLvCkomh7/LQ
         KKzcZiNzu8V1VbiEwt+s4iSLKBftUzIGw5JSHxBdRAybgAPwDrxnJTN7cfytX5aXEnmc
         IjX2tm0rAUz2dBp3MGg75khgVoo7iN7lAiq/4FS8mx06XBPW3hehhCxuzZv0+JOaWtwG
         SjXQOuXMnZL6PQuzpTaIrJjUdZwcCISmRxrkgY62RrGCEt1BzagDq3DAFC2RI+jBBHZL
         peoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709823701; x=1710428501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BOmqNU1lRIv+DURE4y+VSSKM4JviZ9Mjbtz+cTDb3pQ=;
        b=vvLJUpcaWBvl3GL65BWpXfBPHREArjUFTrruyWqDAWjTRRtGqesPyrMAo8wiT++40j
         ZTSwnytsDcEP6rO9bEhhIy5QyhLXffHEXa2lGebserIasgUqNIYXE7qUrYMcN4pkiA1v
         x7nsUBZkOgPbVZkt3wzJSlUbe7+C+7+wJ6wSikxPaA8VbT2K2+/mLY4sVO8SPAwIlTIi
         LxhNN0Bbwg5aTu0O/4aKKQ7ZthZCVqrSGehsdxqKHQwkIY8ipi5S1B/QsG5tAq6Q8XBF
         PuR3iAejIdnqI/SLO6Wple0Pu8GjI1IBhiUlBhGrjj8k4Wq0HMoorB7h7RW3pOIvllxd
         Wa6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzZJUwydS4jeV2wNjISW4geaSO/j/Ft1tBOsYABgvj5XxFlD8xCGwmUdM780o+Te7pTd58MWvCwM4OXJqJ/pCQgbuq075okt0KuuxPVZKd
X-Gm-Message-State: AOJu0YwRIa9jVqxb87rKwWVGC7x1PLyJvjbGamktelC/La2GowUf3y8W
	QTbkv+oPBQdDSuJbirngXy/jHZEitnLGrD1KIUrIs4LTv6nku9ByFxDrL40wtsk=
X-Google-Smtp-Source: AGHT+IFXXvFEdnuCc608hqNnc23woWbYxgaTjHYOVLDkcJ3Xj6RdzH1iq7gCWqRkt07ORdYnLKUfuw==
X-Received: by 2002:a05:6000:11ce:b0:33d:a011:ae42 with SMTP id i14-20020a05600011ce00b0033da011ae42mr13601493wrx.38.1709823700652;
        Thu, 07 Mar 2024 07:01:40 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id cl5-20020a5d5f05000000b0033ce727e728sm8175322wrb.94.2024.03.07.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 07:01:40 -0800 (PST)
Date: Thu, 7 Mar 2024 18:01:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Yang Xiwen <forbidden405@outlook.com>, kernel@collabora.com,
	kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: dw_mmc: remove unneeded assignment
Message-ID: <e34b5334-48c3-4ebd-9a1a-7ea26899d304@moroto.mountain>
References: <20240307122129.2359553-1-usama.anjum@collabora.com>
 <SEZPR06MB69597EEFAB2F77049E9B257296202@SEZPR06MB6959.apcprd06.prod.outlook.com>
 <8cf4333a-b500-4fb7-8176-734fdc892da4@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cf4333a-b500-4fb7-8176-734fdc892da4@collabora.com>

On Thu, Mar 07, 2024 at 07:51:37PM +0500, Muhammad Usama Anjum wrote:
> On 3/7/24 5:22 PM, Yang Xiwen wrote:
> > On 3/7/2024 8:21 PM, Muhammad Usama Anjum wrote:
> >> The err is being set to 0 and replaced every time after this
> >> assignment. Remove this assignment as it is extraneous.
> >>
> >> Fixes: 25d043841db1 ("mmc: dw_mmc: add support for hi3798mv200")
> >> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> >> ---
> >>   drivers/mmc/host/dw_mmc-hi3798mv200.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/host/dw_mmc-hi3798mv200.c
> >> b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> >> index 989ae8dda7228..96af693e3e37c 100644
> >> --- a/drivers/mmc/host/dw_mmc-hi3798mv200.c
> >> +++ b/drivers/mmc/host/dw_mmc-hi3798mv200.c
> >> @@ -133,7 +133,6 @@ static int
> >> dw_mci_hi3798mv200_execute_tuning_mix_mode(struct dw_mci_slot *slot,
> >>               goto tuning_out;
> >>             prev_err = err;
> >> -        err = 0;
> > 
> > 
> > Same for dw_mmc-hi3798cv200.c, maybe fix it as well?
> Sent separately as different Fixes tag is required for that:
> https://lore.kernel.org/all/20240307145013.2721326-1-usama.anjum@collabora.com
> 

The subjects are identical though.

regards,
dan carpenter

