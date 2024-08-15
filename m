Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E501AC8A2
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721085; cv=none; b=MFMiaakS3S33mox89zp0F5/jUW9sNmT8Q+QGFjXoki8YR9CJhbslVaDeUG9pkRuQA1PgjzILZtuJ5F2bko1fm7XrAz26xiqfpkbL5WKdi5WBqtAorVSeWhxf0U0erN9QUj5h0DouS8DihkqBh5YKcpWGQQ9n2ivg7cKEI3GkkdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721085; c=relaxed/simple;
	bh=hK9x6dzRpGC8KUkGCpjPQhxBbwERUW/es9KBxYVU670=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGqm2nbkBILa1QKWjL5Q9NObUc+Cfkg85R5JmetfAZRD1lkZpHZEKHqHBKE5Od2CZbIWZKPpqmB2yDNDTV57Fe8PFbrV5dazizUNcq2EpdhW1TQ7c4t9/Rjr61FI+4F/yw10pLJL93E+ox70qBoIEkl1Qm0BoLuFrh2WtSW1o+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DOu4dnhl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DOu4dnhl"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f024f468bso938193e87.1
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723721081; x=1724325881; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GwOw2yZJcLkYGRSEzM30uACAh5jcGiNrXqca9PAg4GE=;
        b=DOu4dnhlT3BZlVlaSKn1nz9803EQDGtFuKsRgzrsaEuiBIW/rBLQERQKBonHnj9E6j
         UFHBTxJf5+W6Sv0C++RENrF9f/T8NPghIXiUywpCWoVV2NS917FORrZzmcq2pS5KBWLT
         N8+68l412t7zLBIPmQKw3izH2usF8//i/DAf2yyRN2hBnlDAa4zoC3xLpUYyIRGUOrWT
         OSl3tQl2CC/JErtlp7s24NsjxKy+jQQGEk54lb0qU3VNuFCUYx7qQqhCm8lpvDyNqd1h
         wqfjiiz5EyJDRhcHCxLWDzp84XOKSwvueKFczqUvAKVi2CZcGC2wfEIrB53cyYOI2Lxv
         E4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723721081; x=1724325881;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwOw2yZJcLkYGRSEzM30uACAh5jcGiNrXqca9PAg4GE=;
        b=Y9c39FwVtuLI/VENbWlW6t7rn+D4109BAart6oO/c7rM0gIOG8OnPyM4QxbQtRFkdi
         hcEZc0PLVEYq8o4G24AbLQPvHRONnzbT9q3JOFY0LZpuynnUZiJrR2TNXuXuEI7iVKRO
         Zt+xPCO9kTt+yEHbf/4lpnV2lhuCDQxydvhBsqqGSRXaSeyqkF238UtNEWWJC0tHX3ZA
         h/vs8VOUTO/sTjZnacxEFx0+b9wCt3ZLspZX6XOE7GbXCQPshVqnKbBd8pLlntS7vS69
         yd5JJO7IaXMwLMOs+rguyfCrHZhcTQyTuan1oZggWmINz1eLoUat7SpckC9S/+ht5VXk
         DDlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTkGmxwg3DZBew50fmFKf4sOJC/qyDzCZhiyN6GOu3iJfrwD8aIvWEsVphe2M6EgHUspb8AE+sTLByEulMoCKafjJHmDiEGmc78EgcbcLX
X-Gm-Message-State: AOJu0Yz5qgKoj3MW3xK08gS8o+WxGsjI1ST5dOoC7+erz7Icua5woH6G
	FdQhIuDaaeA3FJX0Qqbwx+F2X4QLVqi9szI5tMhq7U7zLjKwLRVXY/Frh9PcgjY=
X-Google-Smtp-Source: AGHT+IFnZ0lunFouQFuMLE7ezWjdZu72TNWMHe+GJtkHOdU5m2D8sEMH3Uv1CpSNRxgkEkrOrUQ8HA==
X-Received: by 2002:a05:6512:3c89:b0:52f:d15f:d46b with SMTP id 2adb3069b0e04-532eda7595cmr3980479e87.14.1723721080615;
        Thu, 15 Aug 2024 04:24:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf05dsm86767766b.53.2024.08.15.04.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:24:40 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:24:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Brian Masney <bmasney@redhat.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Can Guo <quic_cang@quicinc.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] scsi: ufs: ufshcd-pltfrm: Signedness bug in
 ufshcd_parse_clock_info()
Message-ID: <404a4727-89c6-410b-9ece-301fa399d4db@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "sz" variable needs to be a signed type for the error handling to
work as intended.  Fortunately, there is some sanity checking on "sz" on
the next line, so negative values would be caught and it doesn't really
affect runtime.

Fixes: eab0dce11dd9 ("scsi: ufs: ufshcd-pltfrm: Use of_property_count_u32_elems() to get property length")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index 0c9b303ccfa0..1f4f30d6cb42 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -31,7 +31,7 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 	const char *name;
 	u32 *clkfreq = NULL;
 	struct ufs_clk_info *clki;
-	size_t sz = 0;
+	ssize_t sz = 0;
 
 	if (!np)
 		goto out;
-- 
2.43.0

