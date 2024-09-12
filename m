Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B014192B97
	for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 08:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726131261; cv=none; b=ZtXJzq+w0zRi/VJyhiWnRp+sDXIPZ7Xpx6xk1+w2npZjY5zK6NV3xJ8MMaALpHy6Ll80h0Xw1JHa1FXOc98SrTpL8Brky69cruZNBXFLwcXmZoWOFf1rLiKNFWkCM0THIAYJIbHCzDC8oxgBIN4GfC6ZGSdFgi4JxhAN6b4sHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726131261; c=relaxed/simple;
	bh=j1H/LQU+KRaH8vLBRx7IOo/incd6kQY69GR5S1StL0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WfBbUnl1V2EJKxFaALjcRimvMlI5F6WhF2QN6fYy54n3BxWwftxbQJgahwWS9NuiHfR5BArYofQu9veo095g2c1wInJgtS/ohwzQmUEBKAyKAMMWkXDqON56VIMz1pVHsJbxWzqzpLzPpB/PhpoRGUyyh2Gbp9m4f6C7Vx4+zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsOo47Wm; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsOo47Wm"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5367ae52a01so546807e87.3
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Sep 2024 01:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726131257; x=1726736057; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6xTo7HvOp6BGkaOkepw9FiEEC088bMNPj7HC0ZD3s=;
        b=nsOo47WmstHJAz7ORw3SDueC0/Kr1ZhBsHePG1GapiHGBSJRi2AaZ8jW6rtse6NxwL
         klc2oDbtt36fMUIq8vK0xfeKFpSKhd559CAUZYbuOUv9RCtj4wduAlqpq4XYT2rq2q3o
         MK0WPpm4e7rp0zd+ayv8Alye847L6wzdXkXKls0wSB13b059xS5Np4BDaUrxoGtPXr3D
         8rnNVJzmKeriayncCTy8xYWqMzIy9vURnliPlfiGMi6A9lcSoqbSejd2fosa07E7oGtz
         eFoLdkvOo9k6UqdcvainSF4+v2CmtH+/nv/bhAjmQLbCQhpaaFB65vwLMWHKgwGeVdIS
         EHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726131257; x=1726736057;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6xTo7HvOp6BGkaOkepw9FiEEC088bMNPj7HC0ZD3s=;
        b=GG+XsqAoAsoN87iAwtMtdabEI0+iTJv2UkrbEe6r9/9BwpajPg+a4mEEa4qI4jc2XS
         2MoFcvvRhC5qMk54dEbAjADQVIruiHhlNtDRVZPblrvt+gX3RXjqEuXIfMzbysebVNrA
         Y13JIT5jzB0nsu7ykmTs5OUJJnC3i9zeiPx50P8YOh8ycin+N9NUSjK/W6qOj+uLGHpd
         scWNpaNjnOUIxJz/BCWySrnBCjmv4zUhMrVbG9jU9jJ14peJN9vbMpdkATBN/sAfNT7W
         73JWm77nWCutlzSUyMaR7B6gDGxoMwMOeVbfDFXt6D9tUWWMr3J5TxJLJ4dei2uIs8Sj
         rWUA==
X-Forwarded-Encrypted: i=1; AJvYcCX/PRYZ6188JiXdptxKBJi98wAF3nofYfTPD2oUYzPxEywk47wAfjcuQ50rdt3sBi12bhyV7SauSr8fUew/+2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YztR0VrMRtTTulNorsZxGFHGiB0e7I2jQ3NvGob2+ZoNqwE0mzz
	xZ5v37PvgWh3zn1y6Z/C7ksLVp2EH/Xak9i5VxtSVF4jqMolTgVbHTPQdtGv+76CTcRZzr1UZaB
	+
X-Google-Smtp-Source: AGHT+IFzsuu7oMLBhtKyRWUucos4LUolH6WDN7469j4SbLucF6WDfDEXEEOBTx1ZVZJhemXusR1tSg==
X-Received: by 2002:a05:6512:1384:b0:535:6a05:f9e3 with SMTP id 2adb3069b0e04-53678fa9edfmr1104944e87.7.1726131257317;
        Thu, 12 Sep 2024 01:54:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb742d0a1sm127875675e9.2.2024.09.12.01.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:54:16 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:54:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: dwc3: rtk: Clean up error code in
 __get_dwc3_maximum_speed()
Message-ID: <865e56dc-37cc-47b1-8d35-9047ecb1984a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __get_dwc3_maximum_speed() function returns an enum type which, in
this context here, is basically unsigned int.  On error cases, it's
supposed to return USB_SPEED_UNKNOWN, but it was accidentally changed to
return negative error codes in commit f93e96c544ca ("usb: dwc3: rtk: use
scoped device node handling to simplify error paths").

There is only one caller and because of the way that the types work out,
returning negative error codes is not a problem.  They will be treated
as greater than USB_SPEED_HIGH and ignored as invalid.  So this patch
does not affect run time behavior, it's just a clean up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/dwc3/dwc3-rtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-rtk.c b/drivers/usb/dwc3/dwc3-rtk.c
index b3db5cd9906e..e9c8b032c72c 100644
--- a/drivers/usb/dwc3/dwc3-rtk.c
+++ b/drivers/usb/dwc3/dwc3-rtk.c
@@ -184,7 +184,7 @@ static enum usb_device_speed __get_dwc3_maximum_speed(struct device_node *np)
 
 	ret = of_property_read_string(dwc3_np, "maximum-speed", &maximum_speed);
 	if (ret < 0)
-		return ret;
+		return USB_SPEED_UNKNOWN;
 
 	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
 
-- 
2.45.2

