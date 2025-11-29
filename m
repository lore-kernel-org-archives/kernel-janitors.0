Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2430FC29
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764427891; cv=none; b=Gay9qnU4FF2grk4+yIstuWnRlMTtgw7XSiKunwBjywaqmsAqRjoCarTkQxtREpe0ag+ZjJJ48Hudk2dCDF6st2SlAu7Ocg4dA7TpzyXEYHSOy4gSbvIMWmLvSJoxHly6A/81HceHqly04/gNOxtVe2rZT0xwNjIfIHDIZXObmjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764427891; c=relaxed/simple;
	bh=yXuzbB5K11aoAVf/PdUJHMtRCcNu/HBG6yFSLwI7cz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uW7GdbVPdRF6xOsg9UVL8JI8xy91UkV7e6e/mAYbh+Bcl2paVebbveiztKrOVUKQYJWuIUO+Ykl3N9OL2y5BHbj5ZYoS8byEbX1bC23jLUbX1v2UJdpmaYB5q3DL2d2/INmqtcaKtb+NaarV92OQnAbjf25tYLi+kTSYIfJPMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yI6hHpiD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yI6hHpiD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47796a837c7so17705745e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Nov 2025 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764427888; x=1765032688; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQXSoEpDQmDeEVkRT8hWvYNMqUAKPz+YQ9lwivzZSic=;
        b=yI6hHpiDZYiY8sH9G6K4TD3LgzDVhEiRTQkDIlmGtfKljEOnrlmLGUcpyAhMttZqh5
         KMiL/V/kB/39iDelyQCgwBKp5USNS2/Y4dwKI0de6A/7ta6U7y8Q9WwVgdwHjEEN05bz
         +9jyyrodsrEvoyRrA+kR0q4edLVnNWti6KoHi/wu2K1o8N+44ZYCFZcJS8Z5kdG/fjxn
         6SxsEZy6SqUlA35ml+CX6seO6V6rLsOXspnH4WNTj9m/iSpwoh5wUSv4MDC3/9vLF8SF
         g80GLyA+3zW5UUAARk/eLT9y+32QM4uUgyxOUQIabIG1E15A/rZfSLXWKOjyD/63NISQ
         ydWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764427888; x=1765032688;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQXSoEpDQmDeEVkRT8hWvYNMqUAKPz+YQ9lwivzZSic=;
        b=LrSi/1lzUXoPowqS38NCE4aA6Zb3m9vzB9z9z5/LgTw+wTGrz6t96hxncfRdzAVOAE
         9GfKy0asLVdxiDuM/WTKPRhtGFTZNxby7w07JKqcKtfdQ5K/eg1waBSeCT7up9XFqtHR
         8OEnAgCb5+Xn4dxVngCOCYmermjVzVn9GA7Ss2aoRNpds4kXt+9n3Swy00WwKHxNbmye
         KaV3lFUcsKjECrS9dWOMPJd7Mvc5+rau3U3EkIe7v8KBWhXpzF6Mddeo+H4xaV7peX4L
         hx9Wh5mtzE11oOmlIM6Ejs8De1jjg3+aP+O5ymOLVb2NkxBXmM9vS+hjzC7/XGJzS69M
         UmOg==
X-Forwarded-Encrypted: i=1; AJvYcCWORFux69+WEn45zwIcH6alIMgg1SF11gyG9+TtAo0ZhSQCB0YSLm1HQ2UAX98nBU+WFcT4SzN41eY76n5iMf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPGI8yhGq92LMqR+LkeqRBsrk+/oF4IMsekz1KxJZmw/YxwF3
	CY3fQT/oI/VKwg/qBPfiqNwXWC1JqsJ6wfCb0D3Qz8G8orA1JQhmZQ0Lc1VEXFOyAMc=
X-Gm-Gg: ASbGnctNhMWV0lbs6KDQR6Ds9apJja4QaqUyCj4EzKOvFWQ9jhJB6BxGhcGpF/bMjws
	1k5mbMef6g3OHhC0NXX3u1SsR1NiU56mTmLDbxnED+oCzJ9HfAGZcBdqwINDY8ysRVsFlJBnrAj
	HPfYXT+81cU/NY3tTFeTBxEHoNS2jpRV6zdD+7Lwr+rn4O5sGlsYJ1Ah6nMUaWJppZV1+2JAwUo
	niTPdnrNq+r1PZJE1jf0xtDUfPz4aZ0+EYZd66La+Sx7h/jqregvTeEI2mQNxSZsiH385yQSZRh
	Glhy9xK4KM6euFf4riFBqBYO7v5dptFBIFXmK33zeGSmK12KJtMOnScvQa1LjiS6G4LKc2I2+QG
	FkhbXMwhl3YLswFw5zIgY9HC78exSjSfXcf3Yo1QOEobcAELg/IU8/OF6MtoonNifGZHiQTVlZ+
	dxb9cpSqEJ1kbIqknL
X-Google-Smtp-Source: AGHT+IFCRIwwQjXEGnr5KMD8PEnIqaChZkTl9rQxhpXbO/SHWmtpUVHAMBf5uCzKP5Ao1WMgSwS/nA==
X-Received: by 2002:a05:600c:1c13:b0:471:786:94d3 with SMTP id 5b1f17b1804b1-477c01b201fmr310642095e9.22.1764427887618;
        Sat, 29 Nov 2025 06:51:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca4078csm15519763f8f.29.2025.11.29.06.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:51:27 -0800 (PST)
Date: Sat, 29 Nov 2025 17:51:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] serial: 8250: longson: Fix NULL vs IS_ERR() bug in probe
Message-ID: <aSsIa3KdAlXh5uQC@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_platform_get_and_ioremap_resource() function never returns
NULL, it returns error pointers.  Fix the error checking to match.

Fixes: 25e95d763176 ("serial: 8250: Add Loongson uart driver support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tty/serial/8250/8250_loongson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_loongson.c b/drivers/tty/serial/8250/8250_loongson.c
index 53153a116c01..47df3c4c9d21 100644
--- a/drivers/tty/serial/8250/8250_loongson.c
+++ b/drivers/tty/serial/8250/8250_loongson.c
@@ -128,8 +128,8 @@ static int loongson_uart_probe(struct platform_device *pdev)
 	port->private_data = priv;
 
 	port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &priv->res);
-	if (!port->membase)
-		return -ENOMEM;
+	if (IS_ERR(port->membase))
+		return PTR_ERR(port->membase);
 
 	port->mapbase = priv->res->start;
 	port->mapsize = resource_size(priv->res);
-- 
2.51.0

