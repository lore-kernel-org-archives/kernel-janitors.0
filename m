Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2542D2FA
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y5s5ywDX"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C358E
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:19 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5079f9675c6so6340459e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698656598; x=1699261398; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cYFH7qp0u3X29NywKpoP1IyU1hw7BcleLqoH2m7DO8E=;
        b=Y5s5ywDXY17VpFmQLqcxMF3nB2z0rMzmYfP61fi9xZqPM2poxvivPWkEGbdfT8qR3h
         JgUeHN1Koj1fs/uyS+tYRsUoAyLWpXZ1W6M2OkWT5BjtlxyqJX6LC6nnPfwK7RR5bo3x
         s6ah5I67xUjpxGfPavGHnylO7DKrFVQycjJSS8ijGA6848Hq6aBUhV8yp3MqWa55c01R
         NQ66FgQT6cTF66Hrkrdy1l8zlNc3YP+/fS1P78wnLJXCgLy5SoOr0KwEOa45sUO+t+NQ
         jcViTW1Y80XgqedkL9jrJCaSt7x/V9rliuF02PXcUgJ8knWgjsfIM4qEwYyAkbQtcOPy
         rFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656598; x=1699261398;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYFH7qp0u3X29NywKpoP1IyU1hw7BcleLqoH2m7DO8E=;
        b=CEToU+Y4RTBjaPhvE5qy21RDUtEnpQA/Siwkx7sLfJQWwWPPamIEP7N/8qcRSyShvy
         4FkSxUgEiV8K2CNyYcEj0N+g+X5UqLb2Ju6fPx0rUxN38sIBK3rQmGaTp+a4QjdjC0lk
         lnyaY0jxbX7UPAdt15hifC0zIFYJnTDQZ1n5RZf2lugX5f2SeXJsL0XtTxZbrhiE2DJM
         r825/znynMtaJgSkP6rg4QVlGfq2nzGv69hI+8pNg6UIPkSabazrbe06JvHKZE/a96DN
         yQdAO3O7ja/zMAIoy6tv2nAHZlhSDNxnDvCjYsIBkv+PmbcIYHSbCWPdVZ5hDLT3+7Gl
         iLBA==
X-Gm-Message-State: AOJu0YwZtjChd9OjOB7TtlHBBFwZ203fME0Ls9Zsoqxmysz0Q4vZrk15
	gopNYLDso2h16Pqw7ox+ZA15WHgtrjRu8NjT/bA=
X-Google-Smtp-Source: AGHT+IEhqt5JyMuDyehB8tfDt0aSGJIzli2DgC7Bp6/VFUQmD21VwzJ1TqPJN1de7TiMAV9dumwFyA==
X-Received: by 2002:a05:6512:6d1:b0:507:c7ae:32cc with SMTP id u17-20020a05651206d100b00507c7ae32ccmr8087977lff.41.1698656597789;
        Mon, 30 Oct 2023 02:03:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s10-20020a05600c45ca00b0040772138bb7sm12176139wmo.2.2023.10.30.02.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:03:17 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:03:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/dart: Fix return code in
 apple_dart_domain_alloc_paging()
Message-ID: <b85e0715-3224-4f45-ad6b-ebb9f08c015d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The apple_dart_domain_alloc_paging() function is supposed to return NULL
on error.  Returning an error pointer will lead to an Oops in
__iommu_domain_alloc().

Fixes: 482feb5c6492 ("iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iommu/apple-dart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index ee05f4824bfa..cb38a7a826dc 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -761,7 +761,7 @@ static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
 		ret = apple_dart_finalize_domain(dart_domain, cfg);
 		if (ret) {
 			kfree(dart_domain);
-			return ERR_PTR(ret);
+			return NULL;
 		}
 	}
 	return &dart_domain->domain;
-- 
2.42.0

