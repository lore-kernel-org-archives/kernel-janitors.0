Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3A1524C0
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Apr 2024 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563826; cv=none; b=rwVAlYnktyB2qNwGuBXktU/mXT03T1WPvGIbk4522+m9BJjBF+zKXAMZ4hAdBTp8w5N/r2v85BVWDhifUsTlDjc3sOTHXShlVSg1HQSLTIMxRFrqSRUIFOeO3Rb72rtQYbCbiDXipi7HYh1qGmalNsQIUx/3ou1Q7Fm/xiD9r4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563826; c=relaxed/simple;
	bh=GHDQU9zd2nMXU7UlrQa3DtToNffnBvQ5Ugz2l1CzFYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oot7ZrkBQgyrSUj0vlOTTLUyvKyJ7sQHNOipXAx3o/3G+1T1q7EpMKuAhM1WL3mBJqq5hjwQn8ISE9Q/navc5kUMU++Mikq0mw4RKa2bzCMs7r3Qyw0E37jTjen3rpS7TovA6nIuEop/RBG5xd1QcE7rj1U5lMqqV8wjAqPydbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA1jsfpf; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA1jsfpf"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e47843cc7so1117207a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Apr 2024 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563823; x=1713168623; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOr2piSF59rBtL6qQkJRVxuVH7En2uLFiUAi/dy63d4=;
        b=lA1jsfpfNIMPKQ3qH+2mopqRLcf3heuEPPpprN54142bgZ57ukTuIitDmKQGYUDwgK
         u1eA82n6FfDFzT62zXPg4fKPfOCf7SPlmyfb7gjv1OefhVEEJi2RFqszkC8WJii2oOj3
         I2tMjb2BrccF8OoctXyZPxXO8FDw6JE9r60nHUFr1KytJzzV3JrwjN4pgiXiI6oAsssr
         Xj/oTcfPfSQdWGlUj5BE51PDpV5pj0MpVysmIv4fvWdKB1RiLK6zGRDaIa46/imDiieS
         44ZpCA7fL+Lai6VmPe+/zw4n/muLAxkW7rrKA80hVt8GO5bLq662vsqVBaVSpc1U61HY
         jjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563823; x=1713168623;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOr2piSF59rBtL6qQkJRVxuVH7En2uLFiUAi/dy63d4=;
        b=djSKnhvR3RiyKwMl5XCTbBF6RQj9Ld7hZQPvjc+LYQ7G/tGc2Wqp62C6/XBwYk8H3z
         cIguKv3ntYT56w09oR8mRooSeAYEOMsFNDLiNT5Fixc2ZD0ANOW/bTI+myBsM5WGeY1e
         fi1OhzM4meERxH6wSfASvbePthz+8B20EEZknh8/+aC5iXwCgJVvnm7WHkBofKMy4Uw0
         yWSnse47ewoZTdFS8tLe+2mlfBlgwQXYm23hTgIhjkCYuHLDtwiwUMBJPe6eMBD6QtvW
         RdCqbMUW2T6hCPev4pYTJ2PmlhMpnzF9e88sPr4uwwKZHE0G+Qhmpw2dWt/athXxKn6F
         hTgw==
X-Forwarded-Encrypted: i=1; AJvYcCWz8gm+depPAehsm3aUwyxBsdIoPe2sHiW8v/XDXhcrz5ngT84Cp3vHEmHJ5kfMG4rO+Gtky/HydDwudIxBG7Wd6Szx1l1qxst+OZb9GKz5
X-Gm-Message-State: AOJu0Yx7xsSIeWJ2hA05dF7YOdEzxSohF17SljVLNbzrXBBc1OCueaWW
	UYhJ7E0mu+n0+3//Lcv1NliD+oFz0zaazcLsXaM0Nc0HR5U7DsuB/0X6qqmhkVQ=
X-Google-Smtp-Source: AGHT+IHSMNUBKuLQipt6eiK/GpbVAIRoVBfOGY9eusOY9M1lS39qRZiKY7EBBCgcSpTRamQWTGpjPQ==
X-Received: by 2002:a50:d6d2:0:b0:56e:2bf4:fe0a with SMTP id l18-20020a50d6d2000000b0056e2bf4fe0amr6239511edj.35.1712563823192;
        Mon, 08 Apr 2024 01:10:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7c90e000000b0056e46beba6dsm2416447edt.16.2024.04.08.01.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:23 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:36:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: clean up some types in panthor_sched_suspend()
Message-ID: <85356b15-4840-4e64-8c75-922cdd6a5fef@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These variables should be u32 instead of u64 because they're only
storing u32 values.  Also static checkers complain when we do:

	suspended_slots &= ~upd_ctx.timedout_mask;

In this code "suspended_slots" is a u64 and "upd_ctx.timedout_mask".  The
mask clears out the top 32 bits which would likely be a bug if anything
were stored there.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index d4bc652b34d5..b3a51a6de523 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2546,7 +2546,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 {
 	struct panthor_scheduler *sched = ptdev->scheduler;
 	struct panthor_csg_slots_upd_ctx upd_ctx;
-	u64 suspended_slots, faulty_slots;
+	u32 suspended_slots, faulty_slots;
 	struct panthor_group *group;
 	u32 i;
 
-- 
2.43.0

