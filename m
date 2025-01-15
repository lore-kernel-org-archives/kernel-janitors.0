Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247435961
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Jan 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736924099; cv=none; b=bnqs2TQFVIxJypyKKvAcxIehyKhwUIuIQe6/2FD3Mvp709Pa0LM14NiexNP1msz33KP937vLwfQRXhpPAGRixEUniMrTP5Ar+tl8ddsg91C+CAbt8BBkpjEOvxIhT9hEe5Zhikk/962m2RWE40e3jCGW7iJEoqWHp/p558NNUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736924099; c=relaxed/simple;
	bh=2hqRIoY/uCa1uHU7XkHKh0fl4illlMY9ijCtuFlFpQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4e7/jrQtqwQuoqmaqPLgdNRGEla7J+6+ZjIkOLR30NtZvO1vyKc3Yp2c+0Z8vTfJFag03By/Ep6XYBNxMIYW+ljzqsqRX7bKwVSb6cdnmOSt80W00VGxnNp2uCD2QKFenLlfAOkA9pCcDPSCGHyfMOjuwCKalUnQv0DlIo01Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KdXJf7XT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KdXJf7XT"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso11162322a12.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jan 2025 22:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736924096; x=1737528896; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A14TTUSHGw4Tfxp9OI9Y9Uf9engfooD8uv0pvFJOHmU=;
        b=KdXJf7XT7BseuGPvWDbmh5GorsEQkgP6+xi3a3D21B1X2+K40LifMHhuDZaLhLZ6UL
         V6msnLDV4F3kfhjnlgX6sr8fEBEW579ToaqOR1nJN1/qKqZDzU4eCHwSw0qik/MHainD
         QzixbconOl2MYl0wxesurzI+w51LgLxnWSfeYFmh9MbSLmkTE4nykeQPZujnn+6CPPpI
         6gBGh1fVEs/k2+a/UqLm9pDIiIXWmu/LX5dhkRCJEskfg0/X7Y6QzKXetoTxZ9bmwdzK
         82tBECi+vJ6NOV48Sw/iZxXvHHyRnWoHNZQpuOWjLGgCt6InyLc2IacGwNBnsHR3kebc
         PHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736924096; x=1737528896;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A14TTUSHGw4Tfxp9OI9Y9Uf9engfooD8uv0pvFJOHmU=;
        b=TLUeXuRM3MGPxWGUIlHAvdbGSrUNKknexlHraqPXb2+pBTcJz0+HTYc1KCV8pLjt/L
         3Ni/i5aDy0B9FO5YC3BVbHtFg1FIQ2uElLYEUQ0tcSh4rulH16VW9gb/qbRtGRB3YGpH
         Ym4Nbxd7BuHtzYmGijs8JHfO8a80BcGgbJrjkQGW25FTN/AeHvhD6lEC0oUwtsPT/68P
         uXAIkist/hrcmXSBFkmTe47UMVFAV+nqfTceo/p7zfs1T2ulJjD0oWjp47cOg/CdlriJ
         rbyDKPKQuNoKYiLuuS0+3s6x9Dad5uHFk2r9U8GgBXfZypaYdhqknyt9zSZX3SmD+a4M
         17jA==
X-Forwarded-Encrypted: i=1; AJvYcCX1qneNieHuTNrxXxrhUrYfOa04I8lLE3w3yMdESUOyg4aRGlSSMKx/dZINRdrMlnEu4uQ/jJcoEvdpV5r0VHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7NtuBfh7Rvdgjp6xWyCa2q5KyZKLSVzPBUi2U7fkbs5NafKc+
	TzR/jmGlCfyDvnT9o57/ScU/ZaHVxVSJ0hh1B+JfE8pl5G0O99Z4E4bzu54UlNM=
X-Gm-Gg: ASbGnctv+H9LDMrziYkByBEK7Uj96NIV5y78yeAfJJIlM4RzF0ZRvQyQV75PMR0GqqR
	F1VkIv9Nf4zvpG9jfCOpW/tAzT9iTMcQUCJhPVvcaOoJ6JhGNiQ6HXaPtmHrF4O25adxg4fEHCZ
	5bcSIRIyQyD6gVSSCVvQhSqum704pjcWO/EkAtNAHUEbJk7RypHHxsUJ8w14kazK1SLBLgC9ecd
	BNrNQxt7i7NKkmY5pIEJ9jpyFE8a4aYs6Z0KYTU4rcG8M8YIonWiRKmTy4Jmg==
X-Google-Smtp-Source: AGHT+IFmiPuMZjPhxJLXqB5h+XMs4bPD14TM+r5B+xxJIUUnoehpVx/Zz1fbrRY62nYEzYYJ1Ozb5A==
X-Received: by 2002:a05:6402:2105:b0:5d0:bf27:ef8a with SMTP id 4fb4d7f45d1cf-5d972e4eeb6mr25432395a12.26.1736924096059;
        Tue, 14 Jan 2025 22:54:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046a195sm6811700a12.57.2025.01.14.22.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:54:55 -0800 (PST)
Date: Wed, 15 Jan 2025 09:54:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilan Peer <ilan.peer@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] wifi: mac80211: fix memory leak in
 ieee80211_mgd_assoc_ml_reconf()
Message-ID: <7ad826a7-7651-48e7-9589-7d2dc17417c2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Free the "data" allocation before returning on this error path.

Fixes: 36e05b0b8390 ("wifi: mac80211: Support dynamic link addition and removal")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/mac80211/mlme.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 0d3f64eb573e..f8d52b3b0d0e 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -10273,8 +10273,10 @@ int ieee80211_mgd_assoc_ml_reconf(struct ieee80211_sub_if_data *sdata,
 	 * on which the request was received.
 	 */
 	skb = ieee80211_build_ml_reconf_req(sdata, data, rem_links);
-	if (!skb)
-		return -ENOMEM;
+	if (!skb) {
+		err = -ENOMEM;
+		goto err_free;
+	}
 
 	if (rem_links) {
 		u16 new_dormant_links = sdata->vif.dormant_links & ~rem_links;
-- 
2.45.2

