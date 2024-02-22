Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4723412E40
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 06:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708582450; cv=none; b=e1l4SOpuxdX7HdZFWZWSXngJFotYkqiqp+nPO5eihE5AzCOzUrWNiNns2vw9OzfrMO9yWsPG6uTA44LsNIg6NYcVbdBMTnC0Eegwb+VRbxHXxlfSyjmf04pssUgQ6g+V+H9xFdo9avXxXs08YXYfYeKx2sQ0ZCHuWZRUk82CxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708582450; c=relaxed/simple;
	bh=bn5i7/H5MiGU8X0jDHY08Xk8tKztkxjuCmvj7DxUVWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcKLKjWf9ScKAgrkr0cd0xHPLC7G81qcrSkjCAKMrCJ6nFbNh/62LzZHg6wLLtWOPA2kfP0c2i2nyf9pbd5L2rJIIGlZ3zXAT4FjDlWD1AwBDrgSWVeVHIKb4KUTIOw2ZFr9ktLNl4xUqHFw130p34sPvFbeGDbZdh1vhvk4jT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZssiwUOS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZssiwUOS"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-512bc0e8ce1so4706073e87.0
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 22:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708582446; x=1709187246; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SC+H9Oulb2l4KVayVXMGit73eWaz8qeCs2MKjcvOvk=;
        b=ZssiwUOSH8jikzJYq8ZcP5uGGi6D0dmW7qLMtDVUrOprFj/imhE5lg8l+2JBrT+1Ja
         jo+dQATSr2viMRGoeXXXZdBuw3hgeLLWfudCiYtdRR9glVeZslvFJqeaxuLyEPGR3Z+6
         EVv9XO/cS4V1lTlYl3SP8X8JI9SJONBpwCOBBjYDIzyoRLQMoV8FNTQgzVv7mxLzKHRN
         29pK2BNotffTu44O84ADPTQohNQDHcWrpVx6ckGqkg4avFKqTDD4DuLTqXRqoQJqheI4
         CBgUglcOQ/9SDcg3YsyB06Xjs91+Nza1AcoG548haDqPcO3ZkYZ794PNYwaxd+cn+cql
         lZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708582446; x=1709187246;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SC+H9Oulb2l4KVayVXMGit73eWaz8qeCs2MKjcvOvk=;
        b=fpQ2f2mtzzl2CYjhtK8AFzm14BsKmGOEvXCL1cJVCj2D/elFfNxaXK+v8yRZRGIZgg
         ZrywRSOGIvhCn+7yIlZ6QYTKDf88OK/QHt8nCmzsJgxuSyFzkDor5llz745GyyWaZLji
         eIXQeQ+oCuOHgHDzIAFatqqovq2F/fM+ykYTxdKAUqU+eotpobHViq9hLIzWAqduClyL
         gqxdX9DZbahnwkmkmM5e9e/dPQ5vHs/MBs/hOGy/fk31ggrlkst3FnxVfPZ7STsNfVBh
         jnoW33GdcLOegDWKmWeKLkTBtdNkoHbx8NxlpzwKbV0aj6fUked/d4b1ASRejW7GTP3p
         XJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCXB+9nfcc7fDJRZbCT0LScJsUnl6QXxFsGibioQ56rWyI0SRwOoZVeo/HwFYL9/1PSfqobGTDGwUOgVZHgfNBSPzjD5PjrWMut3uFzAx1y7
X-Gm-Message-State: AOJu0Yzvk1btigF7/5KVsJ7tf+j7NXvMbKE8FfjF0tsA7t0SH7HSy8+y
	uOA9OiN1JUreX1qy+3/bQ2MgLMGS//MTIZBJbMrcQ6037/C2ptUmvgVmgLYJz1s=
X-Google-Smtp-Source: AGHT+IEFPpQi7S+GhwawZ7jvmKAOogqWriYg4ubc/su/gpl01N2jx+fL0rRyTg5Zi4uPXaVSGiPYKw==
X-Received: by 2002:a05:6512:3f06:b0:512:8d30:6dce with SMTP id y6-20020a0565123f0600b005128d306dcemr14162544lfa.52.1708582446477;
        Wed, 21 Feb 2024 22:14:06 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u7-20020a7bc047000000b0040fe4b733f4sm4867924wmc.26.2024.02.21.22.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 22:14:06 -0800 (PST)
Date: Thu, 22 Feb 2024 09:14:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Robert Richter <rrichter@amd.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cxl/hdm: Clean up a debug printk
Message-ID: <3d3d969d-651d-4e9d-a892-900876a60ab5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that %pa is for phys_addr_t types and "size" is a u64.

    drivers/cxl/core/hdm.c:521 cxl_dpa_alloc() error: '%pa' expects
    argument of type 'phys_addr_t*', argument 4 has type 'ullong*

Looking at this, to me it seems more useful to print the sizes as
decimal instead of hex.  Let's do that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/hdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index 7d97790b893d..0b1843631b26 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -518,9 +518,9 @@ int cxl_dpa_alloc(struct cxl_endpoint_decoder *cxled, unsigned long long size)
 	}
 
 	if (size > avail) {
-		dev_dbg(dev, "%pa exceeds available %s capacity: %pa\n", &size,
+		dev_dbg(dev, "%llu exceeds available %s capacity: %llu\n", size,
 			cxled->mode == CXL_DECODER_RAM ? "ram" : "pmem",
-			&avail);
+			(u64)avail);
 		rc = -ENOSPC;
 		goto out;
 	}
-- 
2.43.0

