Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C964CA286
	for <kernel-janitors@vger.kernel.org>; Thu,  3 Sep 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448334; cv=none; b=gNiFBCaEBmijSttbPkterTwPscEcPxSx889k4dycu/WSrJ1RUq0eo/cPZqbg09vcJWxFB1tF5sJevyZsrlicYqIVSUkaMtb7KVS4j/NZn6sSVw9TZrtxNUzI+WQXQVxxMkGB4E4opiN3Da/1k7Mr0TW8f2W8kETj5r0v9rI3IyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448334; c=relaxed/simple;
	bh=AypfK/aOKqjDcv6x3JX0uwcWctZz8kqyktBW3Ip54EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fav9B6IyzhvXYrPm76HedaMz4X3fzzwVlyfaHSZIo6i41uIDpDLTHnJM1LMMYza3VZq9nWhu7e0ujbdZ0pbb/Ns79iV04Y6CWf9ltiRLKKn/LRWjjXgCIrQOtUIUAdihHI8kXo/LGQqz5W7i2EfAQ0zM9VrBCcmrIJxg61G29e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzOUIIHR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzOUIIHR"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e067e908so2197634f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 03 Sep 2026 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448331; x=1789053131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=jzOUIIHR9sRjKRgnKc63T7QLTdWlKVM+F10nvxX+yoxmvPdpyJCVEuA8J3iOXwFxfE
         9qb7TBbXYnuSsfOyy4sCbtKFCWA56T924WUv8xM27urbD4Mse+e+gN9CpFsNRvDLdGO5
         tzs1B3cMvEfs+++r2T+4YOJQXSD6t5eWlgbvJCsyUplV24NyNDuAvbmiljrxk0SbjRpN
         2+rwThmPekNC3NgHcIJwE/DbHO+ZUcUeQgujDFd8WhBIgmFRXSd1FvXoAgyz3JwIT2Kr
         jjzLIGJ0QXCJfhYa6D9t2AmMDNjlT60zonbEQIMLd6Flio1RQdHnY+3PkJ8iom8W2xfr
         Muxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448331; x=1789053131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=BFdPb1N/LvnMSv1oh5BqaACv2+VvXPbhHInzyvhvvkyEhIm6QTvgc0uBXJxCY8G80l
         ZFrrMGKu1jeE54qlUohVM5pjPmZozmsIf4x0QVJy7kvGy0kQvAVPEdYYzvk7eCsJJHBW
         WwDxeSqRfS2/46+JZwVJ8iQV1wQvtbPfK8wOj8pNoEAL9Q/ysyqrQmU2TemTU5WgmKcs
         jw046MNkw+gXR3wQEhx4w0IPUqjIkZIPVuYwKD0615/QqZHdxL2/+ZGkY1b2ONGIAFGr
         Rs44z2gSozJgDiU74GwTW19gMndgTujN6HAOqiMRWyuJu4c2rxXu4C6AzOiVJ5MdlW7U
         MAkA==
X-Gm-Message-State: AFuF++nhm2CPwGE+uHCTFX9Y8UBqUYvaXLhqh7m9LYdivF7M190+t9vf
	kcO5kqR/9E0yVru3BHaMYNxte4vBydhfITspPY2VnmsvQTVo14ezH3ug
X-Gm-Gg: AYBFou2qtyiUJbydQHpvLrfrytNN3/0A2bRRbtN62vvOT5hpFsTTmjbWRPTkUe2IUzE
	MnpXtjy9eyV7fZHDEfu0tKb/EgKgTlsCu6inryQreoICtyi8vi0IA7QHIWxMOtot7Cv/XJYyPSO
	MYTlh+mwnhWxzzRqghkoeKa5uVodVtt+/+YQsPfbHrbL9KZdjDdXwPzeR1jSFJG11xnpADUsyZI
	2Hsdwe2BYOFX6NzXxlZrI0QqIdMvWac6mHbzG6lFfgmMfKPbm7slWXjjsHyj+gPQNhmdwynJxp7
	jbXGoOBz3zWU6jkMByisAUa7WFU3EbDnhkFlE9yfXFe90ASrC+7l/KyTFpeidexAPrMwLtZibnS
	pigIOW3eLxyK95N4IHFNcnuXgLHpxUphqr7wvE2P+InZZofwBu/4N0YO19M9lsp1S8W6SagLBzJ
	oRh3MAtw2inodNBcP+oJ2v0p3jDZoqi3ZMO7ozAB3q96mf40rvPRFYuEOZnh0=
X-Received: by 2002:a05:6000:2f8a:b0:482:e64d:a1f7 with SMTP id ffacd0b85a97d-48488e0371cmr21537891f8f.11.1788448331284;
        Thu, 03 Sep 2026 08:12:11 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14396587f8f.2.2026.09.03.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:12:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Thu,  3 Sep 2026 16:10:07 +0100
Message-ID: <20260903151007.14832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..9552fadbc17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_dev *dev,
 		err = mt76_connac_mcu_init_download(dev, addr, len, mode);
 		if (err) {
 			dev_err(dev->dev,
-				"The request to dowload PHY firmware failed.\n");
+				"The request to download PHY firmware failed.\n");
 			return err;
 		}
 
-- 
2.55.0

