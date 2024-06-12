Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BB16B75C
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179093; cv=none; b=Lwaoa7v+vRszBTdI/dtTnFQHErwW7Zo6AUitwdNDHl+Y7ZDqlsAYuult3QZLvlajgjSfDzDOaIbS4xD16f1wbm//wgiykl2hcmeTM6hSmZRbx10n0weIIowCRE55PzYGO4glZRulfGInQV2ZMCthFr6VErBr/VcWMSQf+phH3Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179093; c=relaxed/simple;
	bh=f9kCf84eyzlwQr0DOO2ZoS6yL8QyN/5Y2BWId6yPcqw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bIln6IY3XUPAOuwwe9vJ+oj5FRyFv45jwPKWk9c/utFVIrjsQU/jquk8LWompQwBPw5FvDaKEcAr/JkifwDHLHQ3hfmPbx0xk9Xrys1u3VTJDP9uGibCm5lJan1qqqywB2tTHEMR+yduuW5wqQFU03fB67Kk9OiddgmSX1Sy8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UxX2Gx2v; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UxX2Gx2v"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so36120885e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jun 2024 00:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179089; x=1718783889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcLdFTHsKhxsWZKbXum3q12jRap59Wq5H+bR99icFo4=;
        b=UxX2Gx2vTci5ZUMwkKEPUtRHnDjVZaIzpBtPV1bmdnOh5JjzU68jHI9CdYx+cXfNpZ
         0m7eAU2G0fIr5mprcL8TURPtx0uJHxl0RTHBOMKhiO/1IaKzOmLxUdKjrdBy0fjcog8g
         +mKa8TQzfSD/PouZupssU3/oDPVgnIGqBGbTnVbcMCJ9nNaAD9aQTRxHLqMzcarbT9L3
         rjJ/ddbyeiOlXQc4wLyumTyrwX2Td6lCKwGVYX5zQSHJEoIELsi3Jzw9c6F5oqyXvXb7
         ltLT8QzJd9F/523YIoLoRDueT3ce1NQdHqfD/ek7QE8J5u8g9NsxuOSBM65MROdBlIxp
         v5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179089; x=1718783889;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bcLdFTHsKhxsWZKbXum3q12jRap59Wq5H+bR99icFo4=;
        b=lG03SGykSXzO6ofWpUKniSFcaou7jTVgp2TXyP1j3TVUj4OphkaQdLckW7E2R4f83y
         0Xm0OpXEVxUjTiAeNnlwWXBm3O0VnMNRALKqEj4WWulz/Hml9Ty61+rQCa3QHYlYciGY
         YKRN3C5rodcH/vaLelB01izGDXmkoZVP4fHOGS4H3XtBl9h8TN5c8dPuyU8t1eXCq5tQ
         5e10XtMVZhK2ejY19kH4jhn1VjJ+txIOC3mf5XDlJz8RT4Yta2crqmwolYIqfIn4+p3+
         SZQVX606S1HLQsAvlw5C7LenMMmIrH9NHlqb8dJfu+KxtFl012OcPFrvf0S0Nl4F5qVc
         cRRA==
X-Forwarded-Encrypted: i=1; AJvYcCU6/WbCU9ZzdtnbPGP/IUcqY+kNr7DngITnzB/rdiCfgZAYQ4RBFi8I+P/WyB+QvZq+mwj8Uef5LMLeelH1nRidz5eHrxR9AiAOCQqHQNso
X-Gm-Message-State: AOJu0Yy9IXClQ3uRzT/ZJS8Bqrlullb303bU56AT2zzuYuzSIN9BMZYZ
	Q/QZ9zR1UB66G0qvMWEytmQL+DInsIfkycaewdXVIKuX8S3m9eYU9aaMfkHHRGw=
X-Google-Smtp-Source: AGHT+IEJGltYyHPm5azIaXZsfp0ocu+v/Cqr2tZqTEenkv7mLVqkDy/oZNxcfiL3PNM4Ugjo8ukmUw==
X-Received: by 2002:a05:600c:4f0e:b0:422:97d:4403 with SMTP id 5b1f17b1804b1-422866c2684mr12207455e9.31.1718179088584;
        Wed, 12 Jun 2024 00:58:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb? ([2a01:e0a:982:cbb0:30bd:bf21:eed1:8aeb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f26857582sm6538100f8f.77.2024.06.12.00.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 00:58:08 -0700 (PDT)
Message-ID: <a314c676-3dbd-46f8-826a-2e59367d30ce@linaro.org>
Date: Wed, 12 Jun 2024 09:58:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
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
In-Reply-To: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2024 07:50, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This is the last of the issues that I see in the soc directory
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 1 +

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for amlogic/meson-clk-measure.c

>   drivers/soc/imx/soc-imx8m.c             | 1 +
>   drivers/soc/ixp4xx/ixp4xx-npe.c         | 1 +
>   drivers/soc/ixp4xx/ixp4xx-qmgr.c        | 1 +
>   drivers/soc/mediatek/mtk-cmdq-helper.c  | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 3f3039600357..a6453ffeb753 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -688,4 +688,5 @@ static struct platform_driver meson_msr_driver = {
>   	},
>   };
>   module_platform_driver(meson_msr_driver);
> +MODULE_DESCRIPTION("Amlogic Meson SoC Clock Measure driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
> index ec87d9d878f3..fe111bae38c8 100644
> --- a/drivers/soc/imx/soc-imx8m.c
> +++ b/drivers/soc/imx/soc-imx8m.c
> @@ -252,4 +252,5 @@ static int __init imx8_soc_init(void)
>   	return ret;
>   }
>   device_initcall(imx8_soc_init);
> +MODULE_DESCRIPTION("NXP i.MX8M SoC driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
> index 35825ee95dff..34a6f187c220 100644
> --- a/drivers/soc/ixp4xx/ixp4xx-npe.c
> +++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
> @@ -764,6 +764,7 @@ static struct platform_driver ixp4xx_npe_driver = {
>   module_platform_driver(ixp4xx_npe_driver);
>   
>   MODULE_AUTHOR("Krzysztof Halasa");
> +MODULE_DESCRIPTION("Intel IXP4xx Network Processor Engine driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_FIRMWARE(NPE_A_FIRMWARE);
>   MODULE_FIRMWARE(NPE_B_FIRMWARE);
> diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> index 244ad8d7e80b..cb112f3643e9 100644
> --- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> +++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
> @@ -465,6 +465,7 @@ static struct platform_driver ixp4xx_qmgr_driver = {
>   };
>   module_platform_driver(ixp4xx_qmgr_driver);
>   
> +MODULE_DESCRIPTION("Intel IXP4xx Queue Manager driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Krzysztof Halasa");
>   
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 046522664dc1..dd70d4d2bed7 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -526,4 +526,5 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_finalize);
>   
> +MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
>   MODULE_LICENSE("GPL v2");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-soc-1780b1939627
> 

