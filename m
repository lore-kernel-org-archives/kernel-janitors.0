Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A3257440
	for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419908; cv=none; b=J0I/T8oqLXQZebknLVB2zIYirVV5IwquyRRVMVvJeFgex+MuFmZ6M4EI36g+BcsFAJZhcJ/sNwOAO3IG4cFyQQSMbhCpFk4pNGW20NPkrRO1xaBSyUM+h41o+rO35KpK4Qm+OMyySqDVCxU/YMLgmDWWYNJ3RO+4ra0D17D3jQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419908; c=relaxed/simple;
	bh=vaHMQ2ZjJxntFZc5U5J5R37wyOU0aE1VASANrNBzvTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmD0wmBG0fyvo4wNfc4J7okIxjo+Sp6dK6BkJYQPP7ZGvtcCtdAdYe8ZxhYixz7kz1owgjGAlMhABHcVtm9ScZ/ZpN+17NUachgGqBp8e9k+wLCw2HUFSAql0MoYUoTE97UT2Du1JX7Cyk5EFgIewZVc3X2xQ+N36dQF2UpgRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+zUWDuL; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+zUWDuL"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a366843fa6so2630266f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419905; x=1749024705; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/FCb16iLm7G0e3WCUiTZyQQx/X2uoabvGUpmWxpr2A=;
        b=D+zUWDuLXuCSyHSpEM6Xa5G8GHzw1Fh0FidaHr98vmF0wMx7IPIeMMaEoBqjoTQ17v
         FxN2bnHvAz8Z0Ijsxxi5ffVM7v9/F7lmfi6a63Cmgb3RfTU0o7qSAJIX5HQEWC5L/ioI
         1FhqrHl7h9EDm6+enRbK4ao/QyyF+l7vaiABxGy+3ydVTbaYKV6XoXZxMaaqu747SDuc
         F2/0qhrK6Wjs7khqLXCH/6SFvdDm8GP1z/6Fu1v2gYXF2BTj7MsDI4lo12DWRGHiL9tg
         7Z6G4rFf3vBQgblbuvAdYaDBqpxhbzYOBKg3+eCEtHoQkV7ME6fPFFpN4VoCV2F6SE5C
         kCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419905; x=1749024705;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/FCb16iLm7G0e3WCUiTZyQQx/X2uoabvGUpmWxpr2A=;
        b=JjRiaVN/X9Mp3yItKVcgmV70YL/1I3J8WtJSWnblIwImSoWRVubCa1Dgv6JhuJQP2e
         TxnUyTxdGDe4uoiEwRM0zMK3SXn8teRI6P8tLB8/4e8pKtkHBTb9sm9MscHtzCYQKkQY
         +hXFImPVJAUCvl7KuM2OjCQwtL6ElgBDPMiVnZvQfGYQBe21Onnqrl0RqgrJ0CoXr//2
         Yxty+wqbUokUYshY6l34isHjDDNNuRyaWqH9trg0josPhRKPMGrwQWkH0cQ9NLOViMfq
         iXERwqYDMs6eIKComPpsNFfwER8B9s258hlFMw9OrYiZGx++JQY7p1E0rHgdW0CaL1SW
         aQOA==
X-Forwarded-Encrypted: i=1; AJvYcCW0czxZFX6McAf9LnFCu9YvXeP5KlURHc999KXjnTMPPvKq1wYHkywYnINYPIPuosKZ3Glibo3sVW+aQ8U+vCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzebXsQ+UU5+F6GU9xj/3NIwM0Zu9N5/wEK1Xya5DS9i8fZjNDU
	8DtgGLEiTFmRMwwA1JA2dGzpaPqamL7Oi4Cmmg80Vqj9Tw8DKY2O106hBkvGLNgE3EA=
X-Gm-Gg: ASbGncvkUfFs2Im9cAhmhyTMd//Qk45PObLIRybgfKP4gvnP1L3uzoFVgXhcqcOwzcF
	QyrcjU5aGzN82gyMjIshWxgV9R7sb8W86c8BCadnG0nB5jiOhqGtfOklk9zQSgdWeRds3TOJjMA
	Xxc245qQ2XSjHLz92CRE5dDewLPYvFIwvJl7BVZROjuDdfDgidaor/cIVMFBGknbjeEpFExBGaA
	s3kg2Zorjn1noUwhvDPKki8UYuO8ve3H8UND0mXmQHRkEDYKCDGHYxZ7zNN5sXfL2ru5zbnkK40
	xQcAEsEWYUEs2iBvSfbx6J0pDaf30kxDf9XhDB1dsYtdcChCBzyEc4rBjpfWW85srTQ=
X-Google-Smtp-Source: AGHT+IF/wZakUcvuphAcq2wGl7JnOIxHt9unsVJgGESVrVbsKufI2U86TIxeSul0ISFVlHUGaRAdxA==
X-Received: by 2002:a05:6000:2282:b0:3a3:6958:88dd with SMTP id ffacd0b85a97d-3a4cb436d3amr13082654f8f.23.1748419905264;
        Wed, 28 May 2025 01:11:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac6eb45sm798948f8f.12.2025.05.28.01.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:11:44 -0700 (PDT)
Date: Wed, 28 May 2025 11:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shiju Jose <shiju.jose@huawei.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Li Ming <ming.li@zohomail.com>, Fan Ni <fan.ni@samsung.com>,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] cxl: fix return value in cxlctl_validate_set_features()
Message-ID: <aDbFPSCujpJLY1if@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The cxlctl_validate_set_features() function is type bool.  It's supposed
to return true for valid requests and false for invalid.  However, this
error path returns ERR_PTR(-EINVAL) which is true when it was intended to
return false.

Fixes: f76e0bbc8bc3 ("cxl: Update prototype of function get_support_feature_info()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
index 6f2eae1eb126..7c750599ea69 100644
--- a/drivers/cxl/core/features.c
+++ b/drivers/cxl/core/features.c
@@ -544,7 +544,7 @@ static bool cxlctl_validate_set_features(struct cxl_features_state *cxlfs,
 	u32 flags;
 
 	if (rpc_in->op_size < sizeof(uuid_t))
-		return ERR_PTR(-EINVAL);
+		return false;
 
 	feat = cxl_feature_info(cxlfs, &rpc_in->set_feat_in.uuid);
 	if (IS_ERR(feat))
-- 
2.47.2

