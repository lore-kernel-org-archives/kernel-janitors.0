Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DA186604
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417495; cv=none; b=Nv/pMAB+247qoYE4bZZnFlTD5GZIWfjQwZIGLtcEmoIKjmgOTZb58QXUgsNInLAin/TOI4KrTVW2vpu4mt1XL1nmgwdLTlWX4HvC4n+y8EmzH6VL/yDEO6N0zAysLLI7gHwbIpj3WP1Zu6+H7+axN8x6X/1hk8tqxx5jfOMutTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417495; c=relaxed/simple;
	bh=TyzgdhWB7wc4Oocm7h8CUf5+ccWAlJpS6Qze8g7MVCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UK/ydZexvPAgMnYB/v21Dict2TTcydYtaKfSWjk+Ag5uoyCEgvbxEIrEUVnoqgT5Rqq0nKwhmIPtmKUPLz/U5rajmT7dcrIP6ILme9xYNVGDyIQAOSTG9WZCncPw4Ehx9fo6QLezn2dE9/t7BYHCUMjrBnWHwx33hiDBs+hw4w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KZoUL26R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KZoUL26R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-428163f7635so14773445e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Aug 2024 05:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417492; x=1725022292; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxEehQwCYE19lD5kSpNMOUjLeWoaZ9JR6aNfHSrkYjI=;
        b=KZoUL26RujwmTqGbIfsLemWF7phJGhDTslGQ3umr6jdd2rNEEEtYfAsvxVZk34pO9Z
         MKElc6ZiPKwDsGSw2g8UrXgjL6pd8tx6S3Z+HqroQLtRxInxFC+roZpg6giiVO7QWhj/
         L92RzZDXyTgX+gDzYYaVPCiyM510xGXiShr97QwfPx6ugU1U7ZbjIDjEGBQXghBZiUn2
         Mv1Yan8wBxP9ewEx3BY6TiayRSp0lC2ZftwR0hbYopKTjL5gaGcmEWalSFkLwSOMsYy3
         HGhbQRpTiZrwm6lrNvDyEdwTxAwBL+EdeLByeTfwK14/xLETd4JpWTNzqU8qH7L812sn
         UsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417492; x=1725022292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxEehQwCYE19lD5kSpNMOUjLeWoaZ9JR6aNfHSrkYjI=;
        b=MNZ36sXMfv1dwODEk2owFzaY0avhHIgbaUTktS8OYfZz25maGkdlhWBk54fiYn59Z3
         fk173aK/j6muMOnOcTZcrogypKljfSVmLPdpCGjPlosW+1YP3eXckMFRtuEfTKGuHYW6
         yBf5DVMUw/Ub4QM/0VSpzaZk2KcEyxxWn+RAFWQhm2pWijjoPbbmY6oUzPTPY1O3AhBO
         O2ovUbs8U8CdUMG4PWAhR5VOQlSJtRTM6XMfWf088gO+om25bT7Y9fWAw2tMEM5HU1jg
         YyGtlh/akxbYTlAhF3psLwhX7Y3+GSYMFtWg1a3Qgys1YmPJpWb4c5a5AnhmQUg7sn11
         AL4A==
X-Forwarded-Encrypted: i=1; AJvYcCXAu1CCZ8WhkPkC2eWyajmE9r15hciCFaT6ExB/065io3Omray/QHbP134LQEKMYPEEKW/lYPdxevFAR850sXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8wcutnYwUkrEMYxPcgetTR2FK4vN9js1mMNn7SEXBn/AQRJvg
	YXCYGM8wHIVzkpyQbwMqVjPpJiYu/1P////U6uZb4WH4+NA0Nsrv9p98F/BtHkk=
X-Google-Smtp-Source: AGHT+IFhHLlc095ixSKUu6CrmrIUdCI1EJL4zfC+W4OjuIo9Se2eQ/YR+U4xra16yh9krliC8NQqAg==
X-Received: by 2002:a05:600c:470d:b0:426:6921:e3e5 with SMTP id 5b1f17b1804b1-42acc9fe1e7mr16108185e9.24.1724417491866;
        Fri, 23 Aug 2024 05:51:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815b7e3sm4095492f8f.53.2024.08.23.05.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:31 -0700 (PDT)
Date: Fri, 23 Aug 2024 15:51:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: hid-goodix: Fix a signedness bug in
 goodix_hid_get_raw_report()
Message-ID: <8e6fe9f1-fcd8-4264-b28d-a1ee99b592b8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

GOODIX_HID_PKG_LEN_SIZE defined as sizeof(u16) (type size_t).  If the
goodix_hid_check_ack_status() function times out and return -EINVAL then,
because of type promotion, the negative error code is treated as a high
positive value which is success.

Fix this by adding an explicit check for negative error codes.

Fixes: 75e16c8ce283 ("HID: hid-goodix: Add Goodix HID-over-SPI driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-goodix-spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 5103bf0aada4..59415f95c675 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -435,7 +435,8 @@ static int goodix_hid_get_raw_report(struct hid_device *hid,
 
 	/* Step2: check response data status */
 	response_data_len = goodix_hid_check_ack_status(ts);
-	if (response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
+	if (response_data_len < 0 ||
+	    response_data_len <= GOODIX_HID_PKG_LEN_SIZE)
 		return -EINVAL;
 
 	len = min(len, response_data_len - GOODIX_HID_PKG_LEN_SIZE);
-- 
2.43.0

