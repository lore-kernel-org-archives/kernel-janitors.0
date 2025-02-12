Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D121148F
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373835; cv=none; b=UygjkP0HNgSlQLP6jShFm7XIotfwpPmwAHmelRlVACaAyvYslgANXbhfbh1cdr2HcIlFjEgedp77GB9WWhYahtvBSDHpcNZEspCDPyAOY8aC7R6J50afj9IN9mj5oA+on7LZNFMBIQp3cnEuSjsCF8NLQpn5aneldwRu+LLCuIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373835; c=relaxed/simple;
	bh=86qB8ew8BVa0Q5G77e+HrHDhk+DjhCNNMYNdXYgMu/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPJA/1jZRK9skQXGswBxb9M/+zfJKa7WfheH8uEPyHFMl4GReeK860CZPoF2sv+6GhWsoewms8E2z6H6yrQieE2MC6XzFTPWAVDukmFKKCjmpXxpR/NJRHD6YLbc7frxLpeo5jKhaqpExZJFo/fYqq3AWXW6vclkFdDN4mydM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mb6xursd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mb6xursd"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso13072478a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739373831; x=1739978631; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fiMAJYYbGqQGrN9mqZ/PjIuMsY86kljhaikfZKAgMZU=;
        b=Mb6xursdUwNHTKKiG35gwXPTGhhX48w3sErwGBtVoHvntSJKnLo64Df0rfrQBlI31n
         5LeFysn2CjrLb4sosMvpwyfQQ2W9Hg0W/qX2twt1tdWVhcYzDXAbShtOnJd2zAYWwoSy
         iiZ+3Bw+vZ1AaY8/QW+4Q6UwwKGAqc6qTjgmQN+2KYDo04O9z0hQOZYa10UZEi2kvVnz
         EIfsgCTI29OgfaCbxNqNKe6z9NPl1KDPsszwlg+KKjm1tmcOG0jhmuf27lCTgwLt2lLG
         Jf8EQELmebV8nQ9ndPCz5N5qUzvS5DeRmjwOVfU23rFMIgaX024Qpo8eUSlb61l/1Xf8
         KzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739373831; x=1739978631;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fiMAJYYbGqQGrN9mqZ/PjIuMsY86kljhaikfZKAgMZU=;
        b=wjkYg6znTNvDLyUooAIFtNZOPDsQhICYcbMOsWDfdca4ahDpqwNmmWl+zTxqgYoNqv
         vVQNEzn/xuIEsbwIRJIkiqeAyLA17oLB+6ZyCYrkG9A+V0EJ+pAPeypfG3h47cBjfayL
         VGtTHDQ8s1I756VAwEQcK3a75qvoD9j4pJfvmv/mqOuB9DMKhiS2HmCUSIs1lrBzdfyn
         C1ncBU9DIro4id4HaXn7IPMTStrmQ07LujnKarakWgBAAdCepkT3ppSfSSJ+6tPth/T9
         FS6ebKYB1LJ1VEl+IfLC9wrbbrsK+WbSKA7IYj2xwLJvg+noyA3VuN3iDuEYoPfTFDsi
         eUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5XMbEzKdM9OmAdVBLO5L88NkW7wyQ9DGj33+55ANbkYzndgZ/86COHWb0HW3Cdx0iAtbLz/Qm2Wq7uxfBBy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BAd2gwoq9pUztWSDfbvUcDACecpXaUL8rsQhv5W+ooQfUtpZ
	/UbUeoDCE3/CZvH4MvsXBoaG2uXTMdqyFMu7ni35InWva1+qQLJsOCDKKgFVhvY=
X-Gm-Gg: ASbGncsedmiZCAXRXiJBorkrMuJmz658J24EYQLNG8lz4if6Dirfss4a9NA1nS4SQTG
	vAcxzJ0nBBLJaCFne460y2wkjyM/QZZcXAq1GOLfdRwnyAhpG5/5Q06h5c9HNDqLtpU08evLq5C
	2AiYpQBaWDvJ0VNKmG5NGUyZxLY/lYRzMIGEfnLDjHGoIs0neQRTMIkedqQvvYnVrC+Z1yOoAK1
	vng/uj6l5huI0WJxXU48ivzmMvtv6l1G3M0V40C/y8x6Ezk4bgA2Ivof3qvxOXFbP+9jiXDzg5h
	Y9WIhXO0AtWJD/7S7kHr
X-Google-Smtp-Source: AGHT+IFd6/CTFsxOYTPNP3SwAZh6B2Q1L2fFN/auo0EoMrFbeVu/aPClhmCGWE7ZbkOLcltvypHlJg==
X-Received: by 2002:a17:907:6e8c:b0:ab6:53fb:9683 with SMTP id a640c23a62f3a-ab7f34ad061mr329677866b.54.1739373831457;
        Wed, 12 Feb 2025 07:23:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7a98974aasm866825966b.47.2025.02.12.07.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:23:51 -0800 (PST)
Date: Wed, 12 Feb 2025 18:23:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: writeback: Fix use after free in
 drm_writeback_connector_cleanup()
Message-ID: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_writeback_cleanup_job() function frees "pos" so call
list_del(&pos->list_entry) first to avoid a use after free.

Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 3628fbef7752..f139b49af4c9 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -360,8 +360,8 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
-		drm_writeback_cleanup_job(pos);
 		list_del(&pos->list_entry);
+		drm_writeback_cleanup_job(pos);
 	}
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
-- 
2.47.2

