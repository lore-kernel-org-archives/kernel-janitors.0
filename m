Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BAB1F09BF
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189048; cv=none; b=LwEKe0fgZpzMCVvcYIgMY8H8QTKaFSLsyJ8El592HbUSPjQ5835uXgjsWr4FI6UryIkTlv4RDnIZOLjp78sgXbDOhjqji5ANIysl0OQC7rA3wO6+y87OqnvVigi/+K6THIWE2TUTOcSQKOouSW7ox3xynO3dWE7cWik1DC+qzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189048; c=relaxed/simple;
	bh=E11JmRyH7JUTZes1+yw1WAAGyPZ3TxFZUkiSIuE1MFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JVxQ78hU3AHcWf6488CO7XXhGV/MFR+BeUXpSCX9ZxhjrDzwnMlMoRH2KByXsxwsxkQ+95e2Ko3lPdFUwIhfnl4QqTK2Sj2Ou3+zUGn6NtdDr1N+Sto5JU3D/NGOWY2HArTL7Nqh09sPI1YcUsFwfTfg496UUDeaHoTkkVfk3Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m2jk1CNL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m2jk1CNL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3e98c5adbbeso456311f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189045; x=1758793845; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/T2Fr2QIkCHSSj1+Ut/Hdbp7X7o/yIWkxiXRdzpcpk=;
        b=m2jk1CNL7QnqDVcFP0J3CkbRBO0VtJeqhAwO4JAfVIt4iWrNh6RdWqPVaIVCc9Uoec
         gXofYCONp2hyw4qbguwkELRdpTWR4sHKo9A2qRWL8cfPwqh3u7/yN+c0OQDabbePITqo
         iY7yR9ab7vk2K6ohOdtaafOpsdlbll7CX2jgELowQrYyojISRFG9Gzsw1wpydCJKyoah
         bs98BYTjb2RGB3kC7hZI2Q5wgvUxcMkXuDeqNsFYX5mkUWT2Xh19V+zsC4rqk8RaGRux
         f4McG3R/QIgR/R3snkGkJAPjHsF/ZQ8LWbregbZ+rJP1Tbuk01dWcLh0GZi9W/rd7EUt
         A1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189045; x=1758793845;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/T2Fr2QIkCHSSj1+Ut/Hdbp7X7o/yIWkxiXRdzpcpk=;
        b=wx9R0pbnHVUkpkPqYHhtvYI2lfo6mTAeWhksIUGaX+banpjm/QvP2LS++jCmGsKFbo
         yyfZR+ize9h0fNLE2S4QaxxYajgqFXr2kfNJzVDPJEEWJoZCGrGn6GiStmt3w8jvynGa
         NL8sJbCNLRZWc/IFFm2VGzQ5NWOmezhxKF/AZxyuaz1IHO3hsAJuQ6slSP3pspyBT7l5
         7/lkgRwyPTugEgb3gEdda/MeAEGU7jQSQ1aM911UVG/0anfs5tSgGmNNx/a1E/b8p9RC
         0HQYiz0KZ8tPI9mojlkYbBc/VXUiD3MbwNll8GMm7vEYKdLd2azyFqcF3TfS28stbAku
         UICg==
X-Forwarded-Encrypted: i=1; AJvYcCWuM3PcJFGrVcvbzLiwI3441P/6nuB3zjOXoDC9O76YwZUHPiMN8en3GErt4mGKCyBvA16zwzQZvOQOaHlb/wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLGpMLKqoGeWiyQOL0anZIvCDngb56VlEnks9Y0wxVlRhxvKKw
	3pZ3Il+gE1ctRliAlbRk85X5SqcLtLXPq/MyCb1cyshGenuSDCZhv4m53lPtHBxnQGUHZrXXjGz
	8xa00
X-Gm-Gg: ASbGncsdfGG3g1hSkobsK2yfsA5cxJqZu4U1VvPY3GTjLgUR0XJ/qYPJsYnMdv0V5Ow
	29OKDrz6VI7Wqx+lu0vyfNo8V/95zsjISX+jsrOIEfjMRATj/HsvjHoXClWBAihkLAXpMQ/vpO8
	pMLF/jwfqw833+mDQiwuNMBsL16DQU8cJ6fxT+2xSsBHCgrWx5miXFG1P2MXzf5Dr7OTVpkWyXw
	0u0gr5Zsx6nF8AOPOmVKiCPy4bOWyjcflKkPVmdKCuGbbraQaA7PCNF8DYNGf+HgC4bR7A9iZ8Z
	gsVWnKG735rHDH5FM6OfoQd0RiiJv29M/tKWwfzuTTzQqEWNHZR2bAcwG/r5U4jnoKMo2zbhNIk
	6IHNDqgnakY73AFchdlzqEks3mOktefc738TZmT+KGv+buA==
X-Google-Smtp-Source: AGHT+IF/P3JGmGE10PIfdHqwzm4/ifWKYQ/MXC5mVGrGtyVgrjAOWjLFRwF4sj8gaNTy6XhjFE43Bw==
X-Received: by 2002:a05:6000:144c:b0:3ee:1233:4673 with SMTP id ffacd0b85a97d-3ee12334885mr1189394f8f.16.1758189044856;
        Thu, 18 Sep 2025 02:50:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f5a286edsm37363195e9.16.2025.09.18.02.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:50:44 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:50:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] tee: qcom: return -EFAULT instead of -EINVAL if
 copy_from_user() fails
Message-ID: <aMvV8WIKnqLN3w6R@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If copy_from_user() fails, the correct error code is -EFAULT, not
-EINVAL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tee/qcomtee/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
index 783acc59cfa9..b6715ada7700 100644
--- a/drivers/tee/qcomtee/core.c
+++ b/drivers/tee/qcomtee/core.c
@@ -424,7 +424,7 @@ static int qcomtee_prepare_msg(struct qcomtee_object_invoke_ctx *oic,
 		if (!(u[i].flags & QCOMTEE_ARG_FLAGS_UADDR))
 			memcpy(msgptr, u[i].b.addr, u[i].b.size);
 		else if (copy_from_user(msgptr, u[i].b.uaddr, u[i].b.size))
-			return -EINVAL;
+			return -EFAULT;
 
 		offset += qcomtee_msg_offset_align(u[i].b.size);
 		ib++;
-- 
2.51.0

