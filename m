Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123C302CDF
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758723686; cv=none; b=FDzamIfl5PrEgHPIivWw7M4vOcoZCasbcafLvM4lgyfLf+15eLgNYElhgKpt7dODr8PODY+pARiRXf18PkNM/UxSPn8df//bUPi80I0GZcpcboR3ozA5riEl8tDLmAS/1ZXE+/tXUTEozwH229RhmZ8RIssV81fqbhsbpvqlLAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758723686; c=relaxed/simple;
	bh=8Bd9BNziqvvbY4+frkt1YLGnyHQ7qyi67mb9YIWosgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ufXGyzVMwHkC/IFUmXL+jtcWbGSvn8psyf5zv9bN1F2UHQ3/tCn6ynfh3fXHxqr+IF2HgWnifC+MYNcnjkBj0/pQdB2X6QUPRr8LvQX6bC1R8VyMKbiVbkSEsvW7B3mVWDgimsOC/Zg9SH2niUDK8lnaGfyTQ9YvT6okq8Mb3iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rk+uV1zo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rk+uV1zo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso48550555e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Sep 2025 07:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758723682; x=1759328482; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUOwXMuTBpB5Fy7yoIxpDSUv9vUppjY8hnmiw8isNgs=;
        b=Rk+uV1zoCA9XTCXfPx3u63Nx+n5BmWFBDhdWMb2om6n6KkGt1VN8ZBoHTgaXGsMCGc
         L4JXBhHdtdqIPAXFjGOfmX8MCSw1uP/tQP0THTV9omNr29EIcnF2Dmeu7vHy+a79K8xy
         MRv9peIRpgTGXf1UC6txpfJnQ4tCHDdbzQdDDz3KGevQyGY4U7OB5BDVY5oohTEasyeQ
         PQvhDhkOtCDOzCe+usuEVcfHygWUC+0xfSQ1jMWsJ0xN9xKN1l6DMMr5GREdAhCVvWy6
         zFBb5t4CIUxGx1W7nS6dwy+YeAmDLVyz6yVrtD4EdlJX+Njdxfh1yA0m/L2wpIQOv1UY
         +oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758723682; x=1759328482;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUOwXMuTBpB5Fy7yoIxpDSUv9vUppjY8hnmiw8isNgs=;
        b=jpBv8cZZoaALSr7VmZFR7LQjHsWjr0YRNMqIKpB6jRN4MlsV+1kmVViYFAqH48klx6
         l/kOiiF9RDZr0k4qYCbKVyuLyoCebZl1tlOJk7aDe8HHuoGwSqWa9TvrzdZk22DgkMlk
         rOxHb6BOcu0lOAjHIKIQ5GPx8MvtgGUkMx8b6/CI3r44tGnQXm0FQZA1tXXGLESxntc8
         JZ8RsynDQMF+oPrrbiepMRfKSlBM+iZAOdiTch35Kh8icLk6uSKWWiEOVSwMb8X3gBMO
         65posXWP4R8ELyzOgmBDfUy5Lxi0t9MJ69ZnMGcQUXpg6agCSjcdSUxah6JBznjYvyv5
         RM6A==
X-Forwarded-Encrypted: i=1; AJvYcCVmtxtg2XOXtekmS82QmxmyYJghY6SDiGgKpOOiI54yXf/quRij2nAqIzHbAFH3pNwwJsr12mm/MXGUXN8DchU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4P8jq5zEDKl+B214PZBNme3v7G/zJoebq0kpuny5W9P5wzjvC
	9vC8WXBXg44rq+k8vSJwKPFu4YQX66+pfV8HnBFRQ+HNxWPYaYkWsln9GO2O/oxMBZk=
X-Gm-Gg: ASbGncszn31oPSxmqGhkoRjQlU58tNKq87LfbHznXiSr5WJpz3pWLml5oAjadUEox57
	GveININkQ8B2nTvLx/WNwvZknlsnXX3qeheL8KZVa9hZoFK/RcFKxvPaE7QDBLgOUU46AVjYCGm
	vP1LcQxLH3f8kV1dAo7KvcP34ZhnIAFszENBDTdkMsk10saBj74h38UD9kF/qEsU74owB6KPg2O
	VKn+9xIC/dgthcXsy+MjRap/ikKqaRoNQhhzEbGkjhtmq72CcDKB/9fyu9Pilbcvz+CBqO7ESPo
	7VXUIWezUks9PAvhsL3rHLoLigu3zGPYJgg9PEwT1QAOFZ2e4yteEBKaA6djZS1Lc050McVpw1y
	kYuvgrrSCtpDVIhfwZXgZk1kexZJA
X-Google-Smtp-Source: AGHT+IG55pmdfKl6TOSmeMM1pq2EjePpFbf+bYc0kIwlIBb4cj5o/va5cZMOtuDRcr/jCbXXpn9noA==
X-Received: by 2002:a05:600c:19d0:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46e3292ea3emr1209375e9.0.1758723682187;
        Wed, 24 Sep 2025 07:21:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2ab31f1dsm33992125e9.13.2025.09.24.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:21:21 -0700 (PDT)
Date: Wed, 24 Sep 2025 17:21:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Julian Ruess <julianr@linux.ibm.com>
Cc: Alexandra Winter <wintera@linux.ibm.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] dibs: Check correct variable in dibs_init()
Message-ID: <aNP-XcrjSUjZAu4a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a typo in this code.  It should check "dibs_class" instead of
"&dibs_class".  Remove the &.

Fixes: 804737349813 ("dibs: Create class dibs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/dibs/dibs_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dibs/dibs_main.c b/drivers/dibs/dibs_main.c
index 5425238d5a42..0374f8350ff7 100644
--- a/drivers/dibs/dibs_main.c
+++ b/drivers/dibs/dibs_main.c
@@ -258,8 +258,8 @@ static int __init dibs_init(void)
 	max_client = 0;
 
 	dibs_class = class_create("dibs");
-	if (IS_ERR(&dibs_class))
-		return PTR_ERR(&dibs_class);
+	if (IS_ERR(dibs_class))
+		return PTR_ERR(dibs_class);
 
 	rc = dibs_loopback_init();
 	if (rc)
-- 
2.51.0

