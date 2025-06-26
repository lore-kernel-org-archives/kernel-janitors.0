Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FC82F1FFE
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Jun 2025 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897976; cv=none; b=M41qx7fKl8iqc6ZTplKjAc6P1ZNA3XjuyCYuFqcrREaT9WeF92CAhrMsBWp03EpjHWo3fct6C6jlhYaZOS1l+yHXBr+tKNKwTLXpOOIjSGPei6Z+MtYZ0KT9MFRUpcdPb5NuGUUkzvqJ3pdz9tRZ951X2JiexZImhhBymOgLpts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897976; c=relaxed/simple;
	bh=yuoTVrvF7Uo1dzDLeghFSD2HNx+GhM8K2Rklo6JjyGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6+OkjrIujnZDslLcObJUp7cKUkwdWPv3OHQ9/j/ZkX8VsiRUOHD3Q+bcnWAMm5hSHz3PtpISZSlyNh4/Bw5YJbrNQtc3YMnS6CP5goQqil9slVPv6X/afScQW9P6OL4QfoHxNgmw+So2UnlVjxz3t5I1hfWbMyuSI2C4hzNJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMKXHNVZ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMKXHNVZ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2ef8dfb3742so65765fac.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750897974; x=1751502774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=dMKXHNVZhKFVsCXmMOW1hCZA2DaqVesh6vcx98QvuvpjWpSg78pyJ3vTkMUDZYov6Z
         QDXZgRogS43Lgr5Jq3mMFxKELO2jPM0UpgHR1vADwCRYhK8L/OVmi4rPzG4kyR0HywJG
         pnqM3hi3aN3fPTBIq5XRZRIU7UXA7S/W3+c3QC7teMhmc+A27h8rrSZOAqkoiA1IljDO
         zN8tDc7Y9wr/wvtCNLNvjBr590Rm2BLLxj6RrOZihcoX3M6aoAGtLy7As+za9D7Xi+1L
         ZvSGNLMWdfBtIojrsWoWjc1lYhwBWBRUOruynAA13WZqrzEqJKLTvm2DmU/3BOF1IGU+
         332g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750897974; x=1751502774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=E5QatbxnkjOfZgiql+aRLwBBRenVa6am7PB0ikvJxJMiQa//Q7fgfLWAByRzsTZMB0
         rqez30gn9j/X8cdQpG85vyuwtFnikna8j7GmP/WKRNlBCymwNwu13+b2tHthgWYN9Hpw
         n7C3SeTvAUT1zdMN2958VQ8BHkOUFa2EHgWfL0m1q+GWPMyb8tsLvuICIYpw4tfp8pZm
         +uUA/TRXufS1YiwL6oDiEtCbAArnR7FFfNKsONWlvfubKIACXyELiy0LMPyPr4B3vTDd
         uBZdBIVXkdXAfLvEqT4GC8n4eAG4IEEIrcwcuXay20ydsWsHNLo0KpwsD6SijnEldM9u
         8eLg==
X-Forwarded-Encrypted: i=1; AJvYcCX/gESvDEn5PnsGlMC3vjIAQczWuK5DFFW3eoPvjoAayFHszeTgWWJWZ4mnx2+k0jvNuFkRj1Qf3Zdjp+imdWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuce1cTpwx8rln4b+E4i/uk3QOBDCrKVdiDJH+AkkyMEbwso/d
	ZQWvvhuYGxrDz8wRHL0GiA+fY0v4TZaJkzfcx80vkgshjJFK2gmL73FL3i1H/Uha3Qs=
X-Gm-Gg: ASbGncuSZlukARnJuQ/mSsG7ljFoCjX++OtmyKrBdhLu73t5GEnbB7ykb7DeY6iVhAX
	sKBBgKREGHK+MktQx4sf7h72+6n8+BdgDPPRfOkmH1CpyVLXbDzZbFCuUz9toF/tl1kWAZQmMVO
	4A3H0MO6av/wYPDfG/HY2CoPFvltjR4O3WNreQp/qC1N5ghjM+bI57/dxxqpd7egqNMLbSqO7cN
	487f28f8PmqeKQkktUqFnHfzzPJzjf28R+qLC34P8TOyh5rz8SOmfUX2KijAQQJUpkDSZmINt7d
	UdJ0R3pBAjO3haGuRZS5hM8s05LhDI8L5AMX1Bxrvt8rClbTD5HEIDpLWRdOAMKHgsE=
X-Google-Smtp-Source: AGHT+IGgCT0aIt2Vk/6CBqJqabPF5GPEQRnBgXUMrXjo+VORvIfFnmUByQnjm3rxOduTuCu1c8Cv0g==
X-Received: by 2002:a05:6871:330e:b0:2c1:650b:fc86 with SMTP id 586e51a60fabf-2efb213638bmr3538638fac.1.1750897974327;
        Wed, 25 Jun 2025 17:32:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fbb67sm81975fac.41.2025.06.25.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:32:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 03:32:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626002053.GA12213@pendragon.ideasonboard.com>

On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > This was returning IS_ERR() where PTR_ERR() was intended.
> > 
> > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> 
> I'll add a
> 
> Cc: stable@vger.kernel.org
> 
> to obey the media subsystem CI rules.
> 

Wait, what?  The original commit hasn't hit Linus's tree and it's
not marked for stable either.

regards,
dan carpenter

