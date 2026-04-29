Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF133C1406
	for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 11:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461026; cv=none; b=Nen5j+4f+Clw7nsAYNFFpxYLMkU4xW7mus/xOivdcgK0dyyBjXwPxjiqa+BI2K9BzR1qEWog79tXGIBgIA8VtpfLi/4YRsoRhPeKnZrgP1DKdcjdtPmy80byzRX9NT+qvfnPM+oHkuEbQUGyyoEaJXZxh1W1UhqUcFd2wsAf+VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461026; c=relaxed/simple;
	bh=gV1m5kJaR+4PFhB12dRHn3Hn15UHY/7B+jn/4mKAuac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BENQXXjnP2Qhadb4Tc8We4r4Torqhv9K5f9BZr5Iuao5tu5HU9ozQFulP6fD77Pe7Hs+dAG7dZaTG8OVV69ULtBV1ySumEiCSnSWuyZAyZMrDWt3bR1gyRVG55579VeKK1sWh4E1fflAFixk+1k38g7BTjWa6qanHNjBW+HOWu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOoj3jNL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOoj3jNL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso108788725e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 29 Apr 2026 04:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777461022; x=1778065822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxyPStcojxHgvpxKVMISd/wfgWnS9k+N27aPIWZ+4Kg=;
        b=XOoj3jNLmRDVMYrmdbEF6nzXWv4WDFe6Ozwtzh2/DjABV5c7lMEOg6qPcg85x5ksT3
         akrV1XhaN9W35aaaN26gQH7jkZCVyEAgjM6Lq25Y+e3/WmGbtJuaG1xw/mk3MBErCf1Q
         zbTKeX/8OrpUpmXcwfJw0JY//K+p3MtHY/0++fezff5UulB5GQDsB4Jz3GHgoL9DEi0E
         sYgwTgtOGw9pAsLJ+LhoxpAIeAFYau8IV7chH1+MN36rpSU+wFqM4HAMDKbEh3c6Mau2
         wzsvbtBpYp257mU9l7fyFRLJbTVl4vW+RGMqG6l5EkYKSN7O/akw7cKnfziNit6Wqa4G
         q9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461022; x=1778065822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxyPStcojxHgvpxKVMISd/wfgWnS9k+N27aPIWZ+4Kg=;
        b=caj7dGHHEbmwdlOq4Yft/xkHHWWws4lvqwkCbOn9wfcB95k6VR4plclzIEVOOUWFet
         aF66eaPg8s+1XN7pnoaG0Zil/23BjKnmKATGlAcJsnKR5dhHPjnTrsszv8LmpfO4QbLB
         s9hJA4p4QcTgJNi1G2ub4iCXEun6kKNDZoEuGgYt8wyz0Gsfu74V6sxHJ6EDl9oQ/8wj
         0ZHO5DWhYzDtNRiZWQ8sNZ95hX9XL5Aox9QN7z9Z/Sw/5dSP+Dc5hoj5+9lGR66ZgF2H
         6NzqnbGukKbRf24UtbWEQnj7pK66eX6zmSXetUQb2yX8CsjJJ0HJ0lwcwXsva3R2cdDm
         srsg==
X-Gm-Message-State: AOJu0YyclSft2RMKDc1IGyF12Z6W7ohopEHluVO7EfMC+3WQHzj+OUqC
	Onf5I7o6PvMun/tuscpX5s+PAHd2nEk/CDNbMFjepGUAaGu8rhAnjG/k
X-Gm-Gg: AeBDies9AZa91cR889UGtcZ425iv//KmPPcGEZoDWWl/Ozn1vg7hbF9u4PBZbd2C7aq
	uwZ9seM4JzA48+IH+65dQIhy1d3Oosw4vSW/xE6pmPSAaNdA55UKGABIm//ZwIMUtJPiPAECRQD
	a3K4x/e0PSp1CtKhA/u8FC8kTQyI0y/Hv94plYOAywypRhGNWiCML/zS3+kB2FGCbmnXPAprcQE
	2KJO03Hmq6ulyaeO9xV0gX7CkzdJa6IIzLZEnAOAJ+dpUx2S678NoFkmWjNtOPPIBVrHRKhtwbX
	vcGqJ1NtJDFJqDWi2XijhRRCPdYgX6pAA9tksuRTzFWtZ4khKtdnoyzvfTLpVlw5DuKGelyMZLK
	ACFyXsCY7tmziKOtfAfUVXzaSZ+pHzRIl7y3YhLGo8Mxk3bVLAJWbUVcQqefy01lPi1pQzFXdEb
	TC2PvXIE4iEZZOO9VOifuXhJq8J2PRwoFsxHdxDBwKWodsBcqxpyENtoAacVaemw7GPih7dDO8
X-Received: by 2002:a05:600c:1d0a:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48a77b1e893mr120619325e9.26.1777461021482;
        Wed, 29 Apr 2026 04:10:21 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b3d4843bsm5047744f8f.7.2026.04.29.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 04:10:20 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	error27@gmail.com
Cc: kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix potential speculative cpu oob read
Date: Wed, 29 Apr 2026 13:10:16 +0200
Message-ID: <20260429111016.1260295-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes potential speculative cpu oob read in os_intfs.c by guarding the
index with array_index_nospec.

Fixes smatch warning:
warn: potential spectre issue 'rtw_1d_to_queue' [r]

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---

I can't argue with 100% certainty if this is a real risk. I found the
warning when I was testing out smatch (awesome work on that by the way)
and thought I'd take a look.

I did a quick search on the linux-staging list but couldn't find any
mention of 'spectre'. So as far as I could see it hasn't been brought up
before.

Was unsure if I should prefix this with RFC first.

 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..8eea05111e79 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -347,7 +347,7 @@ static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb,
 	if (pmlmepriv->acm_mask != 0)
 		skb->priority = qos_acm(pmlmepriv->acm_mask, skb->priority);
 
-	return rtw_1d_to_queue[skb->priority];
+	return rtw_1d_to_queue[array_index_nospec(skb->priority, ARRAY_SIZE(rtw_1d_to_queue))];
 }
 
 u16 rtw_recv_select_queue(struct sk_buff *skb)
@@ -374,7 +374,7 @@ u16 rtw_recv_select_queue(struct sk_buff *skb)
 		priority = 0;
 	}
 
-	return rtw_1d_to_queue[priority];
+	return rtw_1d_to_queue[array_index_nospec(priority, ARRAY_SIZE(rtw_1d_to_queue))];
 }
 
 static int rtw_ndev_init(struct net_device *dev)
-- 
2.54.0

