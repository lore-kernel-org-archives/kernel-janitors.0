Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B7264FB2
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582086; cv=none; b=fwj2psaMFtXXA8Og8KqWw9aWgQLHfVFaYignasLrIiI7pZJeT0z42wn9K9RQpgUva7hFfDmx+odRql50jIrLjT/b+qYbrveuYFhs9Q+0LKFINXlNbVaTEUtdEO3WBUUHzYDNNg15xROAnQvM0vV8ZYRJUEdYpDI983CoSBRca9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582086; c=relaxed/simple;
	bh=dQnC/rev4tac0Ts401jwqrEOatxbEZjF8FGi4DM7cuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYfedWA1BJb/QtLSUQfG+LFjqBblQA+W2qvt4a7rSrL8ljJwWwXN4Olq9HGnGZzCDPIFE33ICF20NMYvEIwiaihwzdX1kQ9xL7UOSjLXp3r6aCSR8aqlgRzmTY69Mfe5sIxDDl3wqRjZI1thCq/uaCiDoNkO/CUaJMvfjDnwmig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pDhSkzzw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pDhSkzzw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-459e1338565so11255835e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582082; x=1755186882; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ueKHvcoj//pcE68ugp7qzX4T0VIpPeXJwA1UBSmhQZM=;
        b=pDhSkzzwsUQOUR01OauCzE+IMQQRfBYHOiGyhqD9G9K4zHjwihWk7kgvgNnp5AZb2f
         mLbQ8hTSe1TN4ZoE+NdwzQ0U8roQeam3U5gTnv+yfdx+G27kNNMnkcWq/vB6viZ9H0WF
         /I3eABW8I5UO8zswUYxbSFU0zo8d1hHIVJa5eGD3MfFM65lgYLJRXr85qbkfb/3UmgFn
         86zKt8Ox/KFit+ZsShPaynooikEJEKjRAbwtxSxEtYRFeRptp7mhM0X4wECqpMaRfHYX
         5j2l45ACw05K73vaKVn9KGeFb8CKQDD5ClGrEnL9gHvCSf1zQDPy2Sjx6iyWKkoRy+Xc
         CjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582082; x=1755186882;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueKHvcoj//pcE68ugp7qzX4T0VIpPeXJwA1UBSmhQZM=;
        b=fw3Wib6VfVJYrSlVWIe0aMBTwKFtqO1g0p7LMSqfmQIXExIQxn0pbnnEwsaGa18hcG
         c7bvr86AC9wL1+FJH6qRVMC3gYOLRnyI6Zn5OxVh1nBOq3ZEeR9yAlJLAbqq+CmAzpyG
         +Hkas306V73SF9ioTREYUoXqXkj5iQbXMSY/I+0ad8VQpRY6wjUjILHPv7+/dUqpWccI
         N3EIwLmH6CPWimjVVu6e/6E4h+E1xZ4mWvPzaIsry55Vkg2SVcQZe/0lpUmOjewVnYeG
         vf0CPa0q7HaCZ863WzdU93FlVd18SSzlqDPRCph17lHDOCKSs7RVstdKg9kJ4fZr44oS
         QsSA==
X-Forwarded-Encrypted: i=1; AJvYcCXTD/e0bp4A9/Dg/xhmf+e67RihClJeTsSbInIC8k65nKh9uBhahD2EATC0U2nsubmN59R8mqFIKUq9exuwGx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGg+sqGjx0dh3RvIXG2htWi334Gt5PCDIUDdGgGXRYXCHgXTHD
	wCMLXLXoRBwxGQN1Cjg16he4zPjKwuRts2Cj8kj2jMGSWBxFcORE4EwEf0il8Zwut2s=
X-Gm-Gg: ASbGncv4SXmCj/hdOjPSyCixigANKCnMkHtWcKLez57XQ0f+CIyjNno19kAHJ9Idf8S
	B/YM5Qi2PeEhgS8vav2W36XsnMS/nNnVVUItu5l+juvH0JHjB8XVuHzuGn+9kDqM6QHVRg+npS9
	TfGd1xjNEsvIP9tuOMtmWQM73kuRiFcJGloFBmTi95T3KaLJdD//6keX0bN5x2TateytDXcR06L
	hYhfPknqN3Vcc41nl1PT0DuH2r/5xGcW3MmBZroYV/JUqp2KKVKEr2NGSPb9rZYVeoyREI9qF6o
	Kl77+70UUPlS8uvovcIwZ1Ms94xjQu1IzzfT/VUU+5COQGPw79ZL89jQzdtgjIMDErRtdVhvH3g
	nqdOHi/B07t+sPRXR62zgf9Vw2t0=
X-Google-Smtp-Source: AGHT+IFZ7tU4QT0M69GUy2O5NIPrZtS9sVVhdfW1gHaibbjzTCtPYoGYDhegeuvn9CZmTQptWfLgtA==
X-Received: by 2002:a05:600c:5254:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-459e74bc7a7mr74819405e9.30.1754582081709;
        Thu, 07 Aug 2025 08:54:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dc900606sm162804165e9.15.2025.08.07.08.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:54:40 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:54:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] serial: max310x: Add error checking in probe()
Message-ID: <aJTMPZiKqeXSE-KM@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check if devm_i2c_new_dummy_device() fails.

Fixes: 2e1f2d9a9bdb ("serial: max310x: implement I2C support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tty/serial/max310x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index 541c790c0109..2b42a4c21a9b 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -1644,6 +1644,8 @@ static int max310x_i2c_probe(struct i2c_client *client)
 		port_client = devm_i2c_new_dummy_device(&client->dev,
 							client->adapter,
 							port_addr);
+		if (IS_ERR(port_client))
+			return PTR_ERR(port_client);
 
 		regcfg_i2c.name = max310x_regmap_name(i);
 		regmaps[i] = devm_regmap_init_i2c(port_client, &regcfg_i2c);
-- 
2.47.2

