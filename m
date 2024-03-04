Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C365D13FE5
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 07:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709535917; cv=none; b=kzU5kfxNyv6AGsOaj1J7Cd6mIP0HtM7ciksTojRdBXPr8rkwFJf2N2VJw7rH7z4WZPT9B4XHcymm2YpVp0SV1HPtquF5i4/tSUiNwWKHntb8RUV/sxwmkNKiuJfJxqmosTPdgDmEeYnPEDC/woItmU0opYWMFW5NER3TzDs5/xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709535917; c=relaxed/simple;
	bh=hNjxuYC2EJdA/XoKsj5uylY7h9/KQd56NM+y23zLnFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sNgGbYcaJxeB/ohIEQR8YI2Xu1FVpIQUQIWc7JDVJWRglPspKOI27MdrC4pInPpQV3aJzH6KpCec4PVsclM81j2GgYIHbpEJ56HnN2Ni1SgZ15CG8CrjycwZ/RLbuhXYcKue1mdDDOqT/cuuqesYRQhh4WrUJCNczQmF+vzqs98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bugxc8gL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bugxc8gL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d2505352e6so51274041fa.3
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Mar 2024 23:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709535914; x=1710140714; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZGUpUYM0VesXHneGzkSI0l8X+1IzpaMdy5MewuWCx4=;
        b=Bugxc8gLbcQ2+cvQPJ/1O1DFqxrhaKmlchtewNFn8jQiaN0CIL2aQMwONd4nL0CDHd
         AtqErT4VZ9KMLKWvGoniMCyzFC/iHsDv0HB8rQbxnkuQSzRey00zNq3yyVxZs65MkvJg
         0p1+Wer5sc++3L4wuDunp7alm3GyyPpAJz+h0mVpBLi9/tW1+JHvLZs0lFAsOF1cOKDI
         dfBaakynVSGgcFAhvx4XgPR+mG/ExQsR6AhoecAwgADHSYiINee1qwI4/n1uvWFpCEXb
         SA+dVNFTazGX+fIZemnSY+ixGmgMavjAjcZXuXYKl3JE3Iw1j3rvS2ygQZDv9gN/sNpG
         HzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709535914; x=1710140714;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZGUpUYM0VesXHneGzkSI0l8X+1IzpaMdy5MewuWCx4=;
        b=AZmI3XiFinax7e7TBlfcrKgSEfzGMs11TS+bab4rO+eCqm+WoHppi+OlzWzv7pAkTs
         tw0J/1HAm/O9VfXEDTkqKQ+Pp2mbmUZnGv5ZJUp3gU95ps4kYPpK6OUxH/qKlKwZp2le
         Q9HksTrG7hxoZ+OBmH2ZN/0WV/qXeZgxYMr9uwlynWrlbHlzp7F56vrLs8S85aSrYazx
         RUlAPREnl8vWW4J8WQo0Z0o3r1Z3gbbxCJjiDuW8ccbTFFzgFc+gCeifDBKIN0KNkDbK
         iF/JYkEEuUAOFLQjZhT1ZXbim8JbYdgzC9p97jk/V+uIl6vXPpW++CRHoM601daCngZ5
         kyCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRKfc8lNocSO9FMqHCiREnLGvgYAQ02/OLwyfyXRMLw9EfpJuidIaYpSEHI3XhIp/pVMj9KPIeXLLkpckwCV8dR1nokvdplpjJKFq0PZLQ
X-Gm-Message-State: AOJu0YwGbDO0Dy+8GepRdZwq0ZeHLTTarFpVBdz3fGclxfx+FO4S07s9
	H5+bSrj1t1o/ipDNHWJPRx4J8pDCAH6o4+SXSYowOkhSzTNbBkhjpQIAw2Ua0Cw=
X-Google-Smtp-Source: AGHT+IFW8Mx8FI4E0PUY4m2TiAQNZqb8odfxy6I3n9gy3/58yevGa3GaBngabXuahye/TfmVqpHMyg==
X-Received: by 2002:a2e:b711:0:b0:2d2:950e:2717 with SMTP id j17-20020a2eb711000000b002d2950e2717mr5298552ljo.35.1709535913963;
        Sun, 03 Mar 2024 23:05:13 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b00412e5e67511sm928473wmq.16.2024.03.03.23.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:05:13 -0800 (PST)
Date: Mon, 4 Mar 2024 10:05:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: core: comment that pinctrl_add_gpio_range() is
 deprecated
Message-ID: <533a7a10-c6eb-4ebe-adf1-f8dc95ae8d33@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pinctrl_add_gpio_range() function is deprecated add a comment so
people don't accidentally use it in new code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index ee56856cb80c..2d4412795ea4 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -412,6 +412,10 @@ static int pinctrl_get_device_gpio_range(struct gpio_chip *gc,
  * @pctldev: pin controller device to add the range to
  * @range: the GPIO range to add
  *
+ * DEPRECATED: Don't use this function in new code.  See section 2 of
+ * Documentation/devicetree/bindings/gpio/gpio.txt on how to bind pinctrl and
+ * gpio drivers.
+ *
  * This adds a range of GPIOs to be handled by a certain pin controller. Call
  * this to register handled ranges after registering your pin controller.
  */
-- 
2.43.0

