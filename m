Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55C26ED5F
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764159122; cv=none; b=t6+26zKvdH2zdSHDgqcjJLQClXTHGOqoGFsFUSX3Nv1MOHK/uh04Yhw5eBYxmCGChWI0gaL4D4iQaBxEh89BX2Ducp+GOG6oojede1rA2dpcEmvyaVcyvRkrezU6m/awubAjIeUttSxMfVdy5bt3VYUl8PcpolM6TCGj9VDNYVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764159122; c=relaxed/simple;
	bh=uvWHl978Y+rYvpiWI+Kt+Voue06IzDwvCCOmf1Gm9yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYUIIdG1iORqeQ8I0Kunh66m1xAtPe/0a9fozgpnVg6VZZQ2ULpkvasMRa2TnGGgou8NcpEfhsFa1IP3LytdixkH/0tcOPsdzq6TmrBvt5b3Ak0vwSYx5+xGUgO7MnrCoHb1slntA+r3y3/6eH35fmx9Frtxdu3E5op67iUkaMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lp9sLamd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lp9sLamd"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso43683335e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 04:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764159117; x=1764763917; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cd+1Cagg6P/hQKqKcPtdTLVPLBxLVs3swxXaE6oveBE=;
        b=lp9sLamdXiEwhf+aI72YWz39Y4tRhuWK/ybMsP5RHAKFVPs64CIe9PfHH8SLkqOqSy
         mDw2iUOneKjxDJUXwEC6P6ArSgeV2D3a/kqCAgy0y02oEYOSM0kgCfha5VE8bGJ3+MH0
         PPqHVfJprVtPGgwLYx5+7My0yTjxA8X7SFC9LcjDjsj47/214vUQXw7PlBNkxsG84/6Z
         Wba2MfL+XiX8v/nXAqfs8FwRSuxol5LigIvKqfmkO2XWn45S12F9tkt81jmS2/OW7qAt
         T39vq+00RckwmG44xNEThc0GlQOMk8c+AVzL4JKF8rHunK7kptROaXkvkfjBgBaPf6/y
         8YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764159117; x=1764763917;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd+1Cagg6P/hQKqKcPtdTLVPLBxLVs3swxXaE6oveBE=;
        b=KtCoGmQOZEryoCAYmAYImVA/tQmHo7viRtuZna19xZIzZFCfoQjFyZMUlssFXnuTFR
         NdMNA5Z6BwJ3ikVrSWAAqD/PeMuLyBRzzSC2HDo8rPgYJTJrJBbVNEwWegm1IpTYNDf3
         Nr6oELHA1IhXQW5gS0f62iSTtk+7vDfstRhlT/xPswXiu3IGpBSFOlJ9OUiWcwifeT1M
         84x2/kkOeSDCT7jQGH2CB6hOaHF4dIcuX+EbakqYV3FS3SVAGxVn+uL/39OgQzk9iXQ7
         ALby68BorW8FID+Oc/SOzQwqv1DkStkieVLBoDwfqTGkCx1zpArPImpGYVP53wkS5m0q
         24JQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9qN4qU3aW9MwHrKX7jI/DBqYOCAYbzWCfWkLfWlSbM3OCEM3lL1vRX7m3cmfugrMQP92LhW1uFIfAhTutxHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlalHBeVYhwZ5PeMRp53FTOI3q/N2D9TtkWg/1M9htS8hxLbc
	HvwMyik957Shl87eb3F0TNU/1amLJ5VgTx9ZHU/UnCq3Gg3miDTRx8M2wSL3chYn1vE=
X-Gm-Gg: ASbGncvMGDRrREyfrdlA5mjSaoVo/IiSXqnZ+Oc226xC8khc4eOlVYmQCuOlW7PJvgs
	AzqWKzcE+foPq7nrqivx6ASnpkoNhI/iP3hnYqcGA0+Kk327zpq6e+HtrOZTY13UjO/RxB0nnFx
	j06W7+uhGTnQTysn8ly27qrG013OcSa5nKhSitSyBaLxEPixpF2dpuYAO52tfME+QXlpaQGnU2P
	Ay1USo03N8wQuQbvBEWq91tid1RW4I/9/ZTp7ijoQI7/QJrF0kaZf9sLJGlkCuNOdnJOaTaB0yh
	ggNM9kyjERzhbsMHxmuvic+mGjyWFZgu4qLJYhGmIarJjesxVCBIDUEA/UZXj+DkPO8q85/jUso
	XLalpjN4UhJBT+Hwy4wIzQRwlNb0cFotl/d3AAu8OuuC5ymosCiUOzgujGbe7zQd1hZ/R3Awtbk
	VeqJcZJHQqfLFs1TWv
X-Google-Smtp-Source: AGHT+IFWu9W4TOiqyvkdf1aDEOHe4E+V/s2R/oq+X48vwv7Tx6mXyt3EVJ8/GOWx1Thn6yZchN5usA==
X-Received: by 2002:a05:6000:1846:b0:42b:3b45:7197 with SMTP id ffacd0b85a97d-42cc1d0c89dmr17865163f8f.42.1764159117033;
        Wed, 26 Nov 2025 04:11:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f363c0sm41102732f8f.18.2025.11.26.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:11:56 -0800 (PST)
Date: Wed, 26 Nov 2025 15:11:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next v2] nvdimm: Prevent integer overflow in
 ramdax_get_config_data()
Message-ID: <aSbuiYCznEIZDa02@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "cmd->in_offset" variable comes from the user via the __nd_ioctl()
function.  The problem is that the "cmd->in_offset + cmd->in_length"
addition could have an integer wrapping issue if cmd->in_offset is close
to UINT_MAX .  Both "cmd->in_offset" and "cmd->in_length" are u32
variables.

Fixes: 43bc0aa19a21 ("nvdimm: allow exposing RAM carveouts as NVDIMM DIMM devices")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Ira Weiny pointed out that ramdax_set_config_data() needs to be
    fixed as well.

 drivers/nvdimm/ramdax.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvdimm/ramdax.c b/drivers/nvdimm/ramdax.c
index 63cf05791829..954cb7919807 100644
--- a/drivers/nvdimm/ramdax.c
+++ b/drivers/nvdimm/ramdax.c
@@ -143,7 +143,7 @@ static int ramdax_get_config_data(struct nvdimm *nvdimm, int buf_len,
 		return -EINVAL;
 	if (struct_size(cmd, out_buf, cmd->in_length) > buf_len)
 		return -EINVAL;
-	if (cmd->in_offset + cmd->in_length > LABEL_AREA_SIZE)
+	if (size_add(cmd->in_offset, cmd->in_length) > LABEL_AREA_SIZE)
 		return -EINVAL;
 
 	memcpy(cmd->out_buf, dimm->label_area + cmd->in_offset, cmd->in_length);
@@ -160,7 +160,7 @@ static int ramdax_set_config_data(struct nvdimm *nvdimm, int buf_len,
 		return -EINVAL;
 	if (struct_size(cmd, in_buf, cmd->in_length) > buf_len)
 		return -EINVAL;
-	if (cmd->in_offset + cmd->in_length > LABEL_AREA_SIZE)
+	if (size_add(cmd->in_offset, cmd->in_length) > LABEL_AREA_SIZE)
 		return -EINVAL;
 
 	memcpy(dimm->label_area + cmd->in_offset, cmd->in_buf, cmd->in_length);
-- 
2.51.0

