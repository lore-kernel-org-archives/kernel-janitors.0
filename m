Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A48272E41
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 11:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368857; cv=none; b=j0Y8zAXUrdvzzwR1mPFtfwvn+iH/obT6SAKWmSQpCJlMD6Al52DOqjULxeUF4X9QToQAiFFuJv1Cxb8hjqLUDanqDzHR3+eUyOmddzKOKWJ3RsexCDwars+CvRKRgxhx4ADuIQypfAK2N2GFQIWlKSJoTMh1irvrf9tyNTqQInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368857; c=relaxed/simple;
	bh=ij1nHwP9563dCp6D39igVpjbrxzU+rLg/g8KA/ryBQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=py9u+0rQ/of0xaPNa0kqlusexriedtnzKqg3BLk0GItfoIVhvLMGhaLY8O7n8h1fYoHK1qiRPQrPSnIpxiQNF5zcqbhN4JMUYGqtLbj9xj911mX2l0+3AoyCeRFz/aJr/uzCoe7/Dy22I4Z9whrg5yhUROvl7DLXuJ6VIQ96hvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOpokkLe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOpokkLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751368854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ov6U1n1MDWz2D5fqtp1DKTq1qAHyWwUBf7Nu4VT/uv8=;
	b=IOpokkLe/H97ZKgNrWZMf82IGkbwq6K/ruYWECEpe7cB35HuI0Qj0HmJSK0YqMFZGnF38K
	5l/thu6rcVxxSflkzguCBNpxa+d8U6HIc7YxVlXhuUo5/E7DKUIKB/G3o9tvf2g0ftTH2M
	Xt85uIyBjIjBM2wRxxzdSvdnmq/7EB8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-6r1WbNvwPPuxfyIBgXzfuQ-1; Tue, 01 Jul 2025 07:20:51 -0400
X-MC-Unique: 6r1WbNvwPPuxfyIBgXzfuQ-1
X-Mimecast-MFC-AGG-ID: 6r1WbNvwPPuxfyIBgXzfuQ_1751368850
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so3196697f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 04:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368850; x=1751973650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ov6U1n1MDWz2D5fqtp1DKTq1qAHyWwUBf7Nu4VT/uv8=;
        b=lknKUpx87qkn2uCTKwkSRhUg6tuhP9w+JLTzXUiY6kwaD7LrEWFP7R2mOBt8BVxEiD
         hIfrnaUVhisY4gQXezWfvuLXaKp/aGASSJW0O+yfo+onKdMHa2q6Mnij/T0ASDz9NfZ5
         9bu+Hc3B9a6Kaj+7Q4MvH9ArgM0SBE/Lo93bORU0f4QN8cPTTxniYEUJB/gW/MwSJqwV
         +e67MuEebbeGwlcXu4BPV6g3mjl4zqoVw6HBt/6G50sGbD7Evi4Pl1p/+M8hZ3yJ9efY
         T5w/IgBuD3gIZP5qYYpm10n+RsYdTz0/kmmCRjVkEjmBGI5/CLFzRxx9xb6znVBxdE4N
         XWxQ==
X-Gm-Message-State: AOJu0Yy84jSpzDL6Ptyxq0ECzONa48dW9i86X/kfKfXTf6PZpla+xGFd
	pg6YPJLUp9/0J+UMUGzzOtF+04JM6UknMaV6hTR7zTRnTqpmqEctRDvYeYFT6i2n4UkXn36P7mH
	Jl2w1cUmQ7WcZ47Gwd/tyrysnMi+c0vPUhyjfl1LlPc8p52awRtFobWEfKs45FbUhRt4eJw==
X-Gm-Gg: ASbGncu3NYW6AdBpOvmk0LT2O1xSP4dDadSUlZPLtuDUQH642tv4l1EvhQ1V2j9KTgr
	3o9XPUjrsNQzGRwHlSB4LaMI+8xnQWm/Fv0vQ4a8nq/Xi+BlpCdL9UiDtpEYcLaPspmDbhKE4Jt
	vLj9E+Z9HfCFSskm0a5a8Zw1sH1/2C10lv0myJdfL+tCy9ToW+qW8SG/bVU5ySE+c/FBlwDlTDm
	K7CrImvaFKGjRpaxn0lDkGgy1c63ds70uxw0ygoX3gvWrTc3SU5kYODI+JjpTOndbDVOfXaJKTs
	U8+BuZWB02bSrZ2W/owFEO0aNlX51OLtGNNOu87yiBhzIlQiTe364LweZZrIwJ8dxm5T
X-Received: by 2002:a5d:6b50:0:b0:3a4:f607:a5ad with SMTP id ffacd0b85a97d-3af1066e035mr2243958f8f.19.1751368850046;
        Tue, 01 Jul 2025 04:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6AnEMsB4u172EihzT1thVpD1PO0S/tKfcNFTL+IkHYmZz4eI4zi6zCqHfM3FwezUxcVn94A==
X-Received: by 2002:a5d:6b50:0:b0:3a4:f607:a5ad with SMTP id ffacd0b85a97d-3af1066e035mr2243918f8f.19.1751368849575;
        Tue, 01 Jul 2025 04:20:49 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm197728785e9.25.2025.07.01.04.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:20:48 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] crypto: caam - avoid option aliasing with the CONFIG_CAAM_QI build option
Date: Tue,  1 Jul 2025 13:20:45 +0200
Message-ID: <20250701112045.18386-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

In the Makefile, the new build option CONFIG_CAAM_QI is defined conditioned
on the existence of the CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI, which is
properly defined in the Kconfig file. So, CONFIG_CAAM_QI is just a local
alias for CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI.

