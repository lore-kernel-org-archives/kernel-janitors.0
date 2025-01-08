Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FD61F3D4F
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Jan 2025 09:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736329049; cv=none; b=TZ+UXjit4ySTh/65vVKpxCawKW1FJzFzOKSH6PSgVM4Tna/JyGpivV6HgmzHdoiBEeiBW0jaqmxseB6I1yiLe0HB3jG15z8J8f+XyGUtoc7/IVX9zU20VCibWTRaj6cNsV7GxijEmvRKXbYgsEpsY36IjS3AmjXO6XBA0B11/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736329049; c=relaxed/simple;
	bh=tN5okRrYoBGpX5AHsBFQyTsnw6M+opkwftx20mNQmpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvzlecJIKqBCNgx8TDJjt9GQT64bltX6ShYnxO4DGQ+DD/ZsakiLGnyvu2+i6kWIbUSFwe0km4Gj6tbAUwh/wnA2K4XOfNvCs48F6b39sUJCb5SA6rjTx4jjpKbZVjgMzhoQP/woh5pgKp/I8hUbWWGEBPmqNR6tc5qUU6S0taQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WbvLTg1b; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WbvLTg1b"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e0e224cbso8243176f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Jan 2025 01:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736329046; x=1736933846; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G7qr+xH74BUjb8c6klWG/dnkZsYFFWd8nuIpiiYr2Do=;
        b=WbvLTg1bOmHUScDAg6n3Jcf72LV0C4F5BaYbkrNhVv4Etq9SwL2YtmmHXcKRsSC9iO
         DjaNjiCcM72pgH47QUAfRfTDrupjZQVAfjogC3S+8m4AfHjSHbo/LQpRew+zCbLEdC/m
         BKKmQCehxIRxSwXoZQLaydQ/v5m1yEcuwIrBSeR62YjD2UVU7lSt5eAryNusF669Erii
         zFigFZO2fUso82hFFzgRDfOpJSvRvNSFhh9uG5X2P+hnda5umM0BXPxsAWpDMXJXFU5x
         TfqPz7vhHT5DG5ufWAMLZvV10qVS5i3qKCxWEuLYZOBky7giI4ybkruhZyW2UN1RE1T+
         Kmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329046; x=1736933846;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7qr+xH74BUjb8c6klWG/dnkZsYFFWd8nuIpiiYr2Do=;
        b=haA9oPHzqTjYNnwnlh7kM1bSJsyrwE51Z5o0vEpVDAazMspbnkAPdTu9Sc0mHUEJ7f
         ZcgI1tYI0A3h5zn+dB5cJojFECSbJC2DFwxJe+9Wvf6NnntQHDlwpkuY7mkKV/jPBSKK
         2opTzy6z/bKazNjTD3bCGVQV8CRqIG8HEqNrdIAFqRkNvJgm1Yd67YglfTOc7bwhIXUL
         B4/kp7PkVNlRiKvJvzPRVrDK5fy4hq4AAYELPAun7aUeaGEqXxQW4KlCzSmzMMqFCQuN
         HmibjWkONV82E2AnANacSAGiPu1+HPf7+bwGZ+3yg8WsNSfxO/XUofUFMfd5efIcfA8I
         0Swg==
X-Forwarded-Encrypted: i=1; AJvYcCUU8ijrmW+pbx73RJZibO99RdXPdlJzvGevuqhIRId+w7SMMtE/wLczcUWkcg7+h0adKCU8X9bJPikSTO2YTEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0yR+gGr+OdxCPEI6iZoZGA63V3AoJdQRxuuScNR4sQLh6y5N
	R9xAa4jeuD9uq50rUhG7Ey4Yg0BcR9OsMUUmJTE+JS4EEWQR5yTYXk0NYH9Hhiw=
X-Gm-Gg: ASbGnct0mB9i+rZiOnDQpONiTxbRyuF5Ex8Tr1+KL0qr8YBZh9e/xy2wfuw4wKrIc9z
	bQbaMwoDbzP14KHTBrraYl+O1Gs9E3Fj75yh0/pEPgdDpSOum8mBTpa5JTFDO6yzZeKuELLluLm
	DWRTA16Q7DRHtpz9Y85W+jdic7jZSO+d6NZ2nb3IuaiRDY40d57X48UtdIK3nJ6bGW0mwzVK+rF
	VH9yauUvfojHXPv6lC0K3M5UolN109AUAEIJeUGTgwUHcsN2vMSZRW3QvYJgA==
X-Google-Smtp-Source: AGHT+IErnSBFhYxUJzsggddRVs3RbCystP6n1/ZQ4IX9uvuRMpjYqQBmS+F0oGJazwIWYP0YaTEAwQ==
X-Received: by 2002:a05:6000:18a7:b0:385:f220:f798 with SMTP id ffacd0b85a97d-38a872c93eemr1482892f8f.6.1736329045814;
        Wed, 08 Jan 2025 01:37:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm51765404f8f.97.2025.01.08.01.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:37:25 -0800 (PST)
Date: Wed, 8 Jan 2025 12:37:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: chemical: bme680: Fix uninitialized variable in
 __bme680_read_raw()
Message-ID: <4addb68c-853a-49fc-8d40-739e78db5fa1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The bme680_read_temp() function takes a pointer to s16 but we're passing
an int pointer to it.  This will not work on big endian systems and it
also means that the other 16 bits are uninitialized.

Pass an s16 type variable.

Fixes: f51171ce2236 ("iio: chemical: bme680: Add SCALE and RAW channels")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/chemical/bme680_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/bme680_core.c b/drivers/iio/chemical/bme680_core.c
index 26eb0fa77a43..9d73fd2cf52c 100644
--- a/drivers/iio/chemical/bme680_core.c
+++ b/drivers/iio/chemical/bme680_core.c
@@ -879,11 +879,11 @@ static int __bme680_read_raw(struct iio_dev *indio_dev,
 	case IIO_CHAN_INFO_RAW:
 		switch (chan->type) {
 		case IIO_TEMP:
-			ret = bme680_read_temp(data, (s16 *)&chan_val);
+			ret = bme680_read_temp(data, &temp_chan_val);
 			if (ret)
 				return ret;
 
-			*val = chan_val;
+			*val = temp_chan_val;
 			return IIO_VAL_INT;
 		case IIO_PRESSURE:
 			ret = bme680_read_press(data, &chan_val);
-- 
2.45.2

