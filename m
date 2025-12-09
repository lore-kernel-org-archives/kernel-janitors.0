Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C527B4F5
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Dec 2025 06:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765263405; cv=none; b=SwxU/0LkDQbqJpVJbqVqfxiPjqzb+pET8szJV9YumKxn5hzgrumhw9WozrhBuiB9CQ7oFgiT8yzOQS3Tfz6e7rodIL9JMp8f4G1ilI3yMxzWtZv8OPqCFFSwb9lPfT+j805gUZEzCCOoKKL14vV+Ex2O+xZKIyl2TqLvqJ7G9hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765263405; c=relaxed/simple;
	bh=BkTB8790tHyQvmqq4IjYxjq69PW1c+RO81orB7i99pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INvWZzWa8nOXRj7M+wGae6VFB2DCERsDBh09sMCH61VDF8nBYX1AsGb/FJun0kwadBpbbEsMtOp/yhZhJVYKnQ8Zw4i/R+eIlC6JMwKgcBO6y5Y627MBkQeA//Z2h/4or6bb6si2SWO1/YuYqCG91RdNUtc8MNMOaoWeBzdF+GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PtwxwBAq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PtwxwBAq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477770019e4so55553735e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Dec 2025 22:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765263403; x=1765868203; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GjNG6xVzRAmntQfwOjlrSFL+esIKWya6rAztReNCRwE=;
        b=PtwxwBAqGRSaLpJ4Urakr+AViDWm8Bnve1Kk4yGi2yc/msbE19A+FxRMLSsJFSDMXm
         QocIRmON9mfGAoaLNjj1jfhmpU+JqFkiXSqH/OvMib7mm90m3roC0Lg3rqG5m3M0xlcK
         mrm5qJ88Y0DL0iHqR3F0FlIKIr2sc/5FOKmg82IOVvB12eSsww4upvkt6uXxcSRGFADq
         K/Ah/EGjb101MG5PCqaJXXv8mlCKfRJUXuZnvJbJrPScsaALMRjc7gpUMgZLHBZFZm6H
         DIbDeO8vwJOMY1z0qqf/wOOiLdrjwNQthc2myMpMPhZqrtCEDEGXUCksDx+m+Fgzn2rv
         LhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765263403; x=1765868203;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjNG6xVzRAmntQfwOjlrSFL+esIKWya6rAztReNCRwE=;
        b=Rhz7RZC1eS7dUKNJKPKQ6NSxc9aUy5Y4dr7o6Ums6yskoSdngNxZFbCV+dce//AkSr
         Ojz0vWxVA0ZIZpQADWRAvbzZVy4CcUY/XTwiIZITegz1Jf0QIwvdr4CBvlOsl1y2HWOK
         GZT7YxlEfj1IDM+mF6yz5uTTWrdm98q+r/A5nvsUNB22dqjvjZEpu3CZt71ehnEcObdx
         +Z3rd5x1O9iPfSfszdzZ3jy9GG/wu3T+6DVwHEZdNTrtS6ndKJCyS9jrd+t9c/3JbFfk
         no0Cr101BDBR6UDO3jLq4F6JwmvYzIls4kyLCwGAqhKr18/qm+H2lqUJ9E5/ewVdo83w
         qOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgIEib1MkXQsH7M66kIMbNLHvg8E0vtZa9aQsy+HjaTeP59/vH8oTQCbdutsqhbANlAxC97am+ylCtILVeLP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcrZzh7Sk7jFLkG4JR3pomVY+vuLMECGHLSSOHUs4CR1lVzri
	Xnx0oz6Tu9lxvfcml+BaSkEgqd4H7/R9LmBHnqgcz1bSK6EIpvjquIFxYg/Tipc1dRyW7wnn+w9
	J8OMh
X-Gm-Gg: ASbGncso8f7Bq88HOKl+VVndp4A2AAQ3DRsyxRu+CGAp3qxWMfwhv1w50FP5LEJxgfo
	Z68s/A6CJPJms/jjhoFI2f9ZSWaf72tiR3NdEpJ/pfxnQalfPKE1Wd/AfC7lTP270NFgtse56tY
	BDorxSURSasZnHXKNXn7H4DLGeGagjAs1Dqo85GV5fzk97X+qrfEHxTXALrf9n2mB608VrJ/hEy
	Rujwt+ouNBMXkxufV4YFXJEr1SzRw/GvQyZGfCibe5qnQ9bGTWT2NvlVsRMcput6k4vzf0xp6Pp
	lJ1DywTjkyY22O/0mpqgrvvDvkgvvZd/VoxsCNM5zwbksDzWc7+Vcpla8zXBfO4N5MJyTJF+ZUP
	1c1cg3a4rvB5LeqiXjhVjY1xX+UerNYMV4gduI5F7DiLaS9G55mW3L+GSmuDkSuO64XWU8Q6vHi
	7e0rDmRkT3EQz1Intj
X-Google-Smtp-Source: AGHT+IEncnB1FaGNSKPHTzhN7ebiCnWQF3J9Qs/HjMyOnTYCImY9uSlSJG1pNfOpXJedioGuLMApqg==
X-Received: by 2002:a05:600c:4e02:b0:476:84e9:b571 with SMTP id 5b1f17b1804b1-47939e02db1mr117597215e9.14.1765263402635;
        Mon, 08 Dec 2025 22:56:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d682f10sm24836475e9.0.2025.12.08.22.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 22:56:42 -0800 (PST)
Date: Tue, 9 Dec 2025 09:56:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Johan Hovold <johan@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
Message-ID: <aTfIJ9tZPmeUF4W1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Set the error code if "transferred != sizeof(cmd)" instead of
returning success.

Fixes: dbafc28955fa ("NFC: pn533: don't send USB data off of the stack")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nfc/pn533/usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn533/usb.c b/drivers/nfc/pn533/usb.c
index ffd7367ce119..018a80674f06 100644
--- a/drivers/nfc/pn533/usb.c
+++ b/drivers/nfc/pn533/usb.c
@@ -406,7 +406,7 @@ static int pn533_acr122_poweron_rdr(struct pn533_usb_phy *phy)
 	if (rc || (transferred != sizeof(cmd))) {
 		nfc_err(&phy->udev->dev,
 			"Reader power on cmd error %d\n", rc);
-		return rc;
+		return rc ?: -EINVAL;
 	}
 
 	rc =  usb_submit_urb(phy->in_urb, GFP_KERNEL);
-- 
2.51.0

