Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6652BA2D
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Feb 2025 06:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739428308; cv=none; b=Vcl8VT4HX7tXr5+TQ4msPphSDQlYqA+hpEgAidfklkaSalgxPWIH694VtNHHKHgtKfvlJHuNQ+jvqzLT+dtN5QL1GKUZ3NlcDL2ilLUI9NZLdfJOyFepkM9HaP2T555AeXWOT6Wpuz5B6r8PjxhYTO0mfUFzLDp8fe8fuoHogRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739428308; c=relaxed/simple;
	bh=TSm+EhFKzQ+nmagJ+NpWIUWkYFzwrLV6u54VSh1bzrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DG2x8MLnelKOhQ3HOCVm5IYtj131loIZjQoIM5U8BjJhC6PPG00Rmvyx6Y6eEco3rM50wgrMycivgiwx/LTYDueezOG79diiWQh2bFDaZ7RJKUGe1GtwTtqtFkgAQniyqrTKO3q8vRS4A7Cs9yxY3PxsDTeOPMOV+PKDpyCAJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zui295ws; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zui295ws"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso777355a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 22:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739428305; x=1740033105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lN2Y2nwgj5zUTnrECdXbocmCWoXI6GrsrPx3j3TC4Yk=;
        b=Zui295ws93WTTPWNXD2buqZj+h98nk+ZKUPjjReH3vwTsDjRZFMZaPwPQvLSajTiAv
         JomKw74jFwMnPz+dAqvKkttjodB+baMP561AxOryUtrehw1zJ5Ob7FWWXjntnpafstFl
         LwUdkCM42isIwRjdXWN4HXNtIFZkkurnx0RDkZCES+iKm91ZigthbRK4EN2v5Axlidv7
         d/onpbbgPaR7JgnRHljLL7ZEPaegRCdEgpdUk2e+9K6cLG1NV50qXh/rLGsmekTlE57s
         Pk8DV2sqWghxRxh+2bB1YgDdM2Sl76O0cdbu6W2vOGJcy6aFhy6xByfnWxmCMp9zOdcM
         xpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739428305; x=1740033105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lN2Y2nwgj5zUTnrECdXbocmCWoXI6GrsrPx3j3TC4Yk=;
        b=Ji4AHc+wH+KG+kcnHwzDSoXlwwqAw7ZBmutqbUnwpXuvX2Okc6vcdeTiqtmdhkFk5Y
         FshN/9c8R00vCzWj5pu0tI8QbD40MDJlF3Qt8wOMHRLigg0II69uvreFcfoQ+MjKCsGu
         b/uSi03gbhqxHjEUU8z8mLE0OmegMoCra+YzPxKkr07IodGSNaB6J3hdUISu8DM14maQ
         C3BOh1GBWeYAk2TLxa95TPfLlaWULm8eKeJ4nuRY6ORVpdokEkOOjIsCZRVOSwy3Dz5T
         y1s1AN+1FLk5txg1Xxd+zPI+hvdvVFMZR2pkZ16lmtbNEfSWTd7JtHrPWuMpSmBlkLa6
         wP+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoV96Hik7UTTxsjmiMYGsQqHZ9wGI+0AEaHxhkqmE2bnZ1ETrg8G2rCyVoeio7NAqDzn7H8WTb2ydcMP59n/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXslbRkhOQaMoMT9n4P3A7qVh55PpUaBnN1ecEgxeXrEwdj0b
	OAvIDtdKXgFH6dzFNIVqi8f/0gCX5qHELgWjIsBBtcmtlQfWH3axawKGC9XEdno=
X-Gm-Gg: ASbGncsre/JSmtP3yJCbF2hgqBchcALTppUm8P3fnUwEpgUhMHAKmt3UXRDWVawPZoH
	gp5Q4KWBw5LZKNCGbQBPBmJD4SMkwbHY7gayCio+srZ+xG9xU3wx4YdctpSEwu024ofWCIsNVnt
	VMefCPjCW5mv4c4QHBFfJvRh21Q+uSivye+7gCkVbPWEr0pgqyYuZuAb9mThiudwqBAF0EkcuBz
	WzQanuKji9ly5CLdpQUjJyEj2XAr5ZApRuMyw+Y5WDSOwq9X6z+1JNDwN36vin6bOVrARzZNgjX
	iP4OcGWWEyDiSj7bng7x
X-Google-Smtp-Source: AGHT+IF4GmQVmoYV3tMifs3xYxMEmFp8h++H06hQyM0sB214aBjWO3g4Ojs0FH/d8ojvyeWMu3n5Fg==
X-Received: by 2002:a05:6402:5d1:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5dec9d326b0mr1910867a12.7.1739428305096;
        Wed, 12 Feb 2025 22:31:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2880e1sm596423a12.76.2025.02.12.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 22:31:44 -0800 (PST)
Date: Thu, 13 Feb 2025 09:31:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net-next] ice: Fix signedness bug in
 ice_init_interrupt_scheme()
Message-ID: <b16e4f01-4c85-46e2-b602-fce529293559@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If pci_alloc_irq_vectors() can't allocate the minimum number of vectors
then it returns -ENOSPC so there is no need to check for that in the
caller.  In fact, because pf->msix.min is an unsigned int, it means that
any negative error codes are type promoted to high positive values and
treated as success.  So here, the "return -ENOMEM;" is unreachable code.
Check for negatives instead.

Now that we're only dealing with error codes, it's easier to propagate
the error code from pci_alloc_irq_vectors() instead of hardcoding
-ENOMEM.

Fixes: 79d97b8cf9a8 ("ice: remove splitting MSI-X between features")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Fix my scripts to say [PATCH net-next]
    Propagate the error code.

 drivers/net/ethernet/intel/ice/ice_irq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_irq.c b/drivers/net/ethernet/intel/ice/ice_irq.c
index cbae3d81f0f1..30801fd375f0 100644
--- a/drivers/net/ethernet/intel/ice/ice_irq.c
+++ b/drivers/net/ethernet/intel/ice/ice_irq.c
@@ -149,8 +149,8 @@ int ice_init_interrupt_scheme(struct ice_pf *pf)
 
 	vectors = pci_alloc_irq_vectors(pf->pdev, pf->msix.min, vectors,
 					PCI_IRQ_MSIX);
-	if (vectors < pf->msix.min)
-		return -ENOMEM;
+	if (vectors < 0)
+		return vectors;
 
 	ice_init_irq_tracker(pf, pf->msix.max, vectors);
 
-- 
2.47.2

