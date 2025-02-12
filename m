Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48AF1F94D
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374036; cv=none; b=MtksfMTEdS5xOb0lgENo+Ij6TkjJjsH6ezd6Pjz779BiybKaruu3alxhT/FNRbZUOhXcZvhO/TbqaLqMfmVVSkcU2kDkQ0I5e2P2byKpfugdoiB2rYWDzB2pzs8//2S38jVndORdmI+K/M3yVvcdpeac9owKwlGSQPEKVbhUE1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374036; c=relaxed/simple;
	bh=vT8V7lsGJePHRPxn1DhEuL1JPbBPo0A5217Nn0dXSCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bM6QXVFGvRfOix4yLuHVlFCotrARngB+ScN07cwB5zX9vDGHCtJ0kh3gHtyNX4MwrWiG0akd13ZNY8soF4cIfhAM055gobkGplRAc1UkwRQup5MGU9wenemJkSjdjZUwyFzhw7EnUnDWx6LTBbwABuwb4GQretUS2t98mAIOEKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVt0IQ3F; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVt0IQ3F"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso10261564a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739374033; x=1739978833; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+v2zlsZVCTCaFO8Ecu0yqe/8KFXTvc0pR9tUkdrVCUw=;
        b=QVt0IQ3Ft3T0kCZkeUUozt3rj0FoFWoSfRDDmny5D0E7rwGBcb6VeIochAW4QcxtPR
         L1AAAq54QeuB+2Ivwd4/HYiZ6Agv9CsYxwdNptp3t+sZqdqHEKrE2Z/wYc+IOk7Vyc2G
         pAvL8oH5A48OvG6nkOlxjWekw7iT162EuIazbBGk82YiNheSWKMc+YQ0+rRvc01UEDXw
         CLFd5L6Y3uzlcDjKXV7f0rOBJK3Fsdj2kviYSlOAi2MCOFVxgfMBQecIEYlBPeDkC89D
         zK/+brhhq97slXHm5ea+6dH+pKDnpGNLfS02xP4oYyiwPuJKXTe0yhwK1Kcn9lmvRKzR
         PfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374033; x=1739978833;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+v2zlsZVCTCaFO8Ecu0yqe/8KFXTvc0pR9tUkdrVCUw=;
        b=RIfKCSgUmaRLlMtUiDwncBtsNL3HJjEchDbO1eFJLuOIk5xlRTHAS2jB3ccnGFlHB+
         g4y7Fh71DxDKvafDeeKo2bneBM2QOLQt/A2TQnmWiDDFGLmQ1bb/G7b6O+OKw+hIjIDK
         ZpZfor8AvR1U5yuty0RZYOS3ON9KyGoosS+ZYAuPCNsHZdiJbTSzasSUm8e8e+bZNGAZ
         EfNJGo0lOIlHU6Ah2eE2BrLCkSYUnFHI9JK5CPNvRAOFcJeuERRKrv3a2rjizJftbRco
         nUEm5ft2Ww3jcmr/7aLnY+ytXYyu3IJ7HKfJIpBPIjiZC7XLSBJdVneHy/nwAiYv/gVf
         MNoA==
X-Forwarded-Encrypted: i=1; AJvYcCXWmvjHjNfFc2Voyuashe+ciJqX9yJ6W4hYjNZUEVaraq5yvzGYLra+SXpD8JwTtdTP56Rq0fVdCqbhrnxxfHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoT1wU6YLP4JHBv5aAySJykrUCBeDF+lPpXLvlQzoIir3tRbbF
	sRSlhq9tHjOc3r/XAprNr89E/x5grAzo3coe5VcqIgnWm4KJl/3+eKeHm4xe3P3kG5eib3mLnbL
	F
X-Gm-Gg: ASbGncubtzWm/3XNLG9CmvVcE2TOCVSk6igglMtCT3X242N5LYZs8uh2vi1YGjThlpi
	XO0GqJSEolJNRAZbNCgYghiOOPaBVK+YtIjl7ozuKL0CByYI85DAKUqt1m2C6llLofb5TCelfrZ
	kouFz/UVOkX9VnHiPYKXSU4Hhoog4TfrFYiEwuKyWoH280z9KKoZKpHeX7jL6zMlBQA/s46piLG
	VXtmtnt+69h/Nrxdj9NbRmYjdAzqmZquv8Wqi8QLAfWuqTg3D3sxX7kaGOa7zd+SAcywA2p9G3P
	mCMwGMRi6fuOqIiyzlRf
X-Google-Smtp-Source: AGHT+IGudd/dN1L+NiUERa8stm+ICSFlfU46rMuNR2Hncaq6Xkixith7aRyVs5EP4RRtpT5jd1UaqA==
X-Received: by 2002:a17:907:7e97:b0:ab7:b826:d84e with SMTP id a640c23a62f3a-ab7f338113dmr293815266b.17.1739374032574;
        Wed, 12 Feb 2025 07:27:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab78e3e212dsm1122175766b.147.2025.02.12.07.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:27:12 -0800 (PST)
Date: Wed, 12 Feb 2025 18:27:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ice: Fix signedness bug in ice_init_interrupt_scheme()
Message-ID: <14ebc311-6fd6-4b0b-b314-8347c4efd9fc@stanley.mountain>
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
treated as success.  So here the "return -ENOMEM;" is unreachable code.
Check for negatives instead.

Fixes: 79d97b8cf9a8 ("ice: remove splitting MSI-X between features")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/ice/ice_irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_irq.c b/drivers/net/ethernet/intel/ice/ice_irq.c
index cbae3d81f0f1..b1fdad154203 100644
--- a/drivers/net/ethernet/intel/ice/ice_irq.c
+++ b/drivers/net/ethernet/intel/ice/ice_irq.c
@@ -149,7 +149,7 @@ int ice_init_interrupt_scheme(struct ice_pf *pf)
 
 	vectors = pci_alloc_irq_vectors(pf->pdev, pf->msix.min, vectors,
 					PCI_IRQ_MSIX);
-	if (vectors < pf->msix.min)
+	if (vectors < 0)
 		return -ENOMEM;
 
 	ice_init_irq_tracker(pf, pf->msix.max, vectors);
-- 
2.47.2

