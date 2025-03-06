Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125FB20AF67
	for <kernel-janitors@vger.kernel.org>; Thu,  6 Mar 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254008; cv=none; b=fH3eCQTOQdJnaU3dmFx8YxTWlBSfRtkWLiEDmq4H7A9mtwcXO6scdoIQjnC1YrX4hV1EXNfHRTgWO03js8Ksrj0MZRpu4AKNrBD5G4/eMBnQ9TNj207cFsVZsN6fL4oaZi23RbDQ3B/6aZSudVOIJwT01CYRlcvXxtbbJnLa1CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254008; c=relaxed/simple;
	bh=E/HLOCPPolZoPIVQBIEbh+eA5DoNHzTGqfwY2lcY4Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YX3p4ZHAYk0Zw5C1IzJY8zoyk8kL3pKVJhrST12DieBY3j0HbXZrfccuK5bVWmK7ScqO74YgPvM9q5nsM3mbPfez+LCqoTvXdE5NPzdXCjU2+6m4OuuNgHgP3Mu6HeWNWautntpseybT5KJo56TB+JObCtZ3CXB+VUZYFzNSf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXPt/AWs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXPt/AWs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so3473235e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 06 Mar 2025 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741254005; x=1741858805; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oWy06ZU1rvCMAS6Oepxaxa7BjLic+0Q37gto1sXjZ9k=;
        b=rXPt/AWsMZ0Il8KwOaVhoEFc4GfGV0PlcibBlNgGO8c4PeQTmcI4FydM2T4nZuHwU0
         9yfK6GPrOXOL7NeREfkRq84YyBdkbt4Mnd6QpmUzQB5JXOAWvt2pXbz9o5GMe10R+B8t
         awnw1wtMZcLvBfml957K2H8SN9viqEMbSooyLzH4+q4hT3dzGT+eSaQ7dtzgnf6wI9FC
         H6hHvOQtsztSLIpk/Cn2Qg/cI1aBqYQ9FfBz3Fk9maxhESDNVfbeauXWzCPxQ//h9VkE
         6+YHJMQheYgzqK3G40qg4q/lhwu8Jb4vmSOJbm7vwoXD8C4lZMNmtmxVnz2NmEoV6kYt
         Pu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741254005; x=1741858805;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oWy06ZU1rvCMAS6Oepxaxa7BjLic+0Q37gto1sXjZ9k=;
        b=Z00o9MojREHqaNdzm9rxmPiwub9JGCTFmJoupYVFvIf75hiuLbJpa57zBSLg9ZZSfH
         fslMIMrpAqxFEzukbeIF8P3pZUEUFDfzvVHSwpMpdSSixhErKCyQin5Es3mC5LhUXuDz
         +043L88oYy1aa8paQb8HlAsAfmUWT08Sqgam7v3JyPMNWdpC7FvrMnW7aMqlpPPdAugV
         MJln4VdZrscf8CWiZYzv5WXqWPywIqARK+aLEGsfdu2CSGQoxFkS/jr7N3UAFRVDlgMF
         DrqHLlbAnEkZLDYTVvGG893iUZNBuYKtuFXnjjIDWYt+Sx9vKSRYtEENhAkrQdFfAUHU
         V7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW0ZPmlmNLEzHim4n+C+eGAA5ClOPKbcjSD2Ux0gQdVEt+85LPPSOJU3tIzhRveeg1NVkkHl8rVdOM5x1ybVDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkdrIQ0F27pHRPknZrrUc0QdJkzd6IwuwCAh+hlaFnfi7JOrW
	P5eAPl7qevknA6x63nL/IwKK5gdC2anjZhRe+qyudHTsIcTOHVporophP5Lqo9Q=
X-Gm-Gg: ASbGnctO3MzpO5TQW9Yr/Gii43yKauuJDXKUu0IY7PwV2alldOnboMkrdRqv0K2/2rG
	M+lZq5M4dVcxNpl5MgyovoL+G900MYN5xl7KqNqLM2m/IzfLtHejNuptgpCJQDNC/5aHp+3jf43
	2JWn9eqAT5nxOjHfgKB0QqNbhTyazHuSaIkYYzO4edndR+TCRaimZ4oNXuI556n9FgQIREwRsE+
	YNH+tGoFwvewyfRKvZhDHBnAT9UNew+fvCTzaw/whisaPjTIEqlHFyC+3p5Uq5DStuSfQFRldmL
	XDtujDCX9Kzebo5aOaamQdPTn9nVWyM+GFvz8j+fVaRnHvFrew==
X-Google-Smtp-Source: AGHT+IGuGJLNcho++arjKdFrJpv00rKH3wDvZRWW3PMXVOeUD58q0a3r8mqAyfvuFDAa6Dfhm44YnA==
X-Received: by 2002:a05:600c:3ba8:b0:43b:cd0d:944f with SMTP id 5b1f17b1804b1-43bd2945f10mr63350985e9.5.1741254005165;
        Thu, 06 Mar 2025 01:40:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd4293250sm43986635e9.16.2025.03.06.01.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 01:40:04 -0800 (PST)
Date: Thu, 6 Mar 2025 12:40:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: spi-qpic-snand: Fix ECC_CFG_ECC_DISABLE shift in
 qcom_spi_read_last_cw()
Message-ID: <2f4b0a0b-2c03-41c0-8a4a-3d789a83832d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ECC_CFG_ECC_DISABLE define is BIT(0).  It's supposed to be used
directly instead of used as a shifter.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-qpic-snand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 8c413a6a5152..ffb2b6ec685c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -514,7 +514,7 @@ static int qcom_spi_read_last_cw(struct qcom_nand_controller *snandc,
 	cfg0 = (ecc_cfg->cfg0_raw & ~(7U << CW_PER_PAGE)) |
 		0 << CW_PER_PAGE;
 	cfg1 = ecc_cfg->cfg1_raw;
-	ecc_bch_cfg = 1 << ECC_CFG_ECC_DISABLE;
+	ecc_bch_cfg = ECC_CFG_ECC_DISABLE;
 
 	snandc->regs->cmd = snandc->qspi->cmd;
 	snandc->regs->cfg0 = cpu_to_le32(cfg0);
-- 
2.47.2

