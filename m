Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuF7Njc9"
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ED781709
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Dec 2023 17:11:06 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c9f4bb2e5eso20683031fa.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Dec 2023 17:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701997864; x=1702602664; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
        b=LuF7Njc9/olaMgMGhQBUoHypebXo/IuLosXImsBj/fW9c82Bmrt3ByXfbFvi/QG5AJ
         iX7bO5WajAfWZ2492D/mvRUYekJQcCP/CUpodDecmS4a3QdKG9RwLeNU3dG6MIih6uND
         g5iWJosCpPBxM4e7BOdsX9ZS0hARDdgqkNV2xRmJ5SLNQITopIXOHnUm4n4b2qJSACtC
         49+XMtDDRS1/jFRHchndv+MHMajZvmySCMfFAXbtRsjMr3LQ6HWIC/9dq5UYk+fCAkL2
         Kyxjp50I5tzAs7bzdWull4syDLxcec/ukTlVk/vN8fwUJJcxZXg+6Wk7gZFlbjejbalR
         GZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701997864; x=1702602664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPIpR2OhS8FsOJYuELc4EcfXoYVEFO3KDU00U/AniAY=;
        b=dS+FfPvcnUZr9DM8nqjUPO5uRyQXfHEKczdgWfAc7uyInv/B1IHZawZ6tl/1VvZx8f
         gPOZk3gtqXtdfFCMPOulCVxtjMR8LNDfp7swdYumRbs+7oZKPYflpbCXIMKHDD2NPpOn
         yx8I1KnVw20mQiSVYP3IkTmoUfZEkMdyQkPXWSOBBlYPu5RDfJiRTgpZzBUt0ud0Lvn7
         pm7IAd4NMJL7mQniPZUjG3b//trB0NspyC+txnWqmiRMuSIfJTbUciYQSrziW5zaD/ot
         zesY86XiBf6+++tqu4QYUoQYBcxnINsz2WiJ9vPbuEWg4WsP++B/8E/w+rtzEqrUS798
         h4wA==
X-Gm-Message-State: AOJu0YyC28pTE/s//dWGgDgCvTeL59syJXvWzqD+DXvNVpPxqNq6WkJ9
	gcFR7VL4mtgPbtHwUDogSB4L7g==
X-Google-Smtp-Source: AGHT+IEWZjda2fsJ0zD6R8OaPvGCIhuiY+08NdpNxfUAkKx96xvmVTnzBUfNL5Fr1v/oeWTLLPMssw==
X-Received: by 2002:a05:651c:117:b0:2c9:fa20:89e1 with SMTP id a23-20020a05651c011700b002c9fa2089e1mr2063453ljb.9.1701997864531;
        Thu, 07 Dec 2023 17:11:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227? (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id r1-20020a2e94c1000000b002c9e6cbf78esm86616ljh.19.2023.12.07.17.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 17:11:03 -0800 (PST)
Message-ID: <22f39a38-6293-424e-898e-77edc071ef75@linaro.org>
Date: Fri, 8 Dec 2023 03:11:03 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Fix platform_get_irq() check
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2023 14:02, Dan Carpenter wrote:
> The platform_get_irq() function returns negative error codes.  It never
> returns zero.  Fix the check accordingly.
> 
> Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

