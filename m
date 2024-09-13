Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2610A0D
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726238118; cv=none; b=TgX2AVKDais0K1B08FfzQdayP2FnuQuAaNKw9TNIF6s2/PJXIsUDxTp2XBeYCJbY0dbgg4qHkrPADOklA1yM6WzOvMsOXLRN4oveN6cmOZwvB46iyd/+tR4PqgyjaWEJG+1yWbqWVILGuyBOqZd+Yn8WDnYwu/33gqZo7cw/Jpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726238118; c=relaxed/simple;
	bh=fA4AWaAbXnOOYk1783H913R2EXn6N6behOyf1uOVEVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FXr7lzHwr0+RCb2/NVR1QqbYVlgk/0AyTEyrlxOlHRi6A7yVc1zt8+nyGhMZGAU6YUre9Pt3EXY09zw94FUs5b0sSfg1A0Sh4bO+flV8FdIar6d24jzj7I3H94b1DgBqRqdLAxzYL/kr3xuJcbc2U+kJTv1Ngg9YWCqosxwUTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fvxhms9T; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fvxhms9T"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d100e9ce0so257895266b.2
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726238116; x=1726842916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QPpJqdDj9nMsP3j5hQglMwhS09myjVI2wZ8NOXrgLTQ=;
        b=fvxhms9TCHrIhpMaGXRfjvMxAwdEAgXaCcqOlka2DKTPH6DRj6PDbKj+y1VJsCUTv5
         /duKxZQDo4iHGMCVBtVwT9oOXz8O5h+UqPEmCoBArVwjX/J/Yj4ciYh7fsXjZTQA1Xe/
         vmmo0KE+Ikds1/C9Pk6gXzNPA2mSKciwH6siGIz62auvtngWB6rIZuXPuE/Ns6KCAzUh
         qsBTpgdDvRr1aAL7gZutUfLEOoQyV5Am0bHQMWXHNUk3X6RwDRg/m4kysm9vjWUksM/r
         M/kUq8JIMheUT316lW226UP7CuMTpYTn0rBGGmN5vHsidv51/qHDP5+95sVFD0xX3yDJ
         ghqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238116; x=1726842916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPpJqdDj9nMsP3j5hQglMwhS09myjVI2wZ8NOXrgLTQ=;
        b=VxV1obiDTTt0s+QQnO2DgSI4sa8LXQ3M2fV4YS6duTLirFQeAD7fpX7JqQcRCLOI2m
         PxdCaH2DXDXz4+lYkBjJuDQJE3eCF1rPQTIs3GCSmqhnbUS91x4FINEpKxjftZaRnuZH
         zJqr9Oi/+/RZQgboszFJG87XZpmm5qKELpJ/2Rzj+SWRwxxbPZTrQyQx1PMQz7DMOLEu
         Lo6C5L0twF/lsQOnBuyTa2zUBr4H6MoEek76EFsWXnZ/z2pUk5wCUhFdY19dR4aHOh+u
         BBa22qv1ous4vz+H9fq9+BEMcA/4b90VgYbjSAwoWBgBQTuqoGy7I8cgp2crEW4+S75o
         LCvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgz1FIC94VA7h9/WemdWgbwdB0qzIxnPdhdCBlvNi1B4HZK5YzRnX+LkA8KxQmBjLh1UE/cd1GbzFl4kxhJ5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKckKLnYjqSeJ01HWpLdmtWjTW55tL0uo0HOUzSaTunkFpxC37
	f/KIhkVjhjQmh/eqbZgxf6iABevnYVlaeyVAibHl9dZALY4j1UfEhU/EnhtW7wg=
X-Google-Smtp-Source: AGHT+IE7zfPqYBpqVTOIdWqsFzLTQ9zGoS19bNShZp/HujGmJgWJRxZEfBbSVizhrSTnrvtHw8zm3A==
X-Received: by 2002:a17:907:f75b:b0:a8d:4d76:a75e with SMTP id a640c23a62f3a-a90294d0958mr616258366b.30.1726238115474;
        Fri, 13 Sep 2024 07:35:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ceed73sm882316566b.174.2024.09.13.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 07:35:15 -0700 (PDT)
Date: Fri, 13 Sep 2024 17:35:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] dmaengine: ep93xx: Fix a NULL vs IS_ERR() check in
 probe()
Message-ID: <459a965f-f49c-45b1-8362-5ac27b56f5ff@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was intended to be an IS_ERR() check, not a NULL check.  The
ep93xx_dma_of_probe() function doesn't return NULL pointers.

Fixes: 4e8ad5ed845b ("dmaengine: cirrus: Convert to DT for Cirrus EP93xx")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dma/ep93xx_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ep93xx_dma.c b/drivers/dma/ep93xx_dma.c
index d084bd123c1c..ca86b2b5a913 100644
--- a/drivers/dma/ep93xx_dma.c
+++ b/drivers/dma/ep93xx_dma.c
@@ -1504,7 +1504,7 @@ static int ep93xx_dma_probe(struct platform_device *pdev)
 	int ret;
 
 	edma = ep93xx_dma_of_probe(pdev);
-	if (!edma)
+	if (IS_ERR(edma))
 		return PTR_ERR(edma);
 
 	dma_dev = &edma->dma_dev;
-- 
2.45.2

