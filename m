Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ACC3D566B
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Aug 2026 09:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785837522; cv=none; b=G3Xv5lspStf/d/SKd10kUfSZXhnY0GJ6eZ/7c2rTjC/IfBIDnk+UbPRKTIBbsBxAhnd1O77lK9biQF97O97xxuDrXk/zqZNyMtSWgdW9RUEeSfI/vkPrG7ckfsiGNxvm5IjrtCpAGi2tziw0S52QcwBmhPyPye5uG211fVYbjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785837522; c=relaxed/simple;
	bh=xIfllDv5AXGp1J2F+PRj8VNMR8wYNazZCRMnO7uPsdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SY1Y+G4kkl+9wKkHeQy5mdq47+YFEBSqVEj0wK1T+dj2rmAhlfOcJoaOmLoWtexvyvkvKdMzHGEDcmSJ9x8VIHS0Aw6IyNG50UwY8ze0BDCk+3KzjGPqx8lehxEuJugTMWxCU/dA9DkTwW7Ioz6DjVl9X2PYKnZTpuxAMCqiMqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4Aqg5DK; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4Aqg5DK"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955de8797cso18667505e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Aug 2026 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785837519; x=1786442319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8iBjzi5EB2WI8WP3SfXRiDKDZBVj5v7DS4s8b6g/jk=;
        b=R4Aqg5DK+Z+sPO/CV2IixvFbn9i3d+OVqOl5K3ExRB/Y3tuR/Iib1Kl/1rU9BOERGZ
         7s15jPHLD1beUhYrHl3khcyRAXYZrQEYNsVpjfh9EmuGDXwl0sVAS4VrGsVz4Qor5MgH
         plpr0HAFg9WdILVjibF9RXsDCjLm0KdpAasp/EUQ2lhQKitP8dqASNA89pVOfGWC91wH
         FacwFuHHECGu0QXRf5FTgeB42/JD1UMrfINzu0RZ9FMtCeKjbPUbTrhID6AvZ3NwYiX5
         1fKRQvNQqAaP3007D4uNdRYb9uIGUEFYwgjdhanoiW31QSGj19OTJJvgdImKP6+B9932
         dYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785837519; x=1786442319;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8iBjzi5EB2WI8WP3SfXRiDKDZBVj5v7DS4s8b6g/jk=;
        b=E3cHZHUN/rAgcIjmcS/vUHO5F5soQaIEQda/ASOv/cH9wkg2PpCor70w+kCFByc+z1
         tm4sisM8TXXGt/x9xfXwPQJawp74wOgRgpRhOG3BRUb06BY1mnbCagaFlMPkbUy/GOWb
         Nd2i6AOg0OXJgxOZo1pBWp0G39ZNbgHLIN8z6RRZKF/umxq6XhXGOPfUA6BWpkR/pwrj
         BREb0UnYo2rYdBg3fKwKKOHNBaLMM1u/Qb8s8wSszX9uo/weFvN4Kz4NQz94duAuln/2
         L6ovDnux7Ynue3HE7BWmvbCBUoiI7Td78k1Usu05ROIzWPLKq/HzMWNNpLc7Q8yVszne
         FYBw==
X-Gm-Message-State: AOJu0YzrwVBlbQov+U47RQESFQ51FtjIuxyra2+70dCZtgr5MuMataiA
	Aho/UHnebxDNMGGKrBx1MR7a++66nW/6H17nm3RjELN3EHwqC9+IEO2X/qvTjnmoDIs=
X-Gm-Gg: AR+sD11ADYA2O2ncw6198mi+nEm3f5h7jkXcJvDcTHfWEobEzDwIadxVCnrtBnHRMln
	k8BrWbtAyTQhAHp1o0s2OF7WF1OXhKZqdeaz0YsH7AA/rd4m7FXCYnj+hZR3KTRROJLmWKbpL+v
	oZptaQhrnkQ2rW/lPIGmuptb9AMb+8DYvoBV7h9drs2GSCIZNDSDTe/WbqruQ7jwg46NORK1HNx
	p6ugMwGGoLg74YLai7CuIrsdgJJREHcHNeoHoyR2mypZxmmYdSCR8B2NIQ1OQqwE4H7jfagQMY3
	xKYUFYcyxUkR93ruigpSlOYNeEdFoIpQxGYF13I9rO3GResGyULMpG79rN7JfELDa7rkQGxLRPA
	ZI8shGctMCM5yBXHYwL8sDz2ICIsOK7+phtu2UzFvIcplwaazOMugLY9PQ5ls/N9WIu+sphD8Gk
	9/kGWdNrkw9BSeCJB17NzCnFJbnUr2wgsw+8stsnV5PxGXMsK4IYVFfnrdSWY=
X-Received: by 2002:a05:600c:524a:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4980eb5cb45mr288946725e9.6.1785837519077;
        Tue, 04 Aug 2026 02:58:39 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807eb12c5sm186540075e9.3.2026.08.04.02.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 02:58:38 -0700 (PDT)
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
	hlinux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Tue,  4 Aug 2026 10:56:48 +0100
Message-ID: <20260804095648.783881-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
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
2.53.0

