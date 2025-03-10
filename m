Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833622EE4
	for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 10:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603924; cv=none; b=edwrSEZrOuHEnJQndhS9IOYtd14Sy4u0uD7xoXflKri+1lSCTER7ALW1EbR1AbgdPq0yCzOP43b//AglTXkxqr06DqFypytU0p0Lq/Y6lIPuiJzKBjt/YOQIQFljPh2JKuSzqqrtvQ51PsrUAgjvsWStWQ3zS8J2i0EOeqEwBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603924; c=relaxed/simple;
	bh=8pFmW2yF7XeBHwGWpBOIVO3bVuCA2uTCoDSKVDixUQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5AGiD2d3KM5lLgCMh+KxG0X7vnbu7Z2NhcSRSnKIQ/wtfvJPH0hEZVssrNY0cJsbR/lt3s1HkClwH/kkyClqMsR1BFszkVcyZ2KRKIrejcrN6f11xLPqHPBzLPhzDyhGZ+vvVD9V3O84wGq5u1USFXtsNs68N37cgEERqOuqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJhUanvB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJhUanvB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so34096275e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Mar 2025 03:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603920; x=1742208720; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRaYsvVFrqrTjWbVoLzSGid2k7c2/yuWbrvy6P2VIxo=;
        b=yJhUanvBwPoRt/h2J7vQjHB4pn0Y8MkOwza7TUr08zWjsZSGX51/pXwgo4wxqVp+iw
         0YrjbJeVENhg3FuMpVSFBENnWeq4/eKkL2EKY6V6FQZtzGyxciZISKizq267RQzuCBUZ
         6J0Q949WXQxDxhayMaCxWgH+5JbIvdLFvratTq3H7ZtaA6qGnjy8Uejr5nUypboH6ryk
         Y9MqoASeMZiavmeX53rBJ6FfJP185C+fw/x9qqPINjsy79IIzd1AdmqhzaXDseIjXHe0
         bTto9+tziiSCw0IlGvt1mLkxyATSRBCK0CzpDDTOZp7DPEdqF4qCCyt0g3GWA9oqeD1p
         L5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603920; x=1742208720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRaYsvVFrqrTjWbVoLzSGid2k7c2/yuWbrvy6P2VIxo=;
        b=rlwNdZ+Ga5iRAlnGMVKJ7UmZyLiwnHDJ2sAckN16obXDdMMLIEEMPZv8hDXN+GFSa1
         ObmrIXuO/pXS9hDLhHSNR7ayFoB8TEhUh/uqQ+ISjPot0THUuOU2XM+0vtjzmRuVb2P5
         c7FtnRZPi//sZM1B7rSmF9aVpPP2Dv8B7kiSzp2hOCZ6ojjRprwgQLZIuCae+whnztfX
         X/xM90OdWQsVttzIOm2GqVIB1M0DAB79PBXxfByL4PLZUOAolQBOp+E7ljBASHJg4vpy
         jeyevEv4a2XWIdI8kMN42VAjj6Q1bxIiUxNZbipeRYO8W+B2qcslzplYoWQE0ZYz8hiS
         M+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWA1QNFMRM8N6/xQXnY3zTC1hs/jrovYDdP4f6CZBrg8QwxwQzm9oG9M/E9f/Og6Z5iAYOlsY4VYghZRnBrlN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGFCYqnzsWaLM2PakyFDfuyzV6xCKWPX6buvmaYMuha3GePbKG
	FM1+P8HLliogYOq/pR+KO6NX9ietIC318hstoOfF9GHcHiGV4OlMdqRr7Jx3y6ec/v1+QtXf9WY
	v
