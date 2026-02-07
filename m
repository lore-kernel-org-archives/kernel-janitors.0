Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D45B2FE04D
	for <kernel-janitors@vger.kernel.org>; Sat,  7 Feb 2026 18:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770487782; cv=none; b=I765DhxBqA4CIc98T/t995cxdoNe3a7FdRIvSPY3uSzptRMRfeo0cf0xIJ1YhSBPgo1vlFDLwPtr3mVABZ6mMmNglhpV285T9ZbnYfFi88R+QHuI9kxA8WR9ZhtbRypFTIuJ6DUnEox89Zc283DHnq2AsuF5I36QF97BvgCadYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770487782; c=relaxed/simple;
	bh=YMcozkzavzq/vRR+hPbU4PkZPFq5cvGjVzhMq+Jfs3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5o23q0uk21j48KmHXGA889il9ik4nGPxp8cwtE7Zl8kPt8D53LNH3BeIKmRsA6f11hadAeLbTTn0iEJC40cEN5yz21LyWPo6xPX6MgVz77nGoX/df4EFeR48o3VViREYHiyDI8aJBxDR43YH9DqeEDiwASBDjn1ITd2N8dEjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1oZANck; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1oZANck"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so1464997b3a.0
        for <kernel-janitors@vger.kernel.org>; Sat, 07 Feb 2026 10:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770487782; x=1771092582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi3dBYAOQpag2SqBlEBdCBTcznYDIdkXa0divGaYQ+c=;
        b=W1oZANckTHqT1Au0+N0L1L549i9SxZjuus2bqUwU8+LBGPbI0gg+JRwmFX+HyDEDag
         2qVT6zJygwCxSR4IirlATE56oE0ceHiIzQiSs5Jq8u3YwUvSdSkrEES+0ghPHxP5F+JF
         MzXIN4JRdTjLBYuv3xPTisNwnfvP7yZ73hy5SJ66POhob13KxA97H9+rdN1loVt/dlVF
         Uyoa8Fyb6f8ynwh84FI3RyesXV4N+n15FKL1PDqD+sOZ7khZOVogbQXMTHBin0XTFMaW
         ygp/VnozHjIjWVGqq3XO/zumVYj+JoCCh0bSe47R3E6VUfdgVqZmMzzjQKWtH516PXJ0
         4i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770487782; x=1771092582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vi3dBYAOQpag2SqBlEBdCBTcznYDIdkXa0divGaYQ+c=;
        b=FZ9CVFJJIoM2uDMcywnG3c7sB9l1W+erZqUQICofNcfIWf2o1vpoidAadNQdnt/paC
         FRNuAGI0CyS4orB28AOIJCGD/+bFm08nTk5OIVIET6/Nf2L6xlyjuxfphe1Y9ZVSCLNE
         QoTKJCDFhBUMWB3ldiAp6ZIoL94BUXZBRjSvqP0WqaI23HYC10M4lOOX7whQuQ9s6vCj
         p2lLPY3FhjfDl4KYGmtfRJwN3vTWo7nKd6WDBUy/pzCGqNlp/XtCjIpnCPGudr7SUXig
         daYNYXAiTyF3EyV+CEdUAJeMzx3ppNauJamzX8mCoJgSSz3PPG5lCgmO5xyt3RDQ9FTU
         4AbA==
X-Forwarded-Encrypted: i=1; AJvYcCVBLIiTwf49DA8k7KiQIQ5ZVWiPu+TFOewYTzldZTd7iVf6GaLQa+ARVTlk+AUTZp+vFnnh1kFGMteb00JeKxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfQFef5agEsqA+obe0W9OyDn9K7fNPtb9slTnAQXrkufuEsN6
	QQC2hFhO/egs/V1SuF6apWyIVdxGZkQnvnEih8dTQhbm6MJMu0tfWhEY
X-Gm-Gg: AZuq6aLWDFANm4HPKH7c2OQ/7LkL7GR+32Usm9ONp+tt5xuk2fOYyCR+iJ9LpY5M7OZ
	NfJ81auzx+bLO9H8bDFsfqTQlSDJljA/Qlkl8X0rB95w4kGx+VSnRxOT5mYMjK/C0FzZZVs+RKJ
	DHhnlBuANVWf/nDRunweSzS1WrmxAg65+I7ZMHWTueBp06BUOferg8oerc67rCnbZLH+C5exJRo
	6Czuh7VkpmfqXAmHygvvZDbx+EH7s9OUOq4NlgAlyQtZIls7rE+1b8VaebVDfGmGV4U4KcYi52a
	md84vnh6EEtKfnYTZJ+He/3I3ojzc+fgdkcKIP7Tx7v/LdQVGGUan1wvo2Qi1HFBDKIAqyTnkfn
	2ahtHFcer1TrAZ8jAHo1OfLlkaoWiuL1gyyysH7bcQOikOSws5ojOwSf1VS6oJ7nqfi2Le0L7Kn
	RoBtyOjFp2xJKDN+U=
X-Received: by 2002:a05:6a21:386:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-393ad024582mr7510828637.36.1770487781559;
        Sat, 07 Feb 2026 10:09:41 -0800 (PST)
Received: from HPVictus15 ([2401:4900:1cb0:866:c04:9480:d53b:b35e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9d415sm61316985ad.42.2026.02.07.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 10:09:41 -0800 (PST)
From: Sajja Easwar Sai <eshwarsajja20@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	iryuken@duck.com,
	kernel-janitors@vger.kernel.org,
	Sajja Easwar Sai <eshwarsajja20@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove hardcoded dead debug code
Date: Sat,  7 Feb 2026 23:39:34 +0530
Message-ID: <20260207180934.73593-1-eshwarsajja20@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debug code is guarded by a constant false condition and is never
executed. Remove it to simplify the code. This also removes the now
unused variable 'pattrib'.

Signed-off-by: Sajja Easwar Sai <eshwarsajja20@gmail.com>
---
v3:
 - Removed incorrect Reported-by and Closes tags.
 - Fixed name casing in Signed-off-by to use Title Case.
 - Added blank line before return statement.
 - Included this version history.

v2:
 - Fixed build warnings found in v1.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa..b61841bf1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,14 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
 
 	return _SUCCESS;
 }
-- 
2.53.0
