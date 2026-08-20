Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784BF313535
	for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214633; cv=none; b=ID0arZLQ08KBT1WdgepAxgyg9A4Qo7yb5v+GtoUmFNaDHaKF5k2z30pLFQ3p1nro0lUthP4znXt0tvsEi5oEoQQqrCu8Mt4VOa0Pe4KOT0gXwPgji3kGyBYTSyvYNTFLUGJqql1QBK+Wbi9T7/obMvC8+K7hZkVIU/HJ0gkYqqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214633; c=relaxed/simple;
	bh=OS8QQfKfa52Fm2hu/CMn6ziZOz3INaWk58IbQhN59Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQqXWuRNN1F37ZHo/Tl9eAUzbrAa1qZDemH/NiRKsC+eHxEJORZgT8KHu5LiLHyoaGIKV4M3WOZy9WxIoPh7Yu993/ogadTwvdhMbFQZbRWSMXY9i9ZCQ6kalPt39SFQ4trZkIQd2ayLSyOeMbSFg/TgC4UsjGloEc5+QRWZPg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdXroyqZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdXroyqZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15c42a45adso120198666b.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Aug 2026 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787214630; x=1787819430; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCcFkuEwxJmH5FDcZ+ruFk0YOfoCkOWRnbqGE9ZnWD8=;
        b=EdXroyqZ6MKa2GnjFrgrAnP9coGENvXVvI4lALJiCjVxDERjqjEEYMUG/KzyReqG+1
         sgqbe+B/it15ZKsMJPVEZ1MqEMSj02ICi/xyGR5/002tvPeKMHRtiaLR2xT+YQ2erLtc
         AhVGSekyQTT7DR6BjdQNl1x7XhgdwHE7aioFyXxjZQ1j3B9Z70mwFR7OdRcQJQ2Le2mL
         Uz+XROpeNBtAQW6GLg6SfGJtfUdu5y5W2Q1/VwHpQXy7cTw6KOBOPGbNi5FjxrdYrJxK
         UpqHZAYz77ylV082B8YkzUrBBLlDAtrrQn05aEsFH9Zhe8vPIqryK2hfVDMSxd9ZwqXV
         gP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214630; x=1787819430;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCcFkuEwxJmH5FDcZ+ruFk0YOfoCkOWRnbqGE9ZnWD8=;
        b=gEU6uXcOtLHHYa3YDih+kZn4uwGGhA48rPRjSUiXWDOENQqZ2r4IHgHeMVTsGRsjA6
         9qR8xAz7H2hl7+CzAgG6SCKGVd1d+2QiiSxdUsRKoRggAdyAwqpNYDyboxUMubsVzqkT
         SAEPB8crWA/ZqFmNAvUoErJkYjAN5HX5gAHNOy7X5cxGR4d7nzv0cY1LnOFrZ8IEGV3h
         G4iOPcEQ7Nbz0XonJOyt+47RBs8oCtoDmDw/ZQTwO66PZAe5iXyAvaBsxemmgHs8ujLj
         a8NDMxp+HmjhUeu0Q+2LIQEEMOxzqGtaLdhBnHADUYn+c6bG53b28+YYZT/8Uj8g9zXA
         5S3A==
X-Forwarded-Encrypted: i=1; AHgh+RppAshJ714DQKCaEAGcac22F8BGbetENl70kkoMDVBMSrX8EZD8K2PfLWKH+EJewltzTtGE+/F6CBOfGtjzh7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwimCXPRHKxd45dDmvEt47qMOy1WAJcDWtLNf0YX1/zgD2TiA5p
	5iKGcvV/zNcdo4zv5XrpQpR5z/+vgJx7nEJzahHE3RfWUdSWK3ySTo/O
X-Gm-Gg: AR+sD11H/7CErR0JyETxv3ibuVSuImSbr6G9MI12SOKVwC5G/hbGrYQx4gcce/h+zJz
	JPMXMAaMqfq5IilPEwtwuqvAp7Mv5bKGbA2kHkK7+IuhcCoCbJOFKqvxhZ+D0Q1MVbc7aXoHfr7
	K2CQZblcUUkKjX3Lnp0NRxKFB/U6qp5Pp8lo7v/wN/8X7op14yKXw8ZA8aABYQbNt1Oa+DiUPgg
	GaP/UiuQuUkiSFMsZxD/GBY/AXaf5Dz7zBEXTKhCvJ03mOB5TZiC1nvMM+fzTOaNUBsvgy849G6
	ndtXWIBMCqUA1E9ww7TNv5sgJkpTeC004tci1UpKwofXPNU2TBgg0n5k1SB9nJ+kg63VRgP4kWN
	V5hX85ZpzvldSiYw1Tt4f9NsVr0Ddwcdi2g7JaMCGgox1fyqCdi8IasYE4IxHohKDX3dv4nXT08
	XqhTAYVqNA7w/F2IrVzP55+Rny3yDvVJvil6GvGWXazyW8/ePE9pLrqa41
