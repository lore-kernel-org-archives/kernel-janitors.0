Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6919A946F
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 06:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736748951; cv=none; b=Ww0aIofiZhan+of0DXOYmmNi656PRRv/Na4Z8cyiucf6FyFGcYjnZrCi4Hp76l5ScCoyH336qruWAs4YBjDeNp8WZkisxBVTkSe2x/0HHn3ELChyrmyYmyDkOtkjUqfRromPCZLOfEaxClMftFuEaLxHGBkvvye0QTIKtFxcNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736748951; c=relaxed/simple;
	bh=wJglrbrpbuhe0bcViDXdcbU/vXOT5RSMKFIKdYKZOSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syhlAVRxEQGmBL8VR9OUzEbT5SG/8QQgT77kamkmwzRsLiiuzCH5aJJTW7Z9WYpizUe64DVvBVpIyqOAgT5j4IECcYK8GBu2OL6XZWHdphUen6WyF+LRlDl5iKTw8xEUrDOlOyW4GUKbCZL1FUglR2wwgOzjYw0ni3I+3yOTHsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ElpooeCl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ElpooeCl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa67ac42819so562940766b.0
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jan 2025 22:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736748948; x=1737353748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljpYCVAC5Fhvp7P/AHA7k7jRhiqtXcEAQiNkoKKm8BM=;
        b=ElpooeClhMvpieCgur0BkJ7i2cxOSKgKKC1V0oHDQOPifzd2PF8Utlq5p6wsxXq2R9
         lbb86nDzXvq0fak5ZHcm5bCsvHrchHNFm+6D2ugun/Vew0JFhY4SeC0CzadI+R8kNIj2
         tnKTjBjKZ1kbxY02JOtCZjotnFORhoFWBEqmgPu51Oa9Zbmm9RJFbBIPi/CRJIqGZyTr
         ukbU2ki1RHPKPIclTi4zXLzXheOFztBIAD5eaMYQ3n0E5fmdZ5oBNUZoSDJ7DzphKa1c
         nQ1+knXbjtseRplVJ0BD2/v5TJZhNzJEyLZ9xePIcrPTyfdw3pd/A54jagmkD/DxPlx/
         ZVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736748948; x=1737353748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljpYCVAC5Fhvp7P/AHA7k7jRhiqtXcEAQiNkoKKm8BM=;
        b=cclr5K4u6+n+hxs0whpYVvMrufZd10Ti2qqHfcUeMxa29FUe8C7vYWQ1gjExC0cyau
         CW8X1TIz2WsAsc/fcCN35XyNZa8p/RoVKOjFNp0iKAUWezlY2fPlgXUXvAxEzXtDpb4Y
         YHkwWezTOR+EFhyZi95+py3ZKJal1ek2F41D0e2lzJjrcQvkAeBfFuzZHk8GbUXuLqDR
         cbK5dF4hYBRrarEydfHrcluGcyA1kdZtqcBNFyqg21pTxfqy/QZ4IQrW1kpReg9RaVxs
         0bRQGBkrqCWrkyVLkcMCz31+4lZlU/VmWVYVFo1BL5kHVTgfZwVNcHbrHSO97a6G6E4n
         vfLg==
X-Forwarded-Encrypted: i=1; AJvYcCV4uRLI32vBb4xXq3/h2fUkh3sWPC6M2BZfcyWMVMycL5nkHhCZulJKfeg3kIPz28TE9ej3te7mQYxZ8N91ZXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7fIdlHZUqMB7jf08esotKI0m23aMFYTKPxbKK8Ek8zLyBCNiT
	FkYY0/n28fCHPTUHXkK18TqcW4aZt08Jo0Go5wK8P+rGJoFxA+ib/jQ3U82Y7fbOmVC1TyBJuto
	6
X-Gm-Gg: ASbGncujGxJMIPrZiXUdysXkKaWu6qGhLtsLn09cTjp07cq2Y7oZem8vnPeuhPaNz5l
	w4ilx/bgFkU2KhnlDnlDmsy73F4BJb1w7gg50/+8xTCQzbpWH5VAX0WL0J0wpxUybpmYBxOA/ob
	t8Z/6zowjapvfvIikExV302ELh8+WkfXp+pkLqPBKNmU1Q+k3RyyngEwtpzoG5OXty2ph+3+ijw
	7ckCIG8QoKCzsKPBjmRtdO4xkhbzd2nI5rCkxoVSD727PCFi6rb4GucMYII6w==
X-Google-Smtp-Source: AGHT+IH1/GOLoqjf7Ff0rxYoskGhR3MvBLdbph8W02eRMXEQrG0OrOaaYHpU49nJqe6GOf8x8VpLtw==
X-Received: by 2002:a17:907:97d2:b0:aa6:96ad:f8ff with SMTP id a640c23a62f3a-ab2abc927abmr1766580766b.52.1736748947870;
        Sun, 12 Jan 2025 22:15:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f0c9sm464700666b.19.2025.01.12.22.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:15:47 -0800 (PST)
Date: Mon, 13 Jan 2025 09:15:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Even Xu <even.xu@intel.com>
Cc: Xinpeng Sun <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Message-ID: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if the allocation fails.  Don't return success.

Fixes: 4228966def88 ("HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
index 92a1dbe9a928..4fc78b5a04b5 100644
--- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
+++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
@@ -1519,7 +1519,7 @@ int thc_i2c_subip_init(struct thc_device *dev, const u32 target_address,
 
 	dev->i2c_subip_regs = devm_kzalloc(dev->dev, sizeof(i2c_subip_regs), GFP_KERNEL);
 	if (!dev->i2c_subip_regs)
-		return PTR_ERR(dev->i2c_subip_regs);
+		return -ENOMEM;
 
 	return 0;
 }
-- 
2.45.2

