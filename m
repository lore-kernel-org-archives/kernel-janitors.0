Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415AD1DE2C8
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367996; cv=none; b=AUfMBSF5pwlEkGs4bmuasWngOcz9GzMN8vKzUTaDr/sGO+F68Fhsl0aGqaYRyOop5d6BDLrNa2L8Qh9niVlnYb5iKgfQWuM3/rtKpXNGGmRemhg37VhjZP/faOxF1erFoWzcIavYtwh3Fy43eBYzVi4d6ja62imTIJFbNHjFbVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367996; c=relaxed/simple;
	bh=nQq/HfwhbxFMClvYRJ+B1HeOFHIj8bJ2yd+p/lUMno0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KDRlRHP9jgoZI6/wH1yFhoMyJtwdgrhttYgdMXznmA8tBe5kG0C34XfyiyZbw7LYm5Bo5fl9svGtWcMTSIM3/dujVBqqbwrSnNgJbOXJfBLgFqvgFSz9z3oMs6XGEmjAd5tzHfasc0z32pb0s45yvQ4UxM9/1LKVzs4icB3ws2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCDmltXY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCDmltXY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-399744f74e9so213969f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 00:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742367993; x=1742972793; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7b6xgdmoV1Iom089HH2CF+DeQzDZvROFfj09QmtCOhw=;
        b=sCDmltXYBvSxXjj/f9PzXElP96/+basLSgi6VNtybPQPUCCeKdC7woYipb/N/qZwBd
         7dMwlXgEAJ9B6UrcdZdppu7lfZj1VdcmG5ly/6gWK4L5p+FOX5os90TPb5bVOZLgOXQU
         9btbIVCHqltpdxPv7vvZSujfixvzlj3ykr0KD48+nMYJrzWZQ2IN2jkto5nNlnQsBXW/
         txEZPtYEBHbSOkyzrRoXtnw+tdDjR6EpcSdspHG4Vg8lPqzE5gyW0Fpon7k6nvaasxoN
         llKCsNsGWxa4LSPg18vSrM0bFvaXlvSPm9eNJdRNEQpRVewm2teB7wsxr6yTqTO+rNgb
         Kw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367993; x=1742972793;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7b6xgdmoV1Iom089HH2CF+DeQzDZvROFfj09QmtCOhw=;
        b=xJMxDRIterXH+mp04O0wHBAbhPvdFw6lgNGLI8CdO9m6CR68fZ/RNC163a/p82z2Re
         wx0H99/H0TbwFvk4LYX34ak4Mef1Z/uNLsRRzwfPjcajKII1EGGu2FN8XwrdhlFK9ClJ
         f5Xfblcv52WWLqWZyv0M3QeusxizMn6H/Udk4Tv5i1fcQKB9OIHkAuIcix8VNgRo7plD
         ICDiM0suzSZyNpDK4OPHTnw/BJeS/Lomv+qWrr36/mVngH8XhKnUjul3VdgaXhEI1PUJ
         yMBULBHkD3K+bV03y2K3EyzJoJFnDSh0+j7cErWEe3jBwjjc9paypAVzz3QubkvkCJJw
         xkBg==
X-Forwarded-Encrypted: i=1; AJvYcCXru/RGNFNcKcaFQ6lYEtyfrjfRf1ZWj9eQAD291hfTrFnd3Ip8n0exujcnifQmRozDT6YxHjCudM2cA7+5+go=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYVnWkWvAyju9Hc5HpRYUBSEpkYLZw4VJLBZ1W7OltrJp4I77
	JL3ffzjpAd4xpqB3GB/FC2GrIaYTWpg0/h6rvxfX25Pzihdqszm3a8tNpHFZacY=
X-Gm-Gg: ASbGncsKsJ7KhKp6/iYoFcQWnkh+1o0Ay8jAO8BOPQC0HtNAkQ0j+SECS77R98GjO3j
	n/ZPeU/BvjykaOHWhPzig2dsXG4PnbZeFMHEhVDZl9QGzmO3JbCjsyPKA3K8BldPqrVjJyjH6m3
	iUQ2q8yuPJhhJcip9cPzVKk0cLWHu/DfgbqF3NNohEHszXzLtf25fBOEZxri1PRmmnCcQhBVQ4X
	1VzuPn6n6rTbPyhtvF8hj1GhO3VqPIpkxf9EjTWGaeGzOhTWxKojDyTqbWAbH/s/FSMLH0ksav5
	jZbl34BN+ikYtQpf1tDL6VPVkuavy98z5mRKHsvZgI/7LuEqVQ==
X-Google-Smtp-Source: AGHT+IGHvK3obNd7t+NiTomb5dTMS67ej/nVFhpk+PbB11o3bsjXScaBpVaZHw/Msfo4YN+kqmNl8Q==
X-Received: by 2002:a5d:6dad:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39973b0487bmr1262415f8f.48.1742367993471;
        Wed, 19 Mar 2025 00:06:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f4542dsm9787965e9.15.2025.03.19.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 00:06:33 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:06:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brett Creeley <brett.creeley@amd.com>
Cc: Shannon Nelson <shannon.nelson@amd.com>,
	Dave Jiang <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pds_fwctl: Fix a NULL vs IS_ERR() check in
 pdsfc_validate_rpc()
Message-ID: <925355aa-c98b-4fa7-8e49-b97f6d551a86@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The pdsfc_get_operations() function returns error pointers, it doesn't
return NULL.  However, the "ep_info->operations" pointer should be set
to either a valid pointer or NULL because the rest of the driver checks
for that.

Fixes: 804294d75ac5 ("pds_fwctl: add rpc and query support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 drivers/fwctl/pds/main.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
index c0266fc76797..a097fdde0b55 100644
--- a/drivers/fwctl/pds/main.c
+++ b/drivers/fwctl/pds/main.c
@@ -255,6 +255,7 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
 {
 	struct pds_fwctl_query_data_operation *op_entry;
 	struct pdsfc_rpc_endpoint_info *ep_info = NULL;
+	struct pds_fwctl_query_data *operations;
 	struct device *dev = &pdsfc->fwctl.dev;
 	int i;
 
@@ -287,13 +288,14 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
 	/* query and cache this endpoint's operations */
 	mutex_lock(&ep_info->lock);
 	if (!ep_info->operations) {
-		ep_info->operations = pdsfc_get_operations(pdsfc,
-							   &ep_info->operations_pa,
-							   rpc->in.ep);
-		if (!ep_info->operations) {
+		operations = pdsfc_get_operations(pdsfc,
+						  &ep_info->operations_pa,
+						  rpc->in.ep);
+		if (IS_ERR(operations)) {
 			mutex_unlock(&ep_info->lock);
-			return -ENOMEM;
+			return PTR_ERR(operations);
 		}
+		ep_info->operations = operations;
 	}
 	mutex_unlock(&ep_info->lock);
 
-- 
2.47.2

