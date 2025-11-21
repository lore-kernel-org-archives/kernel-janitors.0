Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E6347BC9
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732117; cv=none; b=CnPl38gbdKZGfu6i4uXO2QMbw4a0r/SHasnzD4T97lS/7di4ZZFIBI6Y5bfvlfQqMFy+Br1IfT8HVRgVmoLK0PXiVBPxBXRKB9soA91buFnobqfl4I+yoVC6y7Oc+bAsvtMX7LiUtAkIUj/U5gWw2qk/li1UsxrT57KUz6n86UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732117; c=relaxed/simple;
	bh=KXv9/DU644cIIz1nqtNrSpWhbnBLfejEZSSzjDiMVVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugeGRP+duSceRGcCwQHUYxGe0TbWAy6+RjgZaVXhNjCQgLJkoPmCCM5KbHvtT7iAyEPNTrFnYgEYV+WIkhdnvK7cRh2Usx/rjdlKwnquN/5JJ8o4LGv27hyUHuxI4QBguvznrSG3htQadUC1otK882ripw+CmSG9t5bjzLpMjss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ogEdLPAA; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ogEdLPAA"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b31507ed8so1755738f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732114; x=1764336914; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTowRJGcYg0HhmMoZiyqiMQ9fvsrn/LxONuXHhgGuGM=;
        b=ogEdLPAAW3Me4+lGFwwc5FfctRL+4g6qHDC6g5zT1/2vLHFh8hAaLpOMFZLVdZi4my
         p3KX3FfHF5wcGgg8fGtJYiFXD9liu4S7lsyws1FZgPcGNKMycC7hesbhinCm6DAf2ogC
         8uze+sF6M3pwGpDkWBsiYK2kTwcqyp6IUJ8tRGjghmP3MtDdQgkg4KFMEck97qzy2Y+d
         WZrska0qz50eL/ZuzurG0ptkBSc3V41RqY9x8qbAEfh64sYuYNpAcL6uAfKGPzVK605i
         1ZvTXmj692vnQmLACXTfWb5X9AhZUi3DVzkNCqLqDmT1xwCvuoa0NBFdyq36wlZcxQF4
         2wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732114; x=1764336914;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTowRJGcYg0HhmMoZiyqiMQ9fvsrn/LxONuXHhgGuGM=;
        b=CaMX403OQRFKbAtDm48pONKBqrcCa7DYkBeTOTmhD9S/6T8OXjBUoywzgtsme9YA/Q
         2Wbra9mWP3gAyZpJLIClxJ0HRxKuInXuKIOAkmIidjXyGiIO26jKc/vooYakQWWdOACO
         DvDp/Rz6R/qb6DlqbwlljyodanBAuZHZUeu0+IG6VptTxHU1TfMjLwzTX75yQwoLR+ql
         HdVmXzwj2A3NUWMccIhiT/2z9Bx70cpegMeXLkEM4XZ1ssyttNDrwEjB5kfBMYhmMf6R
         lIFrNi/9c2ykB3OE9xp+t+UCdMubhQhzi8pKhqQEo4M8Ii8kvvL4A/7gPvf87V7kaiu+
         pcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4XNVEGXvxwlY6tVbC7UKAoxxPP3+CV6sQRp6UZynbVRww+3MUZ+0rb1bMAepbUcjVTtfiJ2lqtQTdEoqsbkE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcONA8tkXk/W02psTsdLOPpVfPGrYhadkObad5R+V72McE8oTz
	Jsn979bmicD3b019lFNsYCv/sgCxOlvFf23AahWhwvAkwbKb21Bi0BpGnIkVe5O2TWk=
X-Gm-Gg: ASbGnctTkYkziY6NiSi1ivBnyIROD983MrBop5IrYuQ9/8AiRNge5xkigg/8lo550it
	6dnxaY/n5nnvU+HlwRA2ombTveiFpWQtyd+d0fMfqgbttCyHAL/oZupPiBEf/VS4kDrQ8Q38B//
	yebeLssAsf/GUHPOn42Yd5zHz7fI3kxOF4vPc3SwORUsNQVPTQ4M+w5aUca97svZcgAiZ5vmfa9
	suiOyB2FBJdgx9uHXjVB0FUiqzzNuyCALkpIfh9DX3FFCEl7pajTR+mKOx50GL4LkS1xjnoY8Gj
	OVSwtNEAfrE9NtGsyuRcIRgKcNBjM6NrJHpV8DBBhEKqqjebafVMzoax8PLoJdluBd9Uceo/VIn
	GnK5u5yE/jvweSgMJ5G0CzNNLf2s1sakheQVhxzX1sXIESMCoeK3kNMtqvQ8mHfMpjLfyFktX5A
	pUvPyPwKK5/co3x9q2
X-Google-Smtp-Source: AGHT+IHmU/+0OTxZO/ujLXvOPYvw9YHDjZwUJsy0cCotaR0gtzRnkipBingnOhyq1CTayGE3YXHsxQ==
X-Received: by 2002:a05:6000:230c:b0:428:52c7:feae with SMTP id ffacd0b85a97d-42cc1d0cd4emr2314094f8f.32.1763732114087;
        Fri, 21 Nov 2025 05:35:14 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e432sm10663506f8f.9.2025.11.21.05.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:35:13 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mohammad Heib <mheib@redhat.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] i40e: delete a stray tab
Message-ID: <aSBqjtA8oF25G1OG@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This return statement is indented one tab too far.  Delete a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
index 9d91a382612d..8b30a3accd31 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c
@@ -2967,7 +2967,7 @@ static inline int i40e_check_vf_permission(struct i40e_vf *vf,
 			dev_err(&pf->pdev->dev,
 				"Cannot add more MAC addresses: VF reached its maximum allowed limit (%d)\n",
 				mac_add_max);
-				return -EPERM;
+			return -EPERM;
 		}
 		if (!vf_trusted) {
 			dev_err(&pf->pdev->dev,
-- 
2.51.0

