Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD01EB36
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Jul 2024 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720106710; cv=none; b=UFDveFeA1cSRBS0igat3VqblrVpI3VkAlq1ubwjiLCbcfC4t0jW39C6nmddVjYymT2eF83hRnHR/VK3RH1+g1lHk7HmEbWaR3y0uszQ3LZgyvCTSXusfvzyCCspN76hayafkZdkGFr8aXbfYxMeujSCOORfKyS/4o2uusAarixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720106710; c=relaxed/simple;
	bh=L0fqthKwQoJ3/n3wTuxc8RAAQ0COsdCjZ1mWGK2Mepw=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=mAijtUp3v3VVJoDbVupbkJi53YurHShWi7HJu326BCPCQUqz6malqEt1rKlfAmBZvRwyKJWwo7vTP0b0+hq959refQ18nkul1giS4fNUZk95Myu3nlxQwpVuZZDxj9U/D/s0sOgCpWrVRy+QofUqCsBihLuJDP7m48XzqNcLfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQaXHkA8; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQaXHkA8"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c21f3fbdd3so373050eaf.2
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Jul 2024 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720106708; x=1720711508; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7sFNJOnSmqtqKvPXuuEH/9m0mTzrSrkSfu1bDrkU8IU=;
        b=nQaXHkA8W9mW8J8bVh4lksG8sNjdzmiE0L2KEJo99bUiZZKzomIc/HX7qTbqhalHn7
         pPZfstVNyW8ku2/qeOKT3QmrcHsN66waiAU0uLUFyx+518GLENllFuka0H/NfFhNmZEc
         4JJQQfr5FowIEftD4L2O4QCImkjNR2bi6sir9jtUZ79Cr+wCpJQuLCP4pbCVMEmKFxkF
         BmoO1gUDIrHJlcRbYsYShprA+OjuWmQnjGgJqVOpLGpgwo2IisSOvEFz0cY+UITsIFHH
         jjzvo7ouyPBezol5S4XEVWKNh6jpFwlMxuordhp6ld+guvBIJJlQDbUgIoMkyN3Zd05S
         0OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720106708; x=1720711508;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7sFNJOnSmqtqKvPXuuEH/9m0mTzrSrkSfu1bDrkU8IU=;
        b=ghH458JPiONVo8pghktmSMlDh7OLuxjC3hzVF5PfL7USbdzZEFBhJblxl34ZfxwHL+
         m+GgR+NdSssDG+NGrUu8jsAl08pEpLYFsJW7z/12jfkT1H7MVVzYw25A9SUmitZl0byz
         8ofl6CgNXiXVfBwAuUSyDFswtgL/Lecg9M2X27D/ySV151+1WPf93+m69mjyvE3/dIZv
         g/H0zRvpW2F9NKHwqmMxmiy/e/3aQ/Fes4Ka41GQFQ9vbA64ZsB2Emn7DEhf4p+3qXfR
         OlvO1+jOKU0szRAoC4Ime+Y/cIuhtLueVsid8T1RWN3v9wT+tEof8iOp6IAC4CUYbCjw
         9VUw==
X-Forwarded-Encrypted: i=1; AJvYcCXGVlUplCkeVsHBp+MDN5nVhyfWpI9+MCIK86JRKBWPi5LPTtY7vUZ4TvuOQvE3OjAnRGGNR/BJBDpcrpGAQV4n+VxM1oqBqj53Q623I8cK
X-Gm-Message-State: AOJu0YyH28iVwSjql5GeLcy8l+AUF3oOrM9Cjrqya7fOpNAtp0lJfZzi
	G1U6x0XpSjS91XFku2wnrQflj5JNKZQuoe5+bISrPWPIKW4U3hnDspRRoump70A=
X-Google-Smtp-Source: AGHT+IFsO54HvV2syeU4YZ26SXAOrzkSz/Z2cJBBPKHT1L0d/gQhuA22lcmvQepFViKBwkpZQsYdug==
X-Received: by 2002:a4a:4b43:0:b0:5c2:1bdc:669c with SMTP id 006d021491bc7-5c646f7105dmr2315521eaf.6.1720106708143;
        Thu, 04 Jul 2024 08:25:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:96a0:e6e9:112e:f4c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c44bba4eddsm1148760eaf.32.2024.07.04.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 08:25:07 -0700 (PDT)
Message-ID: <6686bed3.4a0a0220.6aa45.6c34@mx.google.com>
X-Google-Original-Message-ID: <@stanley.mountain>
Date: Thu, 4 Jul 2024 10:25:05 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Mimi Zohar <zohar@linux.ibm.com>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] crypto: lib/mpi: delete unnecessary condition
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We checked that "nlimbs" is non-zero in the outside if statement so delete
the duplicate check here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/crypto/mpi/mpi-bit.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/mpi/mpi-bit.c b/lib/crypto/mpi/mpi-bit.c
index 070ba784c9f1..e08fc202ea5c 100644
--- a/lib/crypto/mpi/mpi-bit.c
+++ b/lib/crypto/mpi/mpi-bit.c
@@ -212,12 +212,10 @@ void mpi_rshift(MPI x, MPI a, unsigned int n)
 			return;
 		}
 
-		if (nlimbs) {
-			for (i = 0; i < x->nlimbs - nlimbs; i++)
-				x->d[i] = x->d[i+nlimbs];
-			x->d[i] = 0;
-			x->nlimbs -= nlimbs;
-		}
+		for (i = 0; i < x->nlimbs - nlimbs; i++)
+			x->d[i] = x->d[i+nlimbs];
+		x->d[i] = 0;
+		x->nlimbs -= nlimbs;
 
 		if (x->nlimbs && nbits)
 			mpihelp_rshift(x->d, x->d, x->nlimbs, nbits);
-- 
2.43.0

