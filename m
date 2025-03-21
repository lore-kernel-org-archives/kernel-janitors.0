Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD5D1D5174
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567742; cv=none; b=MFLLti12dbzCX9MPS/y0ifD72/+XDE9jUMVNPGlcFxH+7pXDuHcfd3noCI0T9gP9Q4V8qsRQKpfQHbwERQzHmoFouTjxlevEHDhZAWdZepIK9X2/8L3b9NmdVmjgqnOfeD0eakkEYSKFRwZVYcld5gcGisapDzTCtvbUxqkThLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567742; c=relaxed/simple;
	bh=2fWMldJmgwMUu39tdUGRd4PbG+rFiQ2bc0jCTZUfh8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLOQUkRyO1mUPUsYwe8i/xl5SliNTV8bPYBN/4v3mpC8cT87VK5ibkICgAuNwDCO3daxyGJQ6+fKAvI3XoJ0VRK5qSUC3KzWV7AhTQ0Wiyvdcs57B5gG1AEbzJnsAVuIQ6lX+WBvr48CXvPVJkV5tk13hIvJiv7PSCWpfMG+UFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aAAaP09q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aAAaP09q"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3996af42857so2085090f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567739; x=1743172539; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PPRppdrVJ7KjI6wixZGEvPAU+S5utOovE0gqiXmI0c=;
        b=aAAaP09qNuJblyS4TtpIdwnKa8aYrpNyeRhPqWeeQSFO1f1eE5c3k14Jfel0LkSBt6
         nnHwpvKWEjjnlv/FrgIIssRMLWtVqaesxqr3QGq2scm76uwOzd5Mimg3A3tXp7KUFheg
         /IxbIZrjbJ3fFFND1LK9ItekDVG9YLnDNxCDFpmj/Wf7nfj5+X3Dl+66kdXpblOoMVuE
         2cDroYA/mKt+8c8nvYo/+7Z5cYjSoJPDEoqCw4/G7VCK0vfMXHOUncYJ2yfNmagirg9M
         JhpNhJVr64SWvBeCMiIOiLbxwunGI0E4Mc0eDThYfIT+TLk+P1xB23RnJrxPT7hO0JcQ
         nuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567739; x=1743172539;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PPRppdrVJ7KjI6wixZGEvPAU+S5utOovE0gqiXmI0c=;
        b=sH3Awc95OFIr2KC28gPXvGJzeHGxY7tDce296+vkyOKWdRh1bmhB/iqVijDDunLWY1
         2qw8wi4kN+oYIKc0pB6/tAH/GWwz7PyHuRd+2j+eZDlyCbyXas/H2xT4iKbB2/UObkGv
         SrNBzljFNBWjJCO++AoS6V18U/O6uVeO2LzfgXSMKm4zcV6/gCEKTfKCA8HYyZGAe8u+
         FNx0AWRwbjVeOUKU6zxes1gGmuZ63LC6nnn7u32TDDZuzFWcTlbCEXBie/Boqjt8RJq1
         DePrZb8nVrs9z0aSdMSExi/S3ovAys/6fBez1PgNHzp24yh5oErBjlVTywoKM+GvyyP/
         kiPg==
X-Forwarded-Encrypted: i=1; AJvYcCWYe1yNNxzFR1AW4jm0aPMhae1JkTHw+AoBzAYV7y22lju8579Ke98NAclAoBd7gLDzsw5xPVyc5e/lCilnJyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLGuutMUwbNifNv3OTnPQmlA8liXvEijazLDEBhktiugPAwgpH
	i6BGyjQCSLL6iGtFsXoGIZRKYy4+5eD1ZBR5Ypw3wjslOM0vT/p4xLmUWZ/niCQ=
X-Gm-Gg: ASbGncs1dkHknPoA2tYpjy9LKG7F8RYeySHQx+wSnvpVG6nZDGVc0c8u9TL+0D4xIP2
	/wnMYXkMsau+OYqSoWkhK1UsHzjseb1yz8GfDOQcR5fkDkJE5hb+a/dHnOjbXUsWx/M2ZiUDwGs
	BAsj9YtgmQ5EQ5uzPyE3DX7HmeA1KVS7B2M5ffDox86Y/p8bj0/IWceA2QCZOErew0Za3xqMT1g
	dzLt4IS5ntjXzPy8jrQI1L7Sebdkq4XfnTwhHVA9kRfbh53S4GqqWm2zN1V/0SU1QdMDVPNPnVb
	M34cbjZ8MT2++4XnpDqCWolUT5518SCETbhtNoB2cRhmBvZMFw==
X-Google-Smtp-Source: AGHT+IF2afE+amq9nc4FEedeUCaZRhGRjLvVfJvTuEgevNOAdUUfdZR/acRzOI2V9GG7bPnUNFsa8Q==
X-Received: by 2002:a05:6000:1fa9:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-3997f93e053mr3439159f8f.28.1742567738601;
        Fri, 21 Mar 2025 07:35:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9b26a6sm2493540f8f.44.2025.03.21.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:38 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7996: remove duplicate check in
 mt7996_mcu_sta_mld_setup_tlv()
Message-ID: <fde7246b-08a2-4c2f-b2dc-c3fd0e6b300b@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "msta_link" pointer has two NULL checks.  Delete the second check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index ddd555942c73..03539e20f5c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2242,9 +2242,6 @@ mt7996_mcu_sta_mld_setup_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 		if (!link)
 			continue;
 
-		if (!msta_link)
-			continue;
-
 		mld_setup_link->wcid = cpu_to_le16(msta_link->wcid.idx);
 		mld_setup_link->bss_idx = link->mt76.idx;
 		mld_setup_link++;
-- 
2.47.2