There is little benefit in the source code of having this slightly shorter
alias for this configuration, but it complicates further maintenance, as
searching for the impact of CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
requires to grep once, and then identify the option introduced and continue
searching for that. Further, tools, such as cross referencers, and scripts
to check Kconfig definitions and their use simply do not handle this
situation. Given that this is the only incidence of such a config alias in
the whole kernel tree, just prefer to avoid this pattern of aliasing here.

Use CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI throughout the Freescale
CAAM-Multicore platform driver backend source code.

No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 drivers/crypto/caam/Makefile  | 4 ----
 drivers/crypto/caam/ctrl.c    | 6 +++---
 drivers/crypto/caam/debugfs.c | 2 +-
 drivers/crypto/caam/debugfs.h | 2 +-
 drivers/crypto/caam/intern.h  | 4 ++--
 5 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/crypto/caam/Makefile b/drivers/crypto/caam/Makefile
index acf1b197eb84..d2eaf5205b1c 100644
--- a/drivers/crypto/caam/Makefile
+++ b/drivers/crypto/caam/Makefile
@@ -25,10 +25,6 @@ caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_PKC_API) += caampkc.o pkc_desc.o
 caam_jr-$(CONFIG_CRYPTO_DEV_FSL_CAAM_BLOB_GEN) += blob_gen.o
 
 caam-$(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI) += qi.o
-ifneq ($(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI),)
-	ccflags-y += -DCONFIG_CAAM_QI
-endif
-
 caam-$(CONFIG_DEBUG_FS) += debugfs.o
 
 obj-$(CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM) += dpaa2_caam.o
diff --git a/drivers/crypto/caam/ctrl.c b/drivers/crypto/caam/ctrl.c
index ce7b99019537..a93be395c878 100644
--- a/drivers/crypto/caam/ctrl.c
+++ b/drivers/crypto/caam/ctrl.c
@@ -24,7 +24,7 @@
 bool caam_dpaa2;
 EXPORT_SYMBOL(caam_dpaa2);
 
-#ifdef CONFIG_CAAM_QI
+#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 #include "qi.h"
 #endif
 
@@ -968,7 +968,7 @@ static int caam_probe(struct platform_device *pdev)
 	caam_dpaa2 = !!(comp_params & CTPR_MS_DPAA2);
 	ctrlpriv->qi_present = !!(comp_params & CTPR_MS_QI_MASK);
 
-#ifdef CONFIG_CAAM_QI
+#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 	/* If (DPAA 1.x) QI present, check whether dependencies are available */
 	if (ctrlpriv->qi_present && !caam_dpaa2) {
 		ret = qman_is_probed();
@@ -1099,7 +1099,7 @@ static int caam_probe(struct platform_device *pdev)
 		wr_reg32(&ctrlpriv->qi->qi_control_lo, QICTL_DQEN);
 
 		/* If QMAN driver is present, init CAAM-QI backend */
-#ifdef CONFIG_CAAM_QI
+#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 		ret = caam_qi_init(pdev);
 		if (ret)
 			dev_err(dev, "caam qi i/f init failed: %d\n", ret);
diff --git a/drivers/crypto/caam/debugfs.c b/drivers/crypto/caam/debugfs.c
index 6358d3cabf57..718352b7afb5 100644
--- a/drivers/crypto/caam/debugfs.c
+++ b/drivers/crypto/caam/debugfs.c
@@ -22,7 +22,7 @@ static int caam_debugfs_u32_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(caam_fops_u32_ro, caam_debugfs_u32_get, NULL, "%llu\n");
 DEFINE_DEBUGFS_ATTRIBUTE(caam_fops_u64_ro, caam_debugfs_u64_get, NULL, "%llu\n");
 
-#ifdef CONFIG_CAAM_QI
+#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 /*
  * This is a counter for the number of times the congestion group (where all
  * the request and response queueus are) reached congestion. Incremented
diff --git a/drivers/crypto/caam/debugfs.h b/drivers/crypto/caam/debugfs.h
index 8b5d1acd21a7..ef238c71f92a 100644
--- a/drivers/crypto/caam/debugfs.h
+++ b/drivers/crypto/caam/debugfs.h
@@ -18,7 +18,7 @@ static inline void caam_debugfs_init(struct caam_drv_private *ctrlpriv,
 {}
 #endif
 
-#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_CAAM_QI)
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI)
 void caam_debugfs_qi_congested(void);
 void caam_debugfs_qi_init(struct caam_drv_private *ctrlpriv);
 #else
diff --git a/drivers/crypto/caam/intern.h b/drivers/crypto/caam/intern.h
index 51c90d17a40d..a88da0d31b23 100644
--- a/drivers/crypto/caam/intern.h
+++ b/drivers/crypto/caam/intern.h
@@ -227,7 +227,7 @@ static inline int caam_prng_register(struct device *dev)
 static inline void caam_prng_unregister(void *data) {}
 #endif /* CONFIG_CRYPTO_DEV_FSL_CAAM_PRNG_API */
 
-#ifdef CONFIG_CAAM_QI
+#ifdef CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI
 
 int caam_qi_algapi_init(struct device *dev);
 void caam_qi_algapi_exit(void);
@@ -243,7 +243,7 @@ static inline void caam_qi_algapi_exit(void)
 {
 }
 
-#endif /* CONFIG_CAAM_QI */
+#endif /* CONFIG_CRYPTO_DEV_FSL_CAAM_CRYPTO_API_QI */
 
 static inline u64 caam_get_dma_mask(struct device *dev)
 {
-- 
2.50.0

