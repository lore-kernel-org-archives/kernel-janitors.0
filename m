Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D461E376E
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741768497; cv=none; b=qIISAsSWMiaONahJxG5xSmASaMnMTL8JH7ncHbtAI8LqfQoJ+f9ytqpznU3lG2JGjNqJ3UFyrfI4/yAXLAgy124g7YdwfqvQCsTuyMEyGZ1WIuKhjj3hBlW7OYJJ8e+DhW6ioYSM5Pnuk1Erz/Bk3J0ncU06zHW3TpCqshH6d7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741768497; c=relaxed/simple;
	bh=osrEN2ym2yqpuL7B/cuo1QR3wOstyWvh9vv+cgRcDhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qc4ZCEMMFbT45dLAyn7GBywbFkoDUpSS/9oJTPIJ2ocWLDEt1UVpjzQZKdGn3GUJBfWP7Ts9ouVIi+jjiLGz97E6GGZ3Avmp6Rl69mdLxGzUdFQQOuYiHgaGTqIuiwODnQQmLNsbVTf5D6S6UeqbduDcVByUxtetDQ3XMOXIq40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JUS9fE4Z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JUS9fE4Z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso38286495e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Mar 2025 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741768494; x=1742373294; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fArFyg50PD5pydU5ZFimqktWgEs1OFGNquYCJqIcMD0=;
        b=JUS9fE4Z4fGSyssMHCURjAcT4gA/5iV34Ji63WM7MSW1984wR+wL1s+PnRIQ6Ri2GT
         fHKpJzzLRbUrDhJshPIoJ/2wt34a773ApWAv7qTV/H5WwY93hXpoUknBJ4rPwkKrfmBf
         LJfEdI6EjaOD1B9/zPRhlYs7y4aoSZtPodBfMB4DNigWEFdIL2w/Vaj9WIoALSm4tcen
         5OOu9ARQTmCZ9T3jTHS/1D+V2Eoe4kDLmq6qpmVM4h7mrO6V89prEfCZ5Y2gzGcVEFcL
         2Q0V+CHQLLhmKNi9g9X3ySUEmRNbXjHXr1HAgUZIRhbZQKJzSQxQXwzy3IL/F62LoRou
         DYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741768494; x=1742373294;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fArFyg50PD5pydU5ZFimqktWgEs1OFGNquYCJqIcMD0=;
        b=vY8E/39yxfhTj3gAiZr5uaHQE0dEsj9IB3iH0DFeLLlwEGukkIMXoodv+4dFsLs92z
         5dSXNrx+daSTQ/qyeZrjIbckrtqEOAZUyU2cLFTjCIBc9bUZyrZQEIUICasTonZM7mDv
         lQIeOKhosM8dGLtmM5SyOaLMfWpwiCw0bJQyr18s3Enwsg7mB52zH/M8Gcxxd3yngaXr
         mynn3y98pWyRkho07Pb2wNH5KTaJo5XFBZhgXJqm2CcjYsZUoaqQVKc+QKvNHZc/fCkC
         3AQVWWcP/2pk/S0WU4YAZXBtTmI6zXxWGG4pDX4OhcG8caDQmz9kPzS7NYFWiyJQhzQh
         Hq6g==
X-Forwarded-Encrypted: i=1; AJvYcCXX5lc+YbM8slEKFpB9VZYy6PstObEsijqrBbo9Wso852q2nNV5w2WXg+CNYL5hdMFiVqhwCHgGVeutf6CoR4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJBSNfVQAMPBpPMB201ZAuoHrY1Bba6OROIKkZNaDSGIt4j8Oy
	KUT9ABY8PZlFhMUcxhfuHwMF50nYKhW3W4gTrPH3lXD+PmrFjGrt0++qGr8BL3o=
X-Gm-Gg: ASbGncvgEMD3rhpY1/Y2bYu+0FAauC2SCL3oRFYXvwzyLTO4jPYwY3wiaqmjM2h1D28
	slsXgjixH/W2UJ9xvxUeUNV3BXcAOkX0942bqT+UwJt/cENCXfT7RzlCW0PXvbC+H56JYeltaLS
	72kIyr0qDApgel3XoQneNV1yoqCDzd+AmTgoa+B8pbZ0Tt03v8WB7T+N4Vi9BAZDVKRI7x/WHdc
	O8O6/8aDB9JRm76OFvgHBzTUOTRVUEhHov6qjC7QCLjwMI9i+zfRl3MqMUsDbLJMKnNL8XrSBfO
	Z8sfLxJXDjUdleb5VVEIm3WgOQvlZrFP1U7amV8qmaLUbmJgCQ==
X-Google-Smtp-Source: AGHT+IGHjBnjKqz7j0n2tGlwarxD7Uz84jTKBk1YUn+9ERyojr84A3D+g60nAnIQn0oMlwl9U3UJ+w==
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ceeeeb95amr92425115e9.24.1741768494113;
        Wed, 12 Mar 2025 01:34:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d0a74c59esm13832225e9.14.2025.03.12.01.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:34:53 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:34:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mfd: cgbc-core: cleanup signedness in cgbc_session_request()
Message-ID: <9e812dfa-e216-4e40-bbf0-d0b63b110bb0@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This doesn't affect how the code works because there are some implicit
casts, but the "ret" variable is used to hold negative error codes so
it should be type int.

Declare it as "int" instead of "unsigned int".

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mfd/cgbc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 85283c8dde25..0b3788c2c1af 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -96,7 +96,7 @@ static int cgbc_session_command(struct cgbc_device_data *cgbc, u8 cmd)
 
 static int cgbc_session_request(struct cgbc_device_data *cgbc)
 {
-	unsigned int ret;
+	int ret;
 
 	ret = cgbc_wait_device(cgbc);
 
-- 
2.47.2

