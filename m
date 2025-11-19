Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7759732A3C2
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 08:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541259; cv=none; b=t0u17PW6FR9fi/QqUtf3Gq8qIT40p2SeH3UfS4yhO8HtxNB3qobftwB0+0JItPI9s36/mukjx5K817IBN0cGSLWhZ0mYE4yWt9Rt7BT31EMSjMwqZDAxQAq5zOwAfmGG6Rdc1MZ5ViWkxThTtAWzSatcnAU1ThbF2S7dyZ0Ue70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541259; c=relaxed/simple;
	bh=sDksp5swMA41l8ILNDdI5AO8SuBCE7GdtYG/QHTLLsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fghtiWaTCEAGJwYwN7BG3HMjOIGQRxhWoIMq1O1ALqCeeDlNlPavGryJWDJab0jBA6TNVc2hFcKZi9MGPUCEZQeLPdqSrChuVDn8noDFFkP9MVaW7nq3X5qbnCG/7m4YLs/gqAqvHhe8VDkyCKRdY63buxCsI8keac9Rwgx6IuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueNRESUq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueNRESUq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47755a7652eso43308865e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Nov 2025 00:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763541256; x=1764146056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+/AlCqKHgv+5W9JRi5XzSllXLdQfh7XBTDVysKOlDI=;
        b=ueNRESUqhHs5pnHSHMLwcARdGQ1X3ed9aw57Q1DcgmxqU4+1pPpTexqAP7p8PSewC3
         63fWWiqvJ+vemEci2qmeyuYRtUgTYmwafHZYwpZK6Iehh7jB8Yulg5n64jZSluqjDeSJ
         G35F32BWpArRm/Wsf/kmzQR5mLkBNb0GM0OR52BB/3cWVacWkHbmDXTYN0Tsw+WR9p1O
         YqI7qVSOXqHL1MZkmr1Zm9IUXoU8ToH02COSIfPa7uI+mJ3CQYVqnwJnXZLRjqWCju0F
         s6YOPvblX/c3RIv+hdTsUT/LahjSo9tYTFMqNyR+ik/fuVKS20zt9jvvrhAA61Tbfjt3
         /Z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541256; x=1764146056;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+/AlCqKHgv+5W9JRi5XzSllXLdQfh7XBTDVysKOlDI=;
        b=ArnqFASdc0blDtb8W/rwYo4MMt7jtAnY2D6djmxHBH2zOt8QHCgI5n07vY8TH9euwC
         QDvjlSNbhbU7vGhGqwk+XiuX0ccutqPaDSo3OKTsEL7+bUu2NtN87tyhcpFNZ7lhJ6VR
         9EE5UEfVUMitF49682htRPqA7WQ90g2T5GE1svHKg0IMEddOdHWN7EGMxR4k3UAnE/Xq
         yqQwuS5wBZd7HOfKOcGf/hFIvTOrY0e6OtOKMU4Pp12fgSrABExK8TVxReOOZoGgE2oj
         a0zSIf2lYiJXhFj7KnwtJ0A0QzSTVc4qxIJeEIkScUjskAuDJqKOJdK5pp7KXu2BEZue
         0gLA==
X-Forwarded-Encrypted: i=1; AJvYcCXtOsSE9/imO6TFu9mSWauO0A7hJVDFOZGGaPI5X9OKnV9xE2nJbh81yRcK6lbkxvD6D6oYHmL9YFdZeQuULDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhrEszjb5RlaiAlYCkYq0MN60aR3Uowt5/p0A3wu+IAWoQyY+
	/Qe5aLhGKvbwZL62rSPbun/xMWlF6Jka9KAapc32a2cYGzBwB7OzO0MGk0dpNZayCwQ=
X-Gm-Gg: ASbGncsf4pBkq/mWFV1YbxelEHljRGZNGp+Rw63UgBtTQ3sd6rHeqa/Ww0FPzdWBaYb
	c/t8zlsr/8aUvedspnfnu5oRtJ+E0yXeVvQo/g9oWhFV+IACwglXZV1W5wLbKk/qjg4JsGLlgko
	inkxvJhXomzLlucDwPNTLUv5R2nWAzPR0HSwcwrkrpJ1iUwooU8hwkv6RKOJd7Wg4LxCGFl8vu9
	nxTLAOKAHVx35u4U/vG4SYaHenvr/bGgUwpY9F1qMpKwbGsOzke4lTL3a591hEDnAdlDX2ScRZ8
	bqOt8p4PVP5ptV06qnJEVKSUlBq53h84oji0bqR/PuBS+Ql1GW4xkF5z2sZRgab8CA1vh9mIKe6
	6yUgSTnzg3xuZgGSxNj3XeMjOVTNbP924rAWjg+dscrLDTHXleX4WfxvB8yIYZiVjKLG8qHKHle
	1RX9N1ewb0/zGM820vkfAt6N4G+G3yG76MHtk8e1RzpCdiug+hLhZ15Nq7VVNTBNSBAO05WhIFw
	Q==
X-Google-Smtp-Source: AGHT+IHVp2PGi8oPNPdtYdqf3AmS609D+mT7/vePIQoYDCp+mgoVIZvn2Zu2WgFpzUuhzVS0VARa9A==
X-Received: by 2002:a05:600c:c177:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4778fea1336mr196095645e9.29.1763541255662;
        Wed, 19 Nov 2025 00:34:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad? ([2a01:e0a:3d9:2080:94e4:fa88:414d:e1ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477afb54774sm19335905e9.3.2025.11.19.00.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 00:34:15 -0800 (PST)
Message-ID: <ae29237b-6b72-4755-9816-8ea0f935aeb5@linaro.org>
Date: Wed, 19 Nov 2025 09:34:14 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] phy: ti: gmii-sel: Add a sanity check on the phy_id
To: Dan Carpenter <dan.carpenter@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Michael Walle <mwalle@kernel.org>, Andrew Davis <afd@ti.com>,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aPJpB-QI8FMpFGOk@stanley.mountain>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <aPJpB-QI8FMpFGOk@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/25 18:04, Dan Carpenter wrote:
> The "phy_id" comes from the device tree so it's going to be correct.
> But static checkers sometimes complain when we have an upper bounds
> check with no lower bounds check.  Also it's a bit unusual that the
> lowest valid number is 1 instead of 0 so adding a check could
> potentially help someone.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/phy/ti/phy-gmii-sel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
> index 50adabb867cb..6cfe2538d15b 100644
> --- a/drivers/phy/ti/phy-gmii-sel.c
> +++ b/drivers/phy/ti/phy-gmii-sel.c
> @@ -341,7 +341,7 @@ static struct phy *phy_gmii_sel_of_xlate(struct device *dev,
>   	if (priv->soc_data->features & BIT(PHY_GMII_SEL_RMII_IO_CLK_EN) &&
>   	    args->args_count < 2)
>   		return ERR_PTR(-EINVAL);
> -	if (phy_id > priv->num_ports)
> +	if (phy_id < 1 || phy_id > priv->num_ports)
>   		return ERR_PTR(-EINVAL);
>   	if (phy_id != priv->if_phys[phy_id - 1].id)
>   		return ERR_PTR(-EINVAL);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
