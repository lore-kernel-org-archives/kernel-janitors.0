Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCBA4E01E4
	for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073277; cv=none; b=Uci5IMXlziiIlRRM5Ey1odwdcsZXsvthTbmKAPud8p6Fwl4lqYc6/D6iUaqgQ5/X6YuGPmdTCFm4+BKwuq7M5ul+S1lZz/LSVivegAPqPWL13mJoI5bZ/u2hAQ8E9LlQJQn6lA1JXwt44/MzKHADSH6cgn7WUP6zuZukHGPiwgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073277; c=relaxed/simple;
	bh=H6VOwjSi27ag04j3PcyJLtzkhoLWCfxwRnIPIXoKAuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SL/hOcx48zIiVndXRqxpZw33G5EPErG/WYWN2OPDynBZbXl/hrGIVLNrHf95yhXI4irSq8Hq59QEuxViBCdF//rN83ALcIeSn9I1TCFtKbxLW5tA6Yb73355+pWwP8zfL4zjftFmnsQoOTv91+sYqKVSccsy4BCqaR6dr91FIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMbEDiYA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMbEDiYA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so20380185e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Sep 2026 03:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790073269; x=1790678069; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peD/4G2ym+y+xSTM4sbob6geygM9Qdvcv4LFRM23Ptc=;
        b=kMbEDiYAEsrFc6HMOeiBlZSf/ibrZ7Cl9LkTXUDvQRSiLuMLXPjFi0ZMXcFAphgVfy
         ldDasBAEUIpZBqcRyGHmylpaaVp+ph3eh4lf/+RqijezD25XyqA9scLU38/eiq7IofUe
         KfMN33AgX9aMGti+gjMEEnsbpWTg5oeueBYgabZHu8LN7dnRxotRYcnIXdHt0wxIHaiC
         a+Rl8Puw6drnDGDtc0Ki2MSevimW9MYViVBOujFpm+3TXkBzcc+4rdEb5dWlihEr/aoI
         Mx8voQvkcYmd5DdubniunFGmjP7H/PNh0oEtXLXGZi/d3de5pImqhHmvuTsSXJgUTGQv
         KCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073269; x=1790678069;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peD/4G2ym+y+xSTM4sbob6geygM9Qdvcv4LFRM23Ptc=;
        b=A2JcZF3HXShKRvAIY8rAnufwrIpdTscXmgY3bvF68vkFWBq07PGSH0A5WvLMbTNRdm
         f7YzTsXoNFeWuy8HwI2hWBzv4jbDuWzd2m9og4RlgDWHU2oF005Ce1gRuHH0us8bhgLG
         220c3hNNBxmn9wtHAF9Toxzttsa4GZ8uFrP51TXXNQwvihfyhV2lJJcvntxnINODEGks
         epBuEAlHJjff0vpHFcptwvd6YCraiJ2xvgawidGjU9DSSIghPuZtZXFAdGrWaJ8zw5vi
         RYiOwTNVyDun4z3PIHgt0YekGRC9oBYsjN6d4IpNVyK7AVebIDXCY8ALANcV8hM5upmj
         9Hlw==
X-Forwarded-Encrypted: i=1; AKwUvBwkkaSiF0PIFEkR/VruCnzA86lnj7zY2lTuxIryNoL3xJ2YhdV4bixs9CcxtW7+w9MlLxA0LzhYLbr967/v+q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kVOsdHq4oOwAR3IJhut47gdTL90DfgF0g1MfWpzBaIs/EGXJ4S
	oair/MN9CzOj/24C4BGG2CXLZf1IaoFICOy63N5v6bn3E733ys0cE0QN
X-Gm-Gg: AYBFou29QfySRwDCitvMkq+REnaryxCTZuVQqy/ecvbErazFnLoqupBt3RsH/iIyRYA
	AYgXOtr+VtAgaP6E8Hymi41gGsj0fzFdkf5mIX3BBSb3HzvdIqZ2Djck7f7RZsrFPvdxFGPIpSD
	ld0UVyucQXhxMHH88q01QN9+3HWkpwY8cDvhKimaBk9aXssrCl6S9Rch7fj3XLMuVNpZJs8VaE+
	UbvD+jkhgs8GeYKAOhV5Aq6S2pKNw6IYBfEgJpyYP1Kttingmwmj7n7G3BddaJIGmRXFa868db/
	C5215TUUiw4mSdaYJJ/rMqpU99z5BCRVBPzsi5Pb20viqs7/fsc5/kkJArBaLfMMVYr482AdoHv
	OOT/T50o6CQWjNrnTeECtCKLySpuOSjN7RPKQc2Qzj2ox3zSW9UlHT4puZcvq80lt4NShEdf3kn
	vH0fIhp8CSsTrht0wXbnWgaq9r0tRKUFCaZj/R/jGOpy1s2dDxKHSihRhJ8x2lObltqdw=
X-Received: by 2002:a05:600c:8a0a:10b0:49f:ce73:5e95 with SMTP id 5b1f17b1804b1-49fce735f50mr91800255e9.35.1790073268853;
        Tue, 22 Sep 2026 03:34:28 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e611sm4269938f8f.18.2026.09.22.03.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:34:26 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:34:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: ti: cal: remove unnecessary error check
Message-ID: <arJZri2tFcBqBLgN@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The v4l2_subdev_lock_and_get_active_state() function never returns
error pointers.  As the comments explain, it "returns the locked active
state for the subdevice, or NULL if the subdev does not support active
state."  None of the other callers check for an error pointer return.

Delete this unnecessary check.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
I feel like if we don't delete the IS_ERR() check someone will eventually
try to convert it into a NULL check which would be a bug.

 drivers/media/platform/ti/cal/cal-video.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 59f0cc4f0d1a..1990cab77344 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -130,8 +130,6 @@ static int cal_call_active_state_set_fmt(struct v4l2_subdev *source,
 	int ret;
 
 	source_state = v4l2_subdev_lock_and_get_active_state(source);
-	if (IS_ERR(source_state))
-		return PTR_ERR(source_state);
 
 	ret = v4l2_subdev_call(source, pad, set_fmt, NULL, source_state, fmt);
 	if (source_state)
-- 
2.53.0

