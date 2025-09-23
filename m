Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4763B3203AE
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626423; cv=none; b=VAs5anOzJgjMzSLj8w7C74VI4/rBLnQzWZtfklsnb86mGVL00GquENDtfeyGlZIaVgzEr06JTZCwv/1iex50+TGZsTeB6mLD/FLokArkQTDSbgdTmsEseTQ+1nb2aVCZumJnW7F8J/fofs5KG+XSySv94x4Z8Rl3QCE94HCwamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626423; c=relaxed/simple;
	bh=B3fRnPBrL6bndjkV80Lqpltt+HotD1WV25scPuVekdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSTh1k1s5GTWgWrNfsKoVdTW5ctfpx0p3P6F2p3/vIAk0PqRYUUd8jXt2a8oR0utbEeoDxwF/vwFWaS4CjaIDPWjEObm9p8x3OtfsCwJ5UvgLMdaCG+bfzq7ws0RkPayFFO9mW2KgpjZ3nyAQn4vg9m0GMpNI6Fw3yDaJ5/LEV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i9wGKFr7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i9wGKFr7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso3127318f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626420; x=1759231220; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VE8TJpb+bgJUe79vS/3A1j4fTVnXxc+D4cm6eCdCSiM=;
        b=i9wGKFr73N2dpnTDqR9wl7Mt41sJLnKWB/19jvnsgxsw0sbDnRHDjb9jZl8xTNBqzL
         x3TIaMnHjMFQQQFTAyc7M/sHlm46TalPo3ChDHoDyqlgeBXSHRM+QOgnjsuM66Mi4CWy
         FQ2n36iX7uVW2bULH7g2idNd5B7WNUoC1qn6dqmc/SzdtltQ91bO8OvenQqWTcy6bufn
         UX3yLGMlmsWHTK4McIGcmRrNUtGpJfj8AVHbKFSmDkILr9Ur9eE9aB/QiaxpfZixxBGF
         si7jWMjtCkB41RA96YLkY9KRzv8IAIzjYupmAgc9DADqGItAIpTUlNlJ1/1cv3ii41wp
         FAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626420; x=1759231220;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VE8TJpb+bgJUe79vS/3A1j4fTVnXxc+D4cm6eCdCSiM=;
        b=L0sGz5f63+pX2DFYxJp9R187Z7H9hzj4Bjajf9AMIHLm9Glxn773MfAgm6XajXiVyN
         Ksg2KLT30k+Nns6wAh9/L24JHT76BY2Xk5mcX2iZbSkOakf1Ka+unNfUbgLB85ep164K
         PEVr0G8XgNm6vAQ7VHNYJPZRxREMeW7CkcBzU3B7Tdcca2e76w8mIQG1RWZa06atOXK8
         bT/9S/THPZZgfxbDVEBxxBMYSY7c2U4AEOdfTRCR3xd7DrbqJJywPEMYK9xzp9kwEX0v
         Ht3OalJpw9B6KoB3lfXN1KaQ9L9b2B15DcLg0/eB8AMz7CmqvstftwBTx2tTdNysQy56
         /YuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUW2Wz4wJCnsfDz/HqaEjVnQ8zQ6f9qUOoI1WwV1+scOEOm5/stnVyqMSg8hGNUwPLeY2Q+Hl1dge3BGmu6vAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YztjNvvuK/xZ9AdH/Qt25xTJ2pxYy3JcAp864zweE1D5QKdxxt5
	a3oUdrey1r3J9lDvbmahM4Jzksqs19uQwIzs94WK2+WS1vBVcuYVSmOiouF99LXyY+U=
X-Gm-Gg: ASbGncu86gCFVgG06zsikAFFrn4It9ksDEKd31Q0/SaZlgwhd0GgFf3++s9aN/13xiC
	5abVHMecqddvOethIb//meOyXggNyGT0GcjyAjIEA08Yy05DXMIhD+sWS9KTcGb33mZ2t9qyFFt
	ozerYSoXAXrXyy87Kj+RssUuHywtz/QaPh8YtPLqogZMPLGdC3Woc+w0wc20kUFAOtokgpuu173
	4CMmG6PiKpcnAxPaMdNfpKfu0xqOiwHRJmpbMLmpY/g62acitZQRhQftxtMpFgBc2sRjMiIAC9G
	dZ9NiaQMXuoK5zs2M3NjXdz8vxUks1c1y+3nXeeNU1EOUN3Bzt1fg9s+tP+soH2arzGV2FgASC6
	dkgRLlP80A4fBTVSU2s0CO03WghPZ
X-Google-Smtp-Source: AGHT+IH5ERjqItScX3GlaqMEPRqH6OH857XNBhEBSVVCeFpYjz1uRmIbad/KOH3nGEJlbG/jtig3mw==
X-Received: by 2002:a05:6000:186d:b0:3e7:46bf:f8bd with SMTP id ffacd0b85a97d-405c5ccd210mr1652472f8f.23.1758626419495;
        Tue, 23 Sep 2025 04:20:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-464f0d8a2bfsm249409455e9.2.2025.09.23.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:20:19 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:20:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Somashekhar Puttagangaiah <somashekhar.puttagangaiah@intel.com>,
	Pagadala Yesu Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Daniel Gabay <daniel.gabay@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	Shaul Triebitz <shaul.triebitz@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: fix potential use after free in
 iwl_mld_remove_link()
Message-ID: <aNKCcKlbSkkS4_gO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code frees "link" by calling kfree_rcu(link, rcu_head) and then it
dereferences "link" to get the "link->fw_id".  Save the "link->fw_id"
first to avoid a potential use after free.

Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/mld/link.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/link.c b/drivers/net/wireless/intel/iwlwifi/mld/link.c
index 738f80fe0c50..60d814bf5779 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/link.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/link.c
@@ -501,6 +501,7 @@ void iwl_mld_remove_link(struct iwl_mld *mld,
 	struct iwl_mld_vif *mld_vif = iwl_mld_vif_from_mac80211(bss_conf->vif);
 	struct iwl_mld_link *link = iwl_mld_link_from_mac80211(bss_conf);
 	bool is_deflink = link == &mld_vif->deflink;
+	u8 fw_id = link->fw_id;
 
 	if (WARN_ON(!link || link->active))
 		return;
@@ -513,10 +514,10 @@ void iwl_mld_remove_link(struct iwl_mld *mld,
 
 	RCU_INIT_POINTER(mld_vif->link[bss_conf->link_id], NULL);
 
-	if (WARN_ON(link->fw_id >= mld->fw->ucode_capa.num_links))
+	if (WARN_ON(fw_id >= mld->fw->ucode_capa.num_links))
 		return;
 
-	RCU_INIT_POINTER(mld->fw_id_to_bss_conf[link->fw_id], NULL);
+	RCU_INIT_POINTER(mld->fw_id_to_bss_conf[fw_id], NULL);
 }
 
 void iwl_mld_handle_missed_beacon_notif(struct iwl_mld *mld,
-- 
2.51.0

