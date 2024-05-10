Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FE2172BCF
	for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715356759; cv=none; b=GpTz1QcaVizZaBDenoKskjEu3mpI2fEFTdDZ2SA6TTYJ5M93yDbLOqh+OzFzGgE3eVXbPSpM/EKLpOdadKCdR6U3B1m82ExEqQDOG7VpfLJZa7b0cbSPo9PBF0kWlYwfUg6BQb0KRY3eOXyVuCyLv+zIf6ySn9vbEiVvmku05jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715356759; c=relaxed/simple;
	bh=J+92hXnaFjj8CDjvSEIof2zLpu6lXiMuInC1wXs3yNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQ5Qp6woTl5993GwtTzGwSZHE9sawDOF/Rj1nH33XZFp7X5NnUysT4c6GvTQKoj/d47KRLTwqfpBQmabpoZpiXO6XHVibri77jTF3KTGWc4JWn9jPj9w6OGDXj4ahjjwSxFElzndbGTkLh+d3wh+dJqigKavdXn9eC9dQEwDeC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSofYpy8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSofYpy8"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-51fea3031c3so3079603e87.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 May 2024 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715356755; x=1715961555; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kaC1FX9IaWOSYR6DDBjH2nZIpL4z+ve32+mPw2UdL5w=;
        b=PSofYpy8tvGE5zb3ymsZk9L69zp7ezzNQCuG7ObpKZfXzfTeldyQLCfGIuHwu9LhbK
         7coOwZ/LG5Xfuf9PE8DQOo5gjG8+YBYLR/XKYk8E+B3MbDsxGyRNWo+tgseMVlockNgw
         i2SjRnv/tU69R7Kv+s7OBUJhwQaaBjxYDM/07SR15Tp+6PevlTqsEb0RTNfNY7joTAdP
         EVF62fbV2Xnq36R6V9P1bnwgU+D50J+/9RLpn/h/KGZQ+mik1wWRRl107Jm9q2ir/xcc
         4R3jEnWP6ehvfh6JgXLdnzvIijP3DBmU/+uUJZ+H/HZV+QoNB6+dXe7d3JL+GVI1+P4Q
         YsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715356755; x=1715961555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kaC1FX9IaWOSYR6DDBjH2nZIpL4z+ve32+mPw2UdL5w=;
        b=nqrwdmZBYOmIKeej13QRjPSCvnS4soL9Wz3Wu2RLXov/R1u3srNKV+3jzdyyzrefmB
         4ekni+bV0BDEgld7g+nnYZhlsyjGQfqFCzC29RDdCRiNJvqgF5keFeANwtA4CKKHWZN+
         /CIiLIm+4k+3DpLSGXF2yD9L3bCSsH9EVsCiotpvaapPH66elvLT+izPQrufn/ABS9Nb
         GpxDaKVZ4Cfc2eCxiaEWu4mYJcBBDglLQFtv+5b0n/v964vDBmcZIadwy+4KM+mLM5md
         65HkQ8BL4HeN2TYhFiKVUNIKVYa4PI+foYVMQCi2uacuc8E0pCmCcCl6H+eOhPtxUQaP
         2O2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNNgVfO83ljoW9ZPboc6We+BRyO5lWGDxHQoKIxsxUmVEasc3OvbvaYbBtxqCF3VRRp9OCZsLkf9vo7jFZXIfjpCfB2a/RE9a/kHNvaNmH
X-Gm-Message-State: AOJu0YygNC679Fjo9wO5YdJuwaVvZZaR9GVwfIQEns9J6Y+w5wPLzNZI
	eY6WG2xpniiYUrdCOeFCwKGSAFD0p57JJXLcCBIKU6hogX8SqcjpaEoF7f/5AQ0=
X-Google-Smtp-Source: AGHT+IEM5bdqaeGgx8w3nkjhWpAJfZyjTMZG+ycwOpy9UjbCyzEqZdbDt8dL5b4mlC40ps7Lrh/MMg==
X-Received: by 2002:a05:6512:4003:b0:522:221:d19d with SMTP id 2adb3069b0e04-5220fd7bfccmr3137814e87.15.1715356755115;
        Fri, 10 May 2024 08:59:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b0125bsm199199366b.143.2024.05.10.08.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 08:59:14 -0700 (PDT)
Date: Fri, 10 May 2024 18:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Kalle Valo <kvalo@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Ilan Peer <ilan.peer@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Avraham Stern <avraham.stern@intel.com>,
	Yedidya Benshimol <yedidya.ben.shimol@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: mvm: fix uninitialized variables in debugfs
 code
Message-ID: <466baaa2-4996-4193-b681-d847d181a961@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The sscanf() function doesn't return negatives, it returns the number
of the number of input items successfully matched.  Fix the error
checking to avoid some uninitialized variable bugs.

Fixes: e5bf75dc46e1 ("wifi: iwlwifi: mvm: add a debugfs for (un)blocking EMLSR")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c
index 17c97dfbc62a..88e78c798017 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/debugfs-vif.c
@@ -762,11 +762,9 @@ static ssize_t iwl_dbgfs_esr_disable_reason_write(struct ieee80211_vif *vif,
 	struct iwl_mvm *mvm = mvmvif->mvm;
 	u32 reason;
 	u8 block;
-	int ret;
 
-	ret = sscanf(buf, "%u %hhu", &reason, &block);
-	if (ret < 0)
-		return ret;
+	if (sscanf(buf, "%u %hhu", &reason, &block) != 2)
+		return -EINVAL;
 
 	if (hweight16(reason) != 1 || !(reason & IWL_MVM_BLOCK_ESR_REASONS))
 		return -EINVAL;
-- 
2.43.0

