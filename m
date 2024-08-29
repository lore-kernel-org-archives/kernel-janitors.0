Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587A41B86EB
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 19:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959373; cv=none; b=BNPe4PRg1RsRve1mQSA/DmYROivrFNLWmWflzYVnfvsmv4Nn26YQN0pLeLq+B/QIw7rk1iqxWJJrHt3QOx0Yd7i6xhhaafbmc8tvuFad6spnxP2ARs7H0rQIXPMgk8Wjm30hXZuWTbe4Fi+FkJ2ZDU4OWevpWr9ALw4Lwi12GHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959373; c=relaxed/simple;
	bh=Rw3/jwjSMxQMbf9n8gdI432rmGXkKg9i02Q3u0710Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fV+Lnkk83A4MOCYdA3+iKRjpkj1w7xzoPji+X+Wj7oTdMEe+/8m7bKEc24DQkuC8FvAU2kae+ZLAxBsqIa3dIkcVaOCtT0u8kuuJloYImkRNv/cnpA6+48G5jccxpjWO7aL5U8ywe/+M5YLRD3mfD/9lVj8i32dXyAeSzT9eOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2t5myCD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2t5myCD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280bca3960so9019335e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 12:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724959370; x=1725564170; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMkm+29lh1erc5fAAFWmKKqMqM4uFrG7ZmX40+JvEqI=;
        b=p2t5myCDmLikM0u0IAPYYIlYwsTm2gEsoi14z470Vlf+1KU9iNMxHA5Yj3tmHyHzm8
         HiT599LvPXnZykalIt4q83iJW99ZvLBNMWAnIpipRrOr7N4u/EZM53xtBwUgtgay5G4y
         1Zxs2cR2/2ZAvqqQSfPHBtECbi/WBvO4JkdpkoJHuRt6q5NB1guRtNL0VpR0n6q2WiOw
         2kr5FmtmO9qUeU/5YDYag2/HohuCi0rH4k5b5QdiKlSJbv+NVqE+uWs2rk6y33PU0tdj
         ZWssi59PaYBLgc3EEKwluewDVHbilW0SC4wHbW2ttKGdykd7tDiKvj+lwy525WMnn6B6
         7RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959370; x=1725564170;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bMkm+29lh1erc5fAAFWmKKqMqM4uFrG7ZmX40+JvEqI=;
        b=BxLwGP5lq4e623YhlYAYa3JscpNK0HRFiBNVyNG+9Pe3MLC6Mj6wTl8A5VhGt6La3s
         ky6vcykL5vUn043Ia5z5rgd7Pxto9RlucVUawDfyJZ1TbWeuC/Chr4vN4c5/tqz2rfB4
         k6sxqP09BjnMnvcQJToibdUiP/Uknsm0Xjjc9WQakS+1t3qzSn5XOpQOvzzkW1OOFKjK
         +h9fMQTKJ+jLZ+K9cjUXIcJvigTy2IbO5hWNqHvyYck8eymeRFl3mQKr4HeF6TM+fvni
         aTaW4C3UFplwzelMQn8a12bMvZ3a5YqQbUdqzycCuzZsRKbme+dFiHn2HarEDKngi5lA
         HVvA==
X-Forwarded-Encrypted: i=1; AJvYcCUaSK8lQZfu+2ULuFEWshUpOw4+fyWUoJKTHALw+hfmnv/bg28MK9DElPB6RiE4m1Q/qX9jAi8lsG1Vlsf6Xss=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt4iMP67+oPLrStBEUgXnYE50UNf755FeViFS8JiHFJvXzA2td
	+uSETiWAl5zqBKlYHOa//rAj3emq2Ke1GxwwpeqTsDxMV1lSuFd0yrPADDWpAEc=
X-Google-Smtp-Source: AGHT+IFLYl4gny5GWtr+JnUznytxaTDe9bdDxbaWEeIcz0+3LIEKDrXH219LvTPhwALagT9PKwLE3g==
X-Received: by 2002:a05:600c:310b:b0:429:a0d:b710 with SMTP id 5b1f17b1804b1-42bb024db40mr31712775e9.12.1724959369673;
        Thu, 29 Aug 2024 12:22:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efafd65sm2124567f8f.93.2024.08.29.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:22:49 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:22:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sasha Neftin <sasha.neftin@intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] igc: Unlock on error in igc_io_resume()
Message-ID: <64a982d3-a2f5-4ef7-ad75-61f6bb1fae24@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call rtnl_unlock() on this error path, before returning.

Fixes: bc23aa949aeb ("igc: Add pcie error handler support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index dfd6c00b4205..0a095cdea4fb 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -7413,6 +7413,7 @@ static void igc_io_resume(struct pci_dev *pdev)
 	rtnl_lock();
 	if (netif_running(netdev)) {
 		if (igc_open(netdev)) {
+			rtnl_unlock();
 			netdev_err(netdev, "igc_open failed after reset\n");
 			return;
 		}
-- 
2.45.2

