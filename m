Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119567;
	b=FJ8fh5kd4nUe7IRb1eOoQ9+duuUaKb86R1Tjei63QKHtPhyuviPMn0MNu1gs61tb96dW
	 yEYiV06wmUns4Fxv+4epv5GK61HVgGC9ZJIzOOC1n6YbAmzjpt6/DumJyH9xBzUjya0kU
	 67GcTTRtQk1r1mM3wPnkSjwkcEPLRPwxwaus3ZvZAxbEeXaPhwlTUGU8eGycW9wwTw1v6
	 CqUXZdXm7VGuu9Ot06dHrFCCtCPdPxdkLEk9lCRDB68XmvOtooJTOF6M496p5JUriAy6+
	 0p/kaqphHRRDqBICO9YviFeKinYK6ULQSOsI4cqsfCpOU4sNa0YunP1lD6fiVvjmReQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119567;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h9q4RHK/R0nfKuJsJcXl6O+86FApj7la5Nbt3lIB6PY=;
	b=OPnJ12E+olTJN62Y4pBcAOyXDDLjPipy8ecl3gbKckTDJdpn6mU9wwddiQZ7g4U+Dqf4
	 ecD13vYbNSUPKu/0A/P1cKlKHUxBgfp2QhtccBSWvSR6mIfd0X+xZ5jgfF5FUOnOJcJ6C
	 68XYQNuQQuxxFwN+rzEeQFF1zAdL5c0BXCpxMbvdRtCXrl5YUBuswO0X8TPYz6tph6eqY
	 M4A1+U/COewVJ/Ta9VIv0gElW2xGpyKzRpSqiZja8hCtaMQZaBAZLMF7TwE0tiAUtzDnC
	 Rq3OYDPene25g+I827DcU1kK+EjlkXxxNn9pCgld1wZaBAt7JaWNiJvDQDBZi02X79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=bDHFMxdT;
	arc=none smtp.remote-ip=80.12.242.24
Received: from smtp.smtpout.orange.fr (smtp-24.smtpout.orange.fr [80.12.242.24])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24061606A320;
	Thu, 19 Nov 2026 20:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24061606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=bDHFMxdT
Received: from [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
 ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id U8bFxyNDjCmimU8bFxGjUr; Thu, 19 Nov 2026 21:19:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1795119558;
	bh=h9q4RHK/R0nfKuJsJcXl6O+86FApj7la5Nbt3lIB6PY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=bDHFMxdThV5nKbVbBcL1IcDJfIrHo4Wf1Dlql+oat3tFCQKrM6oGW3EMnGdwZAHT9
	 eKpNbjUoogn2mcs3aLCvYllBDxnd8OsR33vPeOvRnwiZVJ2JHCUWAgT7ei82GuTuD7
	 m57bwl7KZKfzdoXxvPy9l6P9ZtiOSiIQ2PONnOFjEc/N9yajs3V5zkna/v8ZoLXsdf
	 M0iR/JlBgoJ3TFSwq+qysxa9HibfmoOzPhIcmZxxOhqdL5LQYg63Ylyu/J1SPF7Qq6
	 MHJeDMImLPbXlGEh5uXcwaspQuV/tfwIrLVJ9p7KEse/SbkMLIUki3aZx4vCqIoRi5
	 6kk3wSorr41ng==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 19 Nov 2026 21:19:18 +0100
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
Message-ID: <111e6c03-017f-47f2-a941-cba45697c1e4@wanadoo.fr>
Date: Thu, 19 Nov 2026 21:19:16 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: bdc: Use devm_clk_get_optional_enabled() in
 bdc_probe()
To: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Al Cooper <alcooperx@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Justin Chen <justin.chen@broadcom.com>, Neill Kapron <nkapron@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <07112f96-430c-4109-9aca-e5d17e333d67@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 19/11/2026 à 20:06, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Nov 2026 20:00:07 +0100
> 
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/usb/gadget/udc/bdc/bdc_core.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 5149c98bf9bf..ce09327250f4 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -530,16 +530,10 @@ static int bdc_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	bdc->clk = devm_clk_get_optional(dev, "sw_usbd");
> +	bdc->clk = devm_clk_get_optional_enabled(dev, "sw_usbd");
>   	if (IS_ERR(bdc->clk))
>   		return PTR_ERR(bdc->clk);
>   
> -	ret = clk_prepare_enable(bdc->clk);
> -	if (ret) {
> -		dev_err(dev, "could not enable clock\n");
> -		return ret;
> -	}
> -
>   	ret = bdc_phy_init(bdc);
>   	if (ret) {
>   		dev_err(bdc->dev, "BDC phy init failure:%d\n", ret);

Hi,

this patch is wrong because the remove function and the error handling 
path of the probe need to be updated.

CJ
