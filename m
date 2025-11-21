Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE8334CFD4
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732176; cv=none; b=Xc9v8aySP1a0IZcJKqei8U3nUq5Y1IE+YJtRUuRJRt79fQQnU0RulLy1asDKbRIZcGYlzTqmipLDlanor/b0xtfLb/jmW4HDswvn7YvcyEfpbelKR18PRCuQv1J8jNDdNR3ETDBfbprFluNrlu2r7XqpMBqopNAKOFVZAm5qrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732176; c=relaxed/simple;
	bh=SNhnVPvZIHPLVZ/on1Eao7513kU/koRUzcXYbd29eE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g7as3m65is3kqEgJpPjwYlo0gpTETg4mjaaQAxXFCgtGpI+3IGMPaHZs9nY+FbC68hSuMD5LIGoXHy8TS2HY/noHn27gWKNVTgrN4I9a9ChM6XZsaLhLqY/TvdDt00ja7ePVSbT1sAr+VbfKF+60IWwZHllLqx8y+uOKtYvwMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8xmGul7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8xmGul7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47790b080e4so11348255e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732173; x=1764336973; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2PesaBKduBABW9/nRvmlbqH9Oh7ml3xkQQS9Uo3etk=;
        b=K8xmGul7gA6zEUP9/ajlGjmDm3wHEiURk+sai2bOMZZgMSAgb8r+Sj5sBeGrfAsIDS
         cjtm6XvnSbkSg7yr2fGs1/EuW/IJDNAJNavci3aDCPbiZOGSN9E3uydW2i3cB9d4LZlm
         FHdmG0pmQCFN7lFdsLa3EdcXhsS7KQqZLcNVPdqwnjVRE+NKwxLotGTpNUiuYRuIfpA0
         2k1QSIuncVCFOVeBv2LFDZ268Q8i4wAdukm7rcQPyJfebQy4Plpb4W5X+xewwyeYTimJ
         1L68ZzOQ6z4IkP/LTK0mLobYryOhySFpZznrsX5vTX3/qgZVboa2YETVwM2ilIxMAIcy
         Pt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732173; x=1764336973;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z2PesaBKduBABW9/nRvmlbqH9Oh7ml3xkQQS9Uo3etk=;
        b=O7jHMVb3E4oV0/Po9ft/B2MbACRxxllA4aQBNTkBi52ZwwFbjf99XLMZb0Ixz1nVdr
         YG/vl0xS9+ZixR7r67mRKLHOBbm3x/eeuJpLVKLGZ4bSoXaAvQS7UW8RqtpOi7JUvHA7
         aZ6flWim09zj3WljewgWIO0vl8I1ySIW8x9IS7MdjD7VVVwY4erRtmSB2fz1P8QKZoBX
         EybFmyTeHH2nrXXd03ZR2EJwTcx8gwPENFeeYjfCAgVgCR3Gv2vkLD/RDtAMoDjJefG3
         aMUNz7Ym+Avd3ZRcq2uPqAnVHA+S8JUhBc7n3WNZ6rvbaOiRjvyVWPDi+NBPSV8zvVLd
         1J2w==
X-Forwarded-Encrypted: i=1; AJvYcCXAHbCOHQdIe06Dy059LnAPeAuzzZS3QtV4e10WV0607W6CrYxcuOJYqkG/T5knx3DqrT4AJ4HQoYOVekPqrnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww95kgwMBdPjLwQD+YLmq7HAQyNl9/2aQQAid39BnPbPwCrEHn
	I/Yh9eOIB9TS+c3DZ3w6PHNJyjGNZMag9Z+lkDCSFuCOOX3O38XqKypz09sfQE6QdJ8=
X-Gm-Gg: ASbGncsNJY1v+PsYAPe5265j4bSiAEF065NV11a5KPa7fh0SrhtLmV3j4rHPqwLK5vy
	zTT8LRCT4fakp3HBDEsOJPJ6yU2CcA/Ubm35dUaQgXJC4K7hLCq3ZtoxRU+cyACAW+1TSYPghlr
	r91B+zjprMExW0IkQh5mIkzk2s1kb9FR0DjAh2BPqnjz9g20cRZe4ihXoe8eUmePWtzN5WHLa/X
	CyYUuFdUGqaejEPN3Fe4+YJDXG7OnHAQlHTVVrMAYk7PJEipP7rbAdhn6YMY6psL6ijhg8Gifju
	kGRbMwBEzzYXiJ7tK5rWb69RIUOJfgKERfxxX9x/zxXrKbk5lPCWdSFqtOdeY39cEhQ3b8DwV6w
	Qehr4ROI3BP2RRWWeiaAe5FpUcEAMHkgKJto3GQQvbGHqJpXCvHAW4daXclWc3nGXeItAf5mB1S
	p7zfKlGszRWQWjJ92mcKkmqPCAgyU=
X-Google-Smtp-Source: AGHT+IHmKits0Ab8ZpUqVmd4qefREverhE79kiAHHxNwyMWrDSIyB6s607/u5/y6Z7cp7ArOd07/MA==
X-Received: by 2002:a05:600c:310f:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-477c1125568mr27673535e9.24.1763732172938;
        Fri, 21 Nov 2025 05:36:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9dfd643sm83520865e9.14.2025.11.21.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:36:12 -0800 (PST)
Date: Fri, 21 Nov 2025 16:36:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] memory: tegra210-emc: Fix error codes in
 tegra210_emc_opp_table_init()
Message-ID: <aSBqyISKPN5TWbGu@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Fix several error paths where the error code was not set correctly.

Fixes: b33c93babead ("memory: tegra210: Support interconnect framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/tegra/tegra210-emc-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 397448cb472d..c97ce799d53d 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1981,11 +1981,13 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 
 	max_opps = dev_pm_opp_get_opp_count(emc->dev);
 	if (max_opps <= 0) {
+		err = max_opps ?: -EINVAL;
 		dev_err_probe(emc->dev, err, "Failed to add OPPs\n");
 		goto remove_table;
 	}
 
 	if (emc->num_timings != max_opps) {
+		err = -EINVAL;
 		dev_err_probe(emc->dev, err, "OPP table does not match emc table\n");
 		goto remove_table;
 	}
@@ -1994,6 +1996,7 @@ static int tegra210_emc_opp_table_init(struct tegra210_emc *emc)
 		rate = emc->timings[i].rate * 1000;
 		opp = dev_pm_opp_find_freq_exact(emc->dev, rate, true);
 		if (IS_ERR(opp)) {
+			err = PTR_ERR(opp);
 			dev_err_probe(emc->dev, err, "Rate %lu not found in OPP table\n", rate);
 			goto remove_table;
 		}
-- 
2.51.0

