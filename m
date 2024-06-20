Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D02E859
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 20:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915056; cv=none; b=QTXK5jiNdrgc5q6FRunRUjwJnMXA3ROf5wA+Jf6+6R3YtiVSIku/1Pbi+LAKP0Vvk8UauvgBu8afl6wqFZXMMqXn8gaVo+Cd/iOtDW2iBOSTELWDwPsfqejWPAfmGKtWFBVX9DkNikw22QxGkRX7/aXmTwsiQatLjIli1h4+bnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915056; c=relaxed/simple;
	bh=DXU+kaQ13mDGzc/ERef772ITWHwfMHgJ1whdUUQWN5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSY3wII9fsL0HnWUhKlIEp0MEMvo/NRVK18QRcPh3m9JySHDRVz1Go9npeDg5CMzIvAVQ4kcjPCLsFvZCPJV9QL9ExzL8Thsgu1//gXbLtbiV71Sd0dGPBZqDheYOObuZIyFG6TM99Cda7EwPwEmVB6B1oK+eMXdonLjPRqVgg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qE4YyeQ1; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qE4YyeQ1"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso1516670e87.1
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Jun 2024 13:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915053; x=1719519853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjwgpUTvj0kF3WJiIA1rR+AvckGLAoKpZg/E+Ljg++0=;
        b=qE4YyeQ1jlqKNCbJwysMQtB2F/3JuJboDCc51OUgaRRNdeR8yzQy17/WTz3seimzB1
         IDECObgnpRBftgq7JvM8jtr7BPWcleXZqx2yKY0+NxwCVfm2tWzbsTAIsIiLJH8ibQjb
         Y7qGyvf6OvVX6fgB0DYISjxN4DbV55/fzTDixBK5MyBVYS9JniNV0T4wEvlfVvLcBnwM
         63RiqE49rBH3d6RqNStPqZSOG8GN3AkYbROaeSLYZEQNpzrd+U3CxEc5ThRg4dBIaRyy
         iSMgL4M6F0GNg1xschNsCjxRSvyTSY+biDtDllWo7s/ASaQjeUxAfylgvcswhWTCtkrz
         iKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915053; x=1719519853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjwgpUTvj0kF3WJiIA1rR+AvckGLAoKpZg/E+Ljg++0=;
        b=mRfbHz5+yLMgH9BoBAPblnGQLF/3S7+qoF7IVEFUvZuJRYgh3MN8CG4ZUbvYH1NDUi
         ck6cDbm0SA5O3z4gqxBDhKTvUhh1/JqlhS2zqxvQSN5h+35qimTAZVtBMdH9sfBHOV8W
         sUdkoGPF4af87A9sFO081w/TzIT+bOhdFMjilaKURHCtFTWT3KFRxdtbp9BXZpUGSTZW
         jmW6l6d+C3vlQ2gheTAq11XPRcn1gVfYk5tOyFQSyn52HuFW1F4b9YIIUpu5+484ZLED
         vpEdSFJXn76WPnXK0NvTa/iAVH5USeSrre1grvjpqY7pGPqcgG5k2gJ6EZEh/OMxF/OO
         pzqg==
X-Forwarded-Encrypted: i=1; AJvYcCVeYq7Po1MqULM8K6zwSoq+HjhVQ5E1ljmCqMujZYc7x0QyFll6k53MmQc4AnoQWFvb0ApHAWefZaAXVSG14p5lNIXCwemXw8mZuSDFp+A+
X-Gm-Message-State: AOJu0YzRbo/ygInUApkmsaujtEjkkmXpvV6CTMp4LZyr7b6h/2NBTMn6
	oCuknRgmWNabFQicvZDbt+SiexWMUI7Hb8jzeq6KnuR5lDbkURj6zpLAxyYs6F8=
X-Google-Smtp-Source: AGHT+IH9EWkurMSwiLpS9SksacWAo23NNuhZoV9rS+DFQjCv4svEZZXVS1qoWFAt8tLMdslowIQ2nQ==
X-Received: by 2002:ac2:4e06:0:b0:52c:80fa:2967 with SMTP id 2adb3069b0e04-52ccaa2d61amr4627356e87.12.1718915053081;
        Thu, 20 Jun 2024 13:24:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282ed95sm2154233e87.75.2024.06.20.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:24:12 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:24:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: qcom: select right config in CLK_QCM2290_GPUCC
 definition
Message-ID: <lrvvogzmhtxsjyebebjngnhu2s7rwwrxl6urvl35kte6n4panl@hvejq4mbwvb3>
References: <20240620201431.93254-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620201431.93254-1-lukas.bulwahn@redhat.com>

On Thu, Jun 20, 2024 at 10:14:31PM GMT, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
> adds the config CLK_QCM2290_GPUCC, which intends to select the support for
> the QCM2290 Global Clock Controller. It however selects the non-existing
> config CLK_QCM2290_GCC, whereas the config for the QCM2290 Global Clock
> Controller is named QCM_GCC_2290.
> 
> Adjust the config to the intended one.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
