Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A21E5207
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180730; cv=none; b=qLiskrauHnQu7BEBryICjP0Z8XIG6mH5nX8f1IpxwtA+5xc1HQnhSjbaNV9xcL9RVYzx3CDc6p/nk9jZSnCut/r48/HtWtJ6U9isz+2FxoY30Ji+YT/QeWSQaOhA6dJUgzYvYURWEBSUsP4Zz5D3BkF0olXc47T0CrgaBmTICl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180730; c=relaxed/simple;
	bh=E/tyVze7GjvOR6oKmycXNTHZRcGUr0IVK21VJQSKidE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TWtb2xg8Ajw4rcis/Gz4PqNwJJjGoNmFOqGYVvePC/c/OnhNVyC4GIANhKtiEpHifmEQScKjUmoBjsMvoM5dKZxFHJ9y3ETZ/BO6Yt29zzTBmoRj+qkToilivH6IDUO+4tAOPtXD4eGHeKyZBf+6BdHLT3OvaiAP8ptCRUh6AyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScEfxe9z; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScEfxe9z"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb5810d39so1074262f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180727; x=1766785527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=ScEfxe9zXZg7hZtWBG6pPp0CoMf1gj0QvZAyHlHskpSaLCQ0Cf1xr7XL7of8HrtYaL
         +1DwSb9peIXSXg0DBBqeO2mvIHhJymWkJ/AMg9Aentoa7RppQKHYP91ug+Uf8aC8xYYF
         D3VXU31TWPc87/sc2JNRAQrfny6M28E7RsTgu1Meh8GZMsRi61p4mZpxJAVRI7oEoA5j
         iZXeCLcI6igkfBY77ixiwNWHmgG5HTAyG2vBsBH9gAiwzGjNkE9JJDCkkpikmRMoIb7m
         r3MIW4SLLnlzg9gEuKLshQeznKY488YY1nza0COMGUTFCT5iIKuKmvpJZUC8aOu6DCHP
         97ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180727; x=1766785527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=B5HqFOJTMtzpZWTsK48XEUvRkNnHu3nH9/OvWHF6b3+yICY2L01724kILszOV4T1hR
         CMhL2DIZ7sH4aio5COb5dsVAAy782wASIHue0sHSC0WYwacEsxKEFqhuW4nDh7jp5GYi
         3W7qh2rizU8CBk28SPsX9tljHSye/aVAIg1WYWcR5J3MYcvfVxsmQP2GCmbjKTRrLa9i
         uFvB85hDjzjnGjN2kT6/hXxTr/0a14XhTNZzFH3shpdKRI4RUMCqIfwLLRbaF53lO8Mc
         YR5kHbem/bRq91dn4K9FX/8/xGdCDVNHHk3EwABanM3xnGERj02enof+ALWY+nvhCppN
         8hYQ==
X-Gm-Message-State: AOJu0YzgNtPP+5+n1HVVy1343wxdBFxKmcliW/ZW0mnrAyGclT1cLPJK
	pF0MIf33NvYYqctm1J/8FytDcCtEH1dHxP2fn4C3a+WmdgJu2jWA4l1d
X-Gm-Gg: AY/fxX7RN3ccPvzO/4FhTjDqvPCC7XJDuTP166AgK60QIg8ywVgf8+F4Etbl0nbQ3Sy
	VlY62R9wxtrYGuLz7auOwpit71gWWOKX4aoVITauwxoOhD470bRENDwGIW0oYT/DcFxus6jgydC
	x3fHuAmtKVoFKIzOfPOap1XXcYNl3dZzllEDUrbI6Ux/7IoTeBhi9WVqfTmTzeZ7yRBrupJJiip
	VZ0wcJupINi0VloR+60EUYeVBHd+LJZtWHeaLpSauXzY5uhtp8RkttjSuHDf8KoyOV8QJWuvmG0
	l6gSZQiVXgBnv9Bjd7KFN3IXd7fxH7EwY+/zIyGfDvpPeo7E3iezWW9fE2KYjJcGdf5muhorUsk
	nP1u+BgnXsdNrawrgN5pYK2H8kOs2pH1Z5JYTr6pLsfrK1Qe2fqmpFQMyg2wtTjCKNX7S0ciyPC
	Vn+IXG18fTwjQKfQauAKll
X-Google-Smtp-Source: AGHT+IH6/ztrcn+SlJfyVJT63am/rH1xZvx6X/K4m0kF1MT0B91G4kSCAcxAARG8TFZiP/ksh381nw==
X-Received: by 2002:a05:6000:2211:b0:42f:bbc6:edab with SMTP id ffacd0b85a97d-4324e4fb405mr5082384f8f.29.1766180727224;
        Fri, 19 Dec 2025 13:45:27 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm7013078f8f.0.2025.12.19.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:45:26 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: host: mediatek: make read-only array scale_us static const
Date: Fri, 19 Dec 2025 21:44:28 +0000
Message-ID: <20251219214428.492744-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array scale_us on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ecbbf52bf734..66b11cc0703b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1112,7 +1112,7 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 	unsigned long flags;
 	u32 ah_ms = 10;
 	u32 ah_scale, ah_timer;
-	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
+	static const u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
-- 
2.51.0