X-Gm-Gg: ASbGnctHO+PIYUpJYWtuz1HgAD4HNgXPNTGRNzPZV10b9jdZMcLZt4BArveMXp9fJ1y
	xriaip8fe5WrZHIvL7ped9SuO+iaokaAY+0fw/droVlXpbwmfJYYxk6WAZ0icp3BymYlUQIzqsQ
	ilnlz5DAJsI+MZuXMbdYpX3ebU7w0Tb/J28V0Qmjftv0pck+5hp1NZJd4OIhKQaitXK6cDbfauH
	yXrWY6KEW9oLXfkM7OmgfmCsI8lJJRtyfD5z1FLaM2jTIeraliEcC3zfeMLJK/A8fXA8i8Jb+4E
	DPscs7fNDXeWYnwDvfRwzN1Y91/dE1hcF7WelMfkM10TmUAEMw==
X-Google-Smtp-Source: AGHT+IGMN8eK8zmMhyTnMEO8hcxY2G1+yaEB1GlPZwSy0jRn7v/TP69/lWg+VAd4stSNCOgX1BzcIQ==
X-Received: by 2002:a05:600c:1d08:b0:43c:f184:2e16 with SMTP id 5b1f17b1804b1-43cf184310dmr30775335e9.5.1741603920329;
        Mon, 10 Mar 2025 03:52:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ceed32e64sm59063525e9.5.2025.03.10.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:51:59 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:51:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()
Message-ID: <43ad5358-f5b2-4cfc-85b4-e7ab8c7cf329@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a couple problems in this code:

First, if amd_pmf_tee_init() fails then the function returns directly
instead of cleaning up.  We cannot simply do a "goto error;" because
that would lead to a double free.  I have re-written this code to
use an unwind ladder to free the allocations.

Second, if amd_pmf_start_policy_engine() fails on every iteration though
the loop then the code calls amd_pmf_tee_deinit() twice which is also a
double free.  Call amd_pmf_tee_deinit() inside the loop for each failed
iteration.  Also on that path the error codes are not necessarily
negative kernel error codes.  Set the error code to -EINVAL.

Fixes: 376a8c2a1443 ("platform/x86/amd/pmf: Update PMF Driver for Compatibility with new PMF-TA")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/amd/pmf/tee-if.c | 36 +++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index ceaff1ebb7b9..a1e43873a07b 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -510,18 +510,18 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	ret = amd_pmf_set_dram_addr(dev, true);
 	if (ret)
-		goto error;
+		goto err_cancel_work;
 
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
 		ret = PTR_ERR(dev->policy_base);
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
 	if (!dev->policy_buf) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_dram_buf;
 	}
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
@@ -531,13 +531,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data) {
 		ret = -ENOMEM;
-		goto error;
+		goto err_free_policy;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			return ret;
+			goto err_free_prev_data;
 
 		ret = amd_pmf_start_policy_engine(dev);
 		switch (ret) {
@@ -550,27 +550,41 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 			status = false;
 			break;
 		default:
-			goto error;
+			ret = -EINVAL;
+			amd_pmf_tee_deinit(dev);
+			goto err_free_prev_data;
 		}
 
 		if (status)
 			break;
 	}
 
-	if (!status && !pb_side_load)
-		goto error;
+	if (!status && !pb_side_load) {
+		ret = -EINVAL;
+		goto err_free_prev_data;
+	}
 
 	if (pb_side_load)
 		amd_pmf_open_pb(dev, dev->dbgfs_dir);
 
 	ret = amd_pmf_register_input_device(dev);
 	if (ret)
-		goto error;
+		goto err_pmf_remove_pb;
 
 	return 0;
 
-error:
-	amd_pmf_deinit_smart_pc(dev);
+err_pmf_remove_pb:
+	if (pb_side_load && dev->esbin)
+		amd_pmf_remove_pb(dev);
+	amd_pmf_tee_deinit(dev);
+err_free_prev_data:
+	kfree(dev->prev_data);
+err_free_policy:
+	kfree(dev->policy_buf);
+err_free_dram_buf:
+	kfree(dev->buf);
+err_cancel_work:
+	cancel_delayed_work_sync(&dev->pb_work);
 
 	return ret;
 }
-- 
2.47.2

