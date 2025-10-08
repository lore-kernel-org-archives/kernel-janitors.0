Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8712EB850
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Oct 2025 14:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759934334; cv=none; b=EEG8OZ26MnM8jdoqkrn7BU49FohM1ecgthddaLRpYAslUhybChEDfQu3Omnc04ygRiHToPd+5Zmdtj9jCNck1XiHDrG0yobXWTuRzR2BkiJazCDzSaQGcILHjbs+Ou6+jxyuM1wFho6JESCTUVW6uxrc7iBw+B5TfmWSO6lWbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759934334; c=relaxed/simple;
	bh=vW4d+KASjVLRQlxmTYNHQnLbNq8BFQheGBjMK0J3LZI=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Content-Type; b=PX3Qcj6r9IkxZ6sPkZrys5cpfnGsB/Mf1jU29Wfe3Hde3UGazAWh/tgeauKq8V7I+LHSwBikUA706mT8/GlosfU+fLDiS6GLn1Wf4asbI2l14eeLYh15MNDnuWm8VGAemACIn64SiLMsLyZ205fWckCqaVtf8ziCsV6wtmLZNDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2p60BvE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2p60BvE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-863fa984ef5so907332385a.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934332; x=1760539132; darn=vger.kernel.org;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJLXoDWYgAmog44Pm7ibdOmWHzVIeuqL1A8vf/ARX2o=;
        b=D2p60BvEDpcgVJo44a6cGxM9QIus/o0uKY3LO3A2Cz4kWDIbIlZ3sam1JeUuxSFOba
         AMZZW5mah+j2goULUUzM4AOJusVrSh/ZeRUra57X1Yi2imNUvXrY6cuo4+ksJud3uGkF
         zMNszWjFNhOI4bkct3vHHW4RJ+QQdmzZrhFHisE3z0la6ZHEKF0fE40qvP1BN6S0DNxP
         OS32eMVUJSBFLWcqThNMwt47wln6Bdk2H0hSqI2phUNtwToF69uZkFX607lb2LCkyNwB
         38fz4q631Jjw7+KllDCTdyzJUPRIxMGeqTSg9oLgBHcgSFxs0NuwjiQP6/E+xXWHoJhM
         QrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934332; x=1760539132;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJLXoDWYgAmog44Pm7ibdOmWHzVIeuqL1A8vf/ARX2o=;
        b=sYW7yn+EpXwzy6EBLPvWDbkqIwd7jQXyF2JSczlwxYDSb1+hHrFAg4XU/81JLdnmBn
         XtMbmbXZQP5iZauqKjFFNqtjMvYqgNaQNmUfzJvSBsiXiy/6lkzS/p0a69esb1JfKkoi
         xIsQl4HoKw4H22mZJeMcleQP2Vt+Fz3fdJwqFUTs11N7g8AsfGvlMuEmMBWvyfBT/LaZ
         iSK38n2Cd5L1OxPUNZbn35TD1xo6rXv0/gl2xkY9Jtwca4p7NRFfQAqwIDpKWged0gKc
         PW9U5sMCuKtunrKe+nF4LzIEanoWL5VjRho0oDsDyi8Q0xpC8iVOKyUMfnpJcQYgYZ/F
         gu2g==
X-Forwarded-Encrypted: i=1; AJvYcCWWd8bbBh5nuPXTIrWaYMtY15YgFJL2MW0EIsVfBv+Cn8vefEkddJByTiH8vSYV2FHgf0RPUV5h9wSzD5ZyT1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOD6RTt4M9/S/W2uukLv0N1qohZIzmGrSKRJh0h8KHl+0NnMh
	CnWoMmb3vAiIeja97krrkfJ4yd+a7f24nTd/Pgw/PJhwCdd7uv+nneVw4oxcJ73GnaVsTY+nwcy
	Gxka8BR/u21xH3r4q+ecEGfpFtYkx3/0=
X-Gm-Gg: ASbGncthhaeI7bEFNxYAM5JJ4ho6g50eLC1anrJlFjXVMU0w+Pf5PYSjjaiW+/DEhU1
	snFi8MX3a2C9prHj4TH31pX8I+ZC3IbquECp4UZc8Ee+YfdxZnx80mFp/gOiomzzbyYZQJP1at4
	RhMPr3kFa7FIITZj8rQrkvIJNI99tAAvrlWBpmOdrvaAtjvOnYHAjJbX3PhV18ylAsrsh5KdC3T
	9q51ZzQeVIqsjxfuEcZROTlo9iU3OLLTKVt/YU=
X-Google-Smtp-Source: AGHT+IF+it1OcBxPz0VsB/IdgmRpXcmiUKEzYN63Nr6odezkJwkdhC21LZw9Rqe4nPvESEy+tDLg5BBsdUxS47vIkLM=
X-Received: by 2002:a05:620a:2548:b0:875:79b2:13bc with SMTP id
 af79cd13be357-883523d6f26mr540921885a.21.1759934331479; Wed, 08 Oct 2025
 07:38:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 07:38:50 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 07:38:50 -0700
From: Amit Dhingra <mechanicalamit@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 8 Oct 2025 07:38:50 -0700
X-Gm-Features: AS18NWAAD0Ld_hK9Lnl2mXC1VttH3a6opSMyMypTfNMv1gG0_fwBqVnAVW12AtI
Message-ID: <CAO=gReGixJuoovC4C5Gyx2G-1MTGPjFq2TwC3jxy1jQ1w1RmDg@mail.gmail.com>
Subject: [PATCH] [PATCH next] : Fix a NULL vs IS_ERR() check in mt7915_init_debugfs()
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Razvan Grigore <razvan.grigore@vampirebyte.ro>, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The mt76_register_debugfs_fops() function doesn't return NULL pointers,
it returns error pointers. Update the error checking to match.

Fixes: e57b7901469fc ("mt76: add mac80211 driver for MT7915 PCIe-based
chipsets")
Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>

---
Compile tested only
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index b287b7d9394e..cb9ad05db9d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -1232,7 +1232,7 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	struct dentry *dir;

 	dir = mt76_register_debugfs_fops(phy->mt76, NULL);
-	if (!dir)
+	if (IS_ERR(dir))
 		return -ENOMEM;
 	debugfs_create_file("muru_debug", 0600, dir, dev, &fops_muru_debug);
 	debugfs_create_file("muru_stats", 0400, dir, phy,
-- 
2.51.0
