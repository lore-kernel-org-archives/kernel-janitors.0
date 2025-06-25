Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512892D877F
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864993; cv=none; b=NoETtHVLbSI38UDALYgZeeqlyTHBAkM0dwyS0iaKkjEIMFKmMNa7Yi+BiXcY1ehcb76qbiiFPHyrcPyGsmmqwrD57VUuF/TIdzgJbljkwxGEWehJbY2St5mtnxljfULHnNM7dQ0K84td/QoloO1ECWnh+LOpgWc1PVcUae59SEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864993; c=relaxed/simple;
	bh=5O2/4BpQHfklLSAAZ+OUfTKYve/rhKype+tQDUVh+no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RO722doFwVmSv8VwZWB7qmtvmguXwGi6etYqYQZXo7sh3bLO5rjAhNz8Sc5Wmk3N35ymNGwzS0hKF+8ap/1BB120jLE+gCM93MrSntDlGWcx/3kJFfMiydNA8sesC3Y/ZO2mleCIoeh148gNCSK0j/z4RicG8CZmfhHsWTxHI+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gopCmP7l; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gopCmP7l"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73a44512c8aso555030a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864991; x=1751469791; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=gopCmP7lQbciQsrEixvDxNRXOALsnIT2oVDTnaldRPWO/cvurg1e/doGdO7JkVk7KR
         9jIjSCbJ0WB4/3BAUlvJEfn6zG3pUqleX6fI9HAhWAzCoOR65VzVdoEnouPG7dF24owP
         afVOis9bpICpAWOapd8oBx/bESglX1ysYX1BG1yOTdInAA3LtP7wjvEsIjeL/3OXe9oP
         nbaPNT2ikwFK9XDxnuR28wt6FCLtIVbXSPcDRF9mofL2UwHJ1KLj8gdyGjA4RMEvaw3n
         cGrw6hElsP4LSXm1tGHEjhg0uiEwKjvnIdaTmpcar24CR0ya0kIvBLXxDjLjYw0pQTNC
         gHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864991; x=1751469791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RscgyY7zr0J0heuodisQOvqSQWiux2P+I5t0Y0pHfw4=;
        b=WSF3jbEfFr8fXfW1Oc5yh7t+aYgusWei2TexHFjv8YehIFgapF9h3+PU12bGUeqqmF
         C18PZGBBeq6Vh+++sA5i4zaelJWQL5GX6Ly8OET8pQg22dEjihyGW9HtXNdJGfpbtKu/
         Sgvza1uB6SwvngZOSRjjnl4l0wUmpV2BTcdconJt5AVoAxilWvTSJpMtaZKXSV65EiCh
         N4occH1AyUxdX0GblSuZfk7cQI51Su92jRwcvaSepFhsMQAfdXkRe9r9GupgAt60tafv
         7t8PXSJC/3Pm0Vqb4KcXzqbH3IhapnWkm9Y6EGidWA2aX6khIE9JnNpjNryUTcadseeQ
         ocBg==
X-Forwarded-Encrypted: i=1; AJvYcCUJyXbVmKR6vMJ9V44gEmcqnIRev7w7DFjH0m8oHEF0+nABHqvGPLpPfgxzMZrqjmSWkiuYtDAoD7ai/BV225A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu6MKH+MmPvrSxFCljTj6AmfGNETm0T5SdY8IeOTAiTkde0Uwj
	YmgXeDaPSVrkMPEwrmv9TgeYquzU7Nd+/uEd5htVRyINkxjksRBKY5Wvs+whum9ajfw=
X-Gm-Gg: ASbGncsPq/1s3HN5HzYEOrtzeG+1Y+8fQM4iKJJYTAqliJ12sOxcDm1OEjvIEDmw0br
	YedbeipRbXmayM8V32A6UzsyOwN2QmN3TuxssbH0IXdd9/vxjuv8xpQRqY0wuT2AUqIBBGzGXI7
	ggHaIJDPJ9CDzEg7zSS6LpqlRXU4p5YVdsLG5o+/Fk8yA50KoMrlr8LtRZya5jWpzbX9P+DHMub
	YucXtLMnWJvTBps6llpBNetBpK8EM5H5aimezRv16hgkSI35XVmbsWkB7wQDVsdWoaR5cWljvvl
	cspLi58d8dPmpfMReLEovjDxCxiwe0nTt8znZGmUHm3Ja9+Fc6MHkaDfIKu7yadiJou/eA==
X-Google-Smtp-Source: AGHT+IFW4wlR0wlfzJlAh8x3qk2Cx37JojTQFFpNrPClMsltnG4YGIKmiULYONmufRuAqIk5456wBg==
X-Received: by 2002:a05:6830:2113:b0:731:cac7:364e with SMTP id 46e09a7af769-73adc811af9mr2506085a34.22.1750864991484;
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90ca9c12sm2237043a34.50.2025.06.25.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:11 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The iommu_paging_domain_alloc() function doesn't return NULL on error it
returns error pointers.  Update the check and then set ->empty_domain to
NULL because the rest of the driver assumes it can be NULL.

Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/media/rkvdec/rkvdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index d707088ec0dc..1b7f27e4d961 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -1162,8 +1162,10 @@ static int rkvdec_probe(struct platform_device *pdev)
 	if (iommu_get_domain_for_dev(&pdev->dev)) {
 		rkvdec->empty_domain = iommu_paging_domain_alloc(rkvdec->dev);
 
-		if (!rkvdec->empty_domain)
+		if (IS_ERR(rkvdec->empty_domain)) {
+			rkvdec->empty_domain = NULL;
 			dev_warn(rkvdec->dev, "cannot alloc new empty domain\n");
+		}
 	}
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
-- 
2.47.2

