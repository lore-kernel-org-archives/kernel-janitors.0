Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE920E314
	for <kernel-janitors@vger.kernel.org>; Thu,  8 May 2025 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746685592; cv=none; b=ozxjF6QqkHzru7RGBaxsW0FORQIOm4jAFm2RTbVtcQLpZiTz+KaOYywiaDqgUi8jcbSQI5gjYgiLFJd6xn/0cYcEjDDzn2om4v7qi4gIeL3D/Cv7inXawGAW4gyvOj01F/0sHqCh4ajgikqvGU05tw8P8DsxFYKYxh8K+BQHFfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746685592; c=relaxed/simple;
	bh=RDPgm5xhma7QFLB18+5pqsvzgjikpNdaONSF0MiESTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwiJ+Vb2KfWCBdzOC4Zr6S7qCHsrRN5TV6sFMwIfOTRQIyJNymnTn7sJXwXAYtqAD9XYqAtB/A6W/5AzQfr2AtKxMjie9vXWkMmrxhv0O731u23fAFY8E1t5ibXOaG3o5KVk1Ai5gIJLemgGELQiVZx8dim9ybqPYiQKvWjoQEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnS3IeSp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnS3IeSp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so12337425e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746685589; x=1747290389; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrj9ukkKygc1G8rKTTqLX2onZSR0aOFlnCDnYrntq9Q=;
        b=fnS3IeSprMBvRYeEMrUA2d8rKUtOZPD13FDaKWxGfIhU0WsZJvvVdKDKQMf5+7e1t5
         v206AGlMvxUm1T6Bq4Hf1SxlVefN01MJn3cmlFpGswzHy4PsPxeTo3UXlQUARs56Q3nb
         OkA223MdQu1harumoYixuEKA/lywl0gWJ6fn8JfhBiZTRmMrqMMy8mRBflCnZeuIP8rs
         noPQ0JBL0wTO7hbvdVyDo+VfAVwkxwA0/+2O5V2oiD1zIyQ1nDZo/uv0FYhwpnFLBxKE
         87M4bZgooqdYCK4kK1L17GSuoucVq7LSHeeV5KZq7oFG2xCaKeT/4qHtXKLIn54QOxr2
         CApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746685589; x=1747290389;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrj9ukkKygc1G8rKTTqLX2onZSR0aOFlnCDnYrntq9Q=;
        b=f5BE92HoaLsiPkTdUDDAgM0hxPGeehIFbabgPbKW5ukv2tM82IGHfc+mOV5R2FfP4Y
         Rxmu8GOsgVCjOgJH30qIm97EBoUPknQ5l2bSpCIQaPfqgL6UCwJNhbprthc6HJL5S7XB
         /I6hTPwoo6oHoVQ7s+YkPORtI/ynmtNpiYulmzj35WoitLlZWRYJnrv/2FSW56vCbJtH
         5YqcFOqtWS0r9oIQIim9hNCmzUlT9QFGMedaCGbTWBixvZzwqn1nfjoRDFoGO5UdUoVP
         FsnSHm03c9eheCkWVbb6N9B/IDKr6KvBsNCb2+Mx0k5bzYTBUopHzF2i0yX9hvWD5xjW
         R7pw==
X-Forwarded-Encrypted: i=1; AJvYcCXV510WOAvcnjWPInz8GUHL9AEL7vcLsAwZOQn+KrCPkYfvjd7R/E7byEKm6vOrsJ/Q2U4+Sk+s8k51lawBB3k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzrbfvkYsAi0Vk+Epl2uDMj/YlHgahDOGJYZ01RRcS91LOir0
	Nv/LNjo5/Ma72VBzXRnqdRSw/CoeHUlW4/Bo1903g238b607SXidmiAqFOjhi2o=
X-Gm-Gg: ASbGnctqr3tSXrhoAlpFh6WF+I1wtQJgkeP2HY1Z0SIs+MP3YAYSnsaB9cB1x1sE404
	ZFDrgXGogHqZgx8u2XM8V04vCAFJ+WTeA0H0SltEj2PvXTKIoIELISg7KmMo6mBb52PYVUllMsU
	md3p+OijFQGdq3VZTRi4DUUmGP2BnWwuWOWDY6UO4jXt1hB9eUakJ+HlmurDTcsQUroRCJuhu7D
	cqmbRkXnibJsN1NxZ0a3d4ZGArnGdtzUC6p7IGW2xHp+n4mZh7LXQJeWI+J7Q7verbsNH1lRI0h
	lEkRxvUF2C+wmhTERI0m9y1bKKMFDFpdTn1fWjdBoAIHTQ==
X-Google-Smtp-Source: AGHT+IFAMx7JUFXY3xA7TDuVFEdfH0Qfm/mO3IujmuFv9MragYBfI8mgTfu7zRm8OHQ8pIMC9sOyhA==
X-Received: by 2002:a5d:64ed:0:b0:3a0:b138:4810 with SMTP id ffacd0b85a97d-3a0b99171ecmr1632328f8f.17.1746685588890;
        Wed, 07 May 2025 23:26:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b178absm19380008f8f.97.2025.05.07.23.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:26:28 -0700 (PDT)
Date: Thu, 8 May 2025 09:26:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent M Coquerel <laurent.m.coquerel@intel.com>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	George Abraham P <george.abraham.p@intel.com>,
	Suman Kumar Chakraborty <suman.kumar.chakraborty@intel.com>,
	Karthikeyan Gopal <karthikeyan.gopal@intel.com>,
	qat-linux@intel.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] crypto: qat/qat_6xxx - Fix NULL vs IS_ERR() check in
 adf_probe()
Message-ID: <aBxOkY99jQF7q-7M@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pcim_iomap_region() returns error pointers.  It doesn't return NULL
pointers.  Update the check to match.

Fixes: 17fd7514ae68 ("crypto: qat - add qat_6xxx driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/crypto/intel/qat/qat_6xxx/adf_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_6xxx/adf_drv.c b/drivers/crypto/intel/qat/qat_6xxx/adf_drv.c
index 2531c337e0dd..132e26501621 100644
--- a/drivers/crypto/intel/qat/qat_6xxx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_6xxx/adf_drv.c
@@ -156,8 +156,8 @@ static int adf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 		/* Map 64-bit PCIe BAR */
 		bar->virt_addr = pcim_iomap_region(pdev, bar_map[i], pci_name(pdev));
-		if (!bar->virt_addr) {
-			ret = -ENOMEM;
+		if (IS_ERR(bar->virt_addr)) {
+			ret = PTR_ERR(bar->virt_addr);
 			return dev_err_probe(dev, ret, "Failed to ioremap PCI region.\n");
 		}
 	}
-- 
2.47.2

