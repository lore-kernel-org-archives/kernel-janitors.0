Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27B184F;
	Mon,  6 Jan 2025 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166768; cv=none; b=Wazpr2TWVnbSHKuFStQMoShn2ruapzh6IPbLRw6f6OAThpHsASvf7Huhc6e0Wvj+fBqYLqoIslFgvIKS/hnGunF3HlraHJx2UeJMvMWmyC6OYVdZXgVyvjKU/hqjbQmxTGdPov1Oi+Cd/Uvkd4yksCOcHKEoTSjossHu6y/Skaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166768; c=relaxed/simple;
	bh=HpMKP8lxswKZvheZr46Y/Xi+ln5kTCqL12SuXGmGgKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HR5yIVWgL+y00oToatrNBpfwIz7FXkjKWDGskO/LPM9ZT3RnNXINd501kSNQbR0rPyQVIQilz04Vn/fdc/wK6T7sTN4Z/P2cHPJ+PH015q+mYRsRlBUCe27KKx57fM45q4wDDV83bBiFh9TnGtp7Al673XtNyBL+iyy1sgq36eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2Pkyzft; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2Pkyzft"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862d6d5765so8392320f8f.3;
        Mon, 06 Jan 2025 04:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166765; x=1736771565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upfVGfLdPJdNaeuDsPkyFwn4zCRADMKLakWk6z1AaQA=;
        b=l2PkyzftDsXVh0PsPfzsUPDJpG5zaPU/PSpjG0orqY7b/yIiYnzSB6e84ErgNc6SHZ
         LmxeJBWuq0pkwxq/KRkf6BGQy4OT/aRka2AhA1cuGDxWIzzQtMu2zQeJf0b9P8s+ao6i
         8xOLdUCG3caIjdMGZMsw/kxPjbceGG7n7pqC8jawfotK8q14UroSnxHps7Hpx5DFTtkQ
         vVYK/B2bj7cgYPtB7U/B8LSFBwLPY6OO2LBAotMV3A+sH2jyNX2/MkQefZK9NITNgDf1
         AFtbINWSB0s1xOPEv4fHmeSbvTXnoLXuDI08l+FjvxtBnFFphhDclNSyEFVbXufSHMO7
         +EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166765; x=1736771565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upfVGfLdPJdNaeuDsPkyFwn4zCRADMKLakWk6z1AaQA=;
        b=aRiPSpt2nh8OL2AEjnfaOcyiqE2RDbltaB3PclzJbW9gxYIx/sfeBZ/Dd+V1DfcJbc
         boWmXD2rMkNBUdCjybvaFUFUwXgOtuEK90CKJtvS8Gk2l8aMntCWdSgG3/Hzz0tzqRCk
         H52GLK4a27TYbusGFGVpd6ZSiyu1RYfxZWmh3IS4tbyo1l0p4alTvyzKUvxOd/FAsv/r
         uztcNby6397d6ynraCMo4rEkFIHvs5/Ai8ZmEoPhcv1hFMMmpXxiqhDJD/3EF1DXV/XJ
         iYPfdRke/BWOsxppHw09PG8JBNakkdbAZbcIv9vLkgL7olb42dS8tTSFJPSMgd932cjv
         C0gw==
X-Forwarded-Encrypted: i=1; AJvYcCV1SxWjVxi8JzP0V1YKIgZipv99UIc3eH8857/aZGco8MZT/m4XXADulslMPnHU3XZ4r33k31PmF9o5dqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3vyhVk5iOi4pznVSeBOf2xLERpo8oi4v4gm4L0rd+h8Z8z8DG
	lICQ3mKVK6FL7N1rIrt1kmoJj8B5v4nMOst2Meocfo4djQZFleUnxt7CQjVx
X-Gm-Gg: ASbGnct5/TZoaFWPA9mWIpz5lboZq0RPrcbSNbRvpzE7C1TR5zz7wc8J/FmAndcfy0H
	eaECoDULykpZQDqu3E9ltQRFiVhhUZTXSKCUwpyIpu4unTwq0C3LvBxH7JYTPN1Yjl3H+aYpwD6
	mDNSkg7tgM3uFj7RG2EEnXTkgXmaKHUURj7b9Xvi508Vm4BRnsgznaM+YJoniE1JC+PHrbKKcCm
	bz6e/wXKxX8+yak/NByuzLu3fKwx5HfZ9yZr8/Jh9tZT5z6EY0KMzQ2PA==
X-Google-Smtp-Source: AGHT+IFHDaK8skA6aFPDNzRbr0ISejolPp/E6ljeVU6QwJwHkWCd6iUzRzsqc3YI9IdZHqatO+xzVg==
X-Received: by 2002:a05:6000:4b06:b0:385:f465:12f8 with SMTP id ffacd0b85a97d-38a223ffb02mr45640499f8f.47.1736166762987;
        Mon, 06 Jan 2025 04:32:42 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b2afsm613683365e9.35.2025.01.06.04.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:32:42 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] powerpc/pseries/vas: Fix typo "mmaping" -> "mmapping"
Date: Mon,  6 Jan 2025 12:32:40 +0000
Message-ID: <20250106123241.161225-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a typo in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/powerpc/platforms/book3s/vas-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 0b6365d85d11..b50d3deada56 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -490,7 +490,7 @@ static void vas_mmap_close(struct vm_area_struct *vma)
 	 * address. So it has to be the same VMA that is getting freed.
 	 */
 	if (WARN_ON(txwin->task_ref.vma != vma)) {
-		pr_err("Invalid paste address mmaping\n");
+		pr_err("Invalid paste address mmapping\n");
 		return;
 	}
 
-- 
2.45.2

