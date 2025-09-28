Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E628DB52
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759092747; cv=none; b=eczBXAZf6sTbb20mWycN3Nzn27ZTV8o/+VMG3LvZCdDspAau6w/6EanFPSw/TTKiyHHzA0AQJOVKjk6I1cd3TYSFbRUnbyshU5Vj3hwSeo4KCLZgLuu0g072NnvKWIMQNekJrdGsu+hRmc5+CMW47XzKg/WCo5JPB426nvSR5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759092747; c=relaxed/simple;
	bh=e98vTeFyaAgWFgxnGmLXanTnqZtnyqXFYo7jrzYxNBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=THFnLQtx8Yx/ZGe0ci3Jb6VXcDRhibMhV2sdud3/StSE1Q6GsDRmMIASllJ6FQUMTPigZvY1Ohsi34FahU3dJ5+YgXFTO7gkD2yaCrTg2Ich45/NHNidqevzxcgD4es6T9mDtj3NT5dxmSOoftTMeG5nilNwwh3bmOpU3433ieY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTTVeIaP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTTVeIaP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-414f48bd5a7so2207982f8f.2
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Sep 2025 13:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759092744; x=1759697544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdcg8roz8JsIpFhZQKZgK4s/UlvBbPmXf0POSYEmKPg=;
        b=aTTVeIaP06ACnPHLGePRRl6NFZ5RmNTdN27dxQIecWcoqqOYlBGKGWVpscv6wu4EbM
         RN6itPnRBaW3xhNO75X4PKtwCk50PynQAQP851qZMGUn6/H1EY7yIb4rAy9Pr67upGH6
         9n2/FDIvMPOBlfMYWUNB9A4pcgRUR+a5WnQtdeB4BTxnCiyH0O02qHmNk02mty2dsPpL
         VKlh3kDUgvYKOBGjEGb4Z1EtNOA8ak5Peu8L8s/TWuiAdl193G9DsDvwV1Be4oeQqBUu
         kiCLvndp5yoPCAveOtwM362p1sWsmGK+0lpkdmhYDlcs9WK99HIXmdZHl1exQzU8aeBT
         s9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759092744; x=1759697544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdcg8roz8JsIpFhZQKZgK4s/UlvBbPmXf0POSYEmKPg=;
        b=e8DXdQB5DwBfekVSiKyN5zUuDW3yta83uS66kErza7GVGOh7QleRryK9gCCmEJD9DG
         YMelp8zL0IrdKmzFqzWkj4Mhdgkgfjt0naZoJJvh14p1IkjVmSAV8zGNr9PXc/LIEBVF
         Xn1QjMX80b7zLiB6MGIsdiri/4E7W7nCUpjEbFOvuuuCYWkNBnFRQQopFW/yolxL+gHE
         4EQByS7XVqgz6GiUjd/Bc/LZBDfFT9XU1/J3fQi/C6iQSve3rVMpNIahoAy8+Ble7QpS
         vWzKBim3TUYoetjPUnMNehnpu4dCQKDt37QkuliXe9bIpgumBDE5EcuBONaI+sLYpCh9
         +Q1Q==
X-Gm-Message-State: AOJu0YzhobA3hzsqc7souOM2VA7tMmVWWSLKWmCfabmAQA5kBjgDx2W4
	vCTq3Ft51qM8NP0B4fXZkv0PEkO+ai+Uo6zAgsd3nc8Psf1S9EIycLMj
X-Gm-Gg: ASbGncsxSc8Rl5/EtNkjO214sidoAWmv5T4mb72qvd81uamF5N2//Q06HOmGwj1I6LX
	fOeoqUIJre2GhS1oJVgbH+DpHi2lacG61OubcgyXoq1g2jcpxvWqSa8BBJu/9dchUPuesVtp/Cq
	HvTSw9Sj9MRqh2+cLQxfaat2+2bqpfLfCYfTL1VZmrwWgxBYmjECfxmlFonziGmA6q8V6H5msNm
	odDc0ZHSGXTuiE2CRMeS6GxMTGTTHnpiklO2KPWLwDbOE/j65iczFy7Hzb5wsdvRybQFYXuWvYb
	exQo4z7WYNAnWqRbSe8FapOIWOWo+ZYCr5ZdQUNWNKWi5syjlhIOzMf7vqU07RVgbTZtpKaXmZi
	MRrDaHuycuZ+5jGwsI9YzgCRwIrdbcl1b
X-Google-Smtp-Source: AGHT+IH+osSnEPKgJeRhbgORMbw8I60o9JFRVApJP8/1VVoNnTb9GbeS662wmp/6bN/fBTGRWd9/PQ==
X-Received: by 2002:a05:6000:2381:b0:3e5:47a9:1c7a with SMTP id ffacd0b85a97d-40e4a52475bmr13435225f8f.62.1759092743838;
        Sun, 28 Sep 2025 13:52:23 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-40fb9768bdesm15725382f8f.23.2025.09.28.13.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 13:52:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: "David E . Box" <david.e.box@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][RESEND] tools/arch/x86/intel_sdsi: Fix spelling mistake "Licencse" -> "License"
Date: Sun, 28 Sep 2025 21:51:34 +0100
Message-ID: <20250928205134.241041-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a string literal. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
RESEND: send back in Feb 2025, not appeared upstream yet.
---
 tools/arch/x86/intel_sdsi/intel_sdsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
index 766a5d26f534..0e12b59976de 100644
--- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
+++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
@@ -315,7 +315,7 @@ static char *content_type(uint32_t type)
 {
 	switch (type) {
 	case  CONTENT_TYPE_LK_ENC:
-		return "Licencse key encoding";
+		return "License key encoding";
 	case CONTENT_TYPE_LK_BLOB_ENC:
 		return "License key + Blob encoding";
 	default:
-- 
2.51.0

