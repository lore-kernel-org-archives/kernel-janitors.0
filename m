Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15FB298CDE
	for <kernel-janitors@vger.kernel.org>; Wed,  8 Oct 2025 15:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759936146; cv=none; b=Flg7BUOaeGSyF5b7U8OEuHnozQfWYxJ9v3Eg/D2286W7uY9esaV1Bng13l/kj4ZuCm81GIhPZGgZR4qmYie+ksEviYcHSjLZsN5iW2H/LhLMtgZB48AwbOx7zQS9z6mTZB3wshN5jq7vtpyBPtdtkSlsVlzGWxatYXToo35MB8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759936146; c=relaxed/simple;
	bh=1K+mZHhUUT08Buqc1WIo7B/dy9RfBBDC35AAmiVX12c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m4Mj1DtpobVe20j5V0tjSHQS+yB+t3V49WNWPq8DX5uIeGe2+k5+JsgRTabk2K8oebzT6Ah+EBQq2TrtnMh1binc+X2g0OW8y34ulXlgi9xhLHB4+mesZUBDltMdhixW7jVkw2PmCIusVzBTeL07Xd74lcA+MNpZp3YtjkQ/21I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mI03c5Fy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mI03c5Fy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso15117f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759936142; x=1760540942; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Lsv/v4r6+foGJWr+qrH8p2k9rjZsdGH+FPsXAlrkVQ=;
        b=mI03c5FyBkiUk2gVEx+fgak9+cVGldj/HtkrA540CoKE3m0m5NRX5kvSbwN80sGbAf
         KhvWqYI0G4Qax0E4sqGApnMAXK9MTQaV4BjDztbMPtt3dtdvby/pda4dPBbgitisniPC
         3qXXO2tQC5uufYxsSrnsCe1Iu4MR2NJCUj/sE/vPxci4lbxiBWDtvBD0H8iUajnYQOoA
         wshAese0+/HFGjHL9kiBi6MV9BkRXKR7WfJGNQ3dgjsflrOxNCa5eRvNFDPfcMb0Jb97
         UsOdPYWkSmSwev9urvcwEQrbTAncqCr0k8nELaAq9ozoUB4gSM2WwOAW/2g3EAT57235
         Jt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759936142; x=1760540942;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Lsv/v4r6+foGJWr+qrH8p2k9rjZsdGH+FPsXAlrkVQ=;
        b=icNt6sLPaC9jcw3Z2U7rdKIQsR1DK3UZDv4UgS3e8CqZo1zH4dTpZB3Y51QxKCpAF0
         YOlDxr/WLfVCH++MAk4wLHfcxuswQokRG0SsBwM/ZYm3lguQF3zD31jP2CRQfijWZO3x
         mBpMPWesFxB4NCEkIxh73sE9nmmedHG+5eudcV02xuVnjBs+DpOSzL5dZ8//q5HJd1lt
         bKgJ/qpBe2pD/N5mffR59neGkmPBHWj0+/Xce0cZP34PcyM6G7Q56Xwjkl79oo3qaRz1
         0jHml2vJsP6/0H5zEOOWbIl+5tSQmKmv0g0i+cYhgGLUFf2XFhlXc0HY4rl/VqRTZMk0
         hNHA==
X-Forwarded-Encrypted: i=1; AJvYcCWep7p10u3CPLNfV7GUM1Ulux9HJfxDiPSV7BYhbossrrWarb8X7JxI7lRjinPejXxZLOAcxHX2rO5X7YrfLpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzanHZOmRreOK+s6Ww12C3lUHWTjX+/PVFXuPf2561VX2YQ697D
	LajLUjARTgECIodIfNvlk9+3kVwiV0n961PJ2Zpy2kqo2QgEzG8D1F8TrfqQ5H1EpsU=
X-Gm-Gg: ASbGncsojauPSR+VVRZ58j/z3sVQePuhWuEkYf/ii33u4WbvOOYqbaW2hqUZhRXIBI0
	nikxdtNtzQkmp9pwCP6WEVL3qy6gHAgxtp+dtsyPbgKp7tXgfBLlHv+GaR+tJWCk0w0alKyAQUa
	3PquhaXKSYuBaoUrhfXMEZGfyPlFk3CRHsw6Yrnw9RQFIKzxNNWYHiwv3yDDUA27mI9i2NM0OJ7
	8Xe5JJs1my8pbHcHhEZOb1vwaT6KIgyrLjskoBPhVKnNl31s5iBrEsIDEV4hfNkkGtAktpGB6TA
	0xEvNk2FtOE29LOdjWhrZ8DWxwnyCAb5/RGpABD5jgzq21seyKIPUaZN8Iwee47oJRu82UZbRGy
	GHPuDl/QESXbfBR47OmrpntGwue+Nk55Ou8QzraaCeI71aBJI4AN9qcbd
X-Google-Smtp-Source: AGHT+IHYVsHAe0/w87MtOEqTgFE1mT/tsUBsMdlVHgFGbcOBnMrbBTOagFPDRArfyaH2aIEMb5EBvA==
X-Received: by 2002:a05:6000:2c0c:b0:3f1:5bdd:190a with SMTP id ffacd0b85a97d-42666ac3a16mr2508780f8f.3.1759936142001;
        Wed, 08 Oct 2025 08:09:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d869d50sm31248166f8f.0.2025.10.08.08.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:09:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:08:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qu Wenruo <wqu@suse.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Filipe Manana <fdmanana@suse.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] btrfs: tree-checker: Fix bounds check in check_inode_extref()
Message-ID: <aOZ-inc8o7T63QHT@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The parentheses for the unlikely() annotation were put in the wrong
place so it means that the condition is basically never true and the
bounds checking is skipped.

Fixes: aab9458b9f00 ("btrfs: tree-checker: add inode extref checks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/btrfs/tree-checker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index ca30b15ea452..c10b4c242acf 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -1797,7 +1797,7 @@ static int check_inode_extref(struct extent_buffer *leaf,
 		struct btrfs_inode_extref *extref = (struct btrfs_inode_extref *)ptr;
 		u16 namelen;
 
-		if (unlikely(ptr + sizeof(*extref)) > end) {
+		if (unlikely(ptr + sizeof(*extref) > end)) {
 			inode_ref_err(leaf, slot,
 			"inode extref overflow, ptr %lu end %lu inode_extref size %zu",
 				      ptr, end, sizeof(*extref));
-- 
2.51.0

