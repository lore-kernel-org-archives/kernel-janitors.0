Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A426B741
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864931; cv=none; b=mEE/TWlNy4/Ga2MfNv62OFw9kZMqh+fSPWwDq6wXzYRi4D/GX3W/1bLxOI4jYZ4kABixxBjZu6pKt5bn1Ca0iEqm3EG1XOucpONloxVD9lMPAsTTOv71Tuh5doxk2iv52AIO9/UEGqVtFF3YOLX00n1SqagY6rN6tnpTo1Hspi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864931; c=relaxed/simple;
	bh=T/WgMs1t2r6GpZznn+R0tQC4GQB69BnKFtR2iVgkMCQ=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=IiZNMjJYWtZ3L2ZxOmVAPRiALMsVx+FJDLu9dGKaWVXfnRTGj81dJn3XyN2hqlOXJDtFKpIBuLD7/q0Ycy2B60uRfmjSACnJ8NyPZYydL/54nBBJ30Jl3O41yC9ennYzqcQffLuvRR/oRPKS9gTF1sy9nvw848y2PUXiYjT0yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWtTrG1k; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWtTrG1k"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-40ab5bd9088so36343b6e.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864929; x=1751469729; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7oc7DM7sUp9Q2g/4DgfS/ixOMuqC8G8HAAnnDTr+l8=;
        b=NWtTrG1kG1OIjAVGUGyjezZPw/SzftN/pTuyohNdThOkXwWjoqtlxfZeZhaG4iEGYo
         Ff/VjDH1pue4OfewT3cg4PMhwGfJJ4WBo6oKyYrX9D7gxbaUXaBDbVufUuEpXFoKVZxM
         +qlfKUY7ymPNI6ekmnfZkV84ZLd/ZV5NgCIAnXg1cU7q89XzxuH5ptCYjrpuIWyj/NNb
         h2gSX50tAkxlFRx4jnhLglb8Es+/xQBerR9448rqpfrLrzJoxKM0kXwNn1KNwG0VlGgv
         MwKwkKyrND4DolM3yvxuHJWod4MzOlQwQf8ntSm3lralYY7wts18FnQs0W3oPi9kndY+
         XE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864929; x=1751469729;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7oc7DM7sUp9Q2g/4DgfS/ixOMuqC8G8HAAnnDTr+l8=;
        b=vJ9LVezxz+5m6EvH0F7KhHoy/CGHwIy7pSFcAT0HQOkoVjgjlRUANChNIGxiSroLyi
         plZluHkVFVa/pLPkWOo11Y7J2UEzDjzUFZSaviKnFF00LomHJg7dFLz2FalJov0+7n7W
         pdFDKeSYmQHpH/3/3iq8iySd+tBHAhCj09LlTnoXZAWXEZe6QyqIDmy2gEbSiTijk2gE
         rXL+PjftT+01J0oEeSoEwIfWewZ/uE0v5IQTBz4yUrdz/8IziGx+kG/d3sftnONVebiD
         O7Hlx9EWkFM2shbqq9ymxRet/wG1YCINcUY1hxtRfIR8zforal6MgD9mHNEjGsxhy7ji
         BA+A==
X-Forwarded-Encrypted: i=1; AJvYcCW9oXJ1CkQTMc+HhRP2tM+A+xhUFGwqKYHn6yoWmbjFe0j2P48WUankdb2gXGSoiZQoEfovwJ/U/74l4l5WVf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54UH2/sEXuJk53SD3SBp5bgXR0Sn0yqftzq0LkXweqwDR+ptA
	u+fbZcVelxU8OVK8uvy4tJ+1xa39b2nHYfAsLxpT2mc67Rsn7OWRKUtxYua1rZNwrw4=
X-Gm-Gg: ASbGncueb1b5KGx/31qBfqNRnxfOrxDJuugrsC7huftQHpmcPeMiqP76cn3Dkq0vGcM
	7BC5oXvdj0v9xqINPBCQnA4eIb02JnHBSw3EMvyi3xKvBhjq+gKFTYDMd4MMzNnbckQOWGOTDNC
	A+Yd4Tts5E1yMrZYfPzQX9GGDIeL+6l9P9GS05a79GT3hK//R9h3SV/Pl55bLnoEF1rmMZV3Mlz
	qGS+Uwys5L4slzdur9lAGtdb1xKUB1UV5gutCxWp9qWVK4t+TjjMTtGPaUxv+1Eqlx8/ZN7hlo8
	Rl01F9au4jQsfyeaXkQNP+wPKKz3cGFQ1vVgNJyqT7hEhNCVGE3HoRiSMMpm2UiJ2WUfRg==
X-Google-Smtp-Source: AGHT+IGcFvEYPWqui0Yt0xXJPtapA6f/IqOEU7Zk6imoU5KH28ETem8+ya9bGVLKj6PAPIC1zVqo4A==
X-Received: by 2002:a05:6808:1789:b0:407:77e9:a104 with SMTP id 5614622812f47-40b05762eb8mr3132816b6e.17.1750864928919;
        Wed, 25 Jun 2025 08:22:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b6d233bsm1689623eaf.16.2025.06.25.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:08 -0700 (PDT)
Message-ID: <685c1420.050a0220.ae80e.9bfa@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:07 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: pcie: unlock on error in
 iwl_trans_pcie_gen2_start_fw()
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to call mutex_unlock(&trans_pcie->mutex) before returning on this
error path.

Fixes: aeee73e27f2d ("wifi: iwlwifi: pcie: move generation specific files to a folder")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
index 0df8522ca410..8ff23f3931c6 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
@@ -546,8 +546,10 @@ int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
 	}
 
 	if (WARN_ON(trans->do_top_reset &&
-		    trans->mac_cfg->device_family < IWL_DEVICE_FAMILY_SC))
-		return -EINVAL;
+		    trans->mac_cfg->device_family < IWL_DEVICE_FAMILY_SC)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* we need to wait later - set state */
 	if (trans->do_top_reset)
-- 
2.47.2