X-Received: by 2002:a17:907:a88b:b0:c1c:2218:f317 with SMTP id a640c23a62f3a-c244d45ad2amr244163366b.2.1787214629611;
        Thu, 20 Aug 2026 01:30:29 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591df465sm39637166b.48.2026.08.20.01.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:30:26 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:30:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: Dan Callaghan <dan.callaghan@morsemicro.com>,
	Arien Judge <arien.judge@morsemicro.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chetan Mistry <chetan.mistry@morsemicro.com>,
	Sahand Maleki <sahand.maleki@morsemicro.com>,
	Simon Wadsworth <simon@morsemicro.com>,
	James Herbert <james.herbert@morsemicro.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mm81x: fix type bugs handling sdio_readl/writel()
Message-ID: <aoa7Hj1W7ETOrOzO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sdio_readl() and sdio_writel() functions, instead of returning kernel
error codes, instead stores the error codes in a parameter.  These caller
functions pass should pass an int pointer to store the error code but
instead pass a signed long.

This will not work on big endian systems.  On little endian systems
passing a ssize_t means negative error codes are converted to positive
values near UINT_MAX.  This doesn't cause a problem at runtime because
in mm81x_sdio_reg32_write() the error codes are discarded and we always
return -EIO.  In mm81x_sdio_reg32_read() the high bits are truncated
away so the positive value is re-converted back to negative and the
code works as intended.

Either way, passing an int is the correct thing and is a cleanup.

Fixes: b1906cea00b0 ("wifi: mm81x: add mm81x Wi-Fi HaLow driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/wireless/morsemicro/mm81x/sdio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/sdio.c b/drivers/net/wireless/morsemicro/mm81x/sdio.c
index 96fce187dd35..65277399bf18 100644
--- a/drivers/net/wireless/morsemicro/mm81x/sdio.c
+++ b/drivers/net/wireless/morsemicro/mm81x/sdio.c
@@ -381,7 +381,7 @@ static int mm81x_sdio_dm_read(struct mm81x *mors, u32 address, u8 *data,
 
 static int mm81x_sdio_reg32_write(struct mm81x *mors, u32 address, u32 val)
 {
-	ssize_t ret = 0;
+	int ret = 0;
 	u32 original_address = address;
 	struct mm81x_sdio *sdio = (struct mm81x_sdio *)mors->drv_priv;
 	struct sdio_func *func1 = sdio->func->card->sdio_func[0];
@@ -391,7 +391,7 @@ static int mm81x_sdio_reg32_write(struct mm81x *mors, u32 address, u32 val)
 
 	address &= 0x0000FFFF;
 	sdio_writel(func1, (__force u32)cpu_to_le32(val),
-		    (__force u32)cpu_to_le32(address), (int *)&ret);
+		    (__force u32)cpu_to_le32(address), &ret);
 	if (ret)
 		goto error;
 
@@ -411,7 +411,7 @@ static int mm81x_sdio_reg32_write(struct mm81x *mors, u32 address, u32 val)
 static int mm81x_sdio_reg32_read(struct mm81x *mors, u32 address, u32 *val)
 {
 	u32 value;
-	ssize_t ret = 0;
+	int ret = 0;
 	struct mm81x_sdio *sdio = (struct mm81x_sdio *)mors->drv_priv;
 	struct sdio_func *func1 = sdio->func->card->sdio_func[0];
 
@@ -419,8 +419,7 @@ static int mm81x_sdio_reg32_read(struct mm81x *mors, u32 address, u32 *val)
 					 MM81X_CONFIG_ACCESS_4BYTE);
 
 	address &= 0x0000FFFF;
-	value = sdio_readl(func1, (__force u32)cpu_to_le32(address),
-			   (int *)&ret);
+	value = sdio_readl(func1, (__force u32)cpu_to_le32(address), &ret);
 	if (ret)
 		return ret;
 
-- 
2.53.0

