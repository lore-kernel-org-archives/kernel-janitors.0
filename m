Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E139C637
	for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139507; cv=none; b=bym6WV2msimUXt3BeqgnN/ut+Mu7uYtEgZHyUi7Y8Ux8W+vcb3KvdYpqT+IsD6GpKVG61HtEjHgfFlpguClbKAfian/N0arOClkaotp6IeJUvrg/pUo6D6pkxsrnw3L9mEvpaIrei9qrrXG9UnWlNpgKFHAJpiIJHIBqENcMMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139507; c=relaxed/simple;
	bh=OLLLfWKBpwqo5exF9ou0EKVfVVOyS128Lh6BBfC4mEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCkKenfZNAByQ63m2rl8bceDGDEGJz711gszdYd8zMK8u20OO0sFejJzND9HZYn5MKyEFlP6sl2B1gsq8q7+EAV4x8xz42MX7PZU0RtGOUGM3fqSu081qxT/3yxaH2v6Fjj3kYzamKEyJjex8P7flmFQwx3hizQ9KmRWxNtZ32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWDiC9Xm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWDiC9Xm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so52709855e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Oct 2026 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792139504; x=1792744304; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnFQlpRueWJU6LQTCtMO2U4Bg6ST/1jzJh/3XkIm/00=;
        b=fWDiC9Xmu2oQpFdIhjofgPPGf8PAGsfzLjGATbPDlg20Ol9flQpzQJjNgYVn19huzD
         YzT2/IJ/SRFd7Un2Zgxw/9We4Ht63SBOf2syLswcgh5pJz2mEovMpxJy8rh3mE+jgyp3
         LgSaOrC0wbuXMR0yIloqT/3lLuieyrzZyHXnAPXvYAxIBncto7Fy5FXI2jKqTPArwy+6
         smkTN/g6SasOUMOAckhUDeLLVXbR3X6rCn1Ws7rJ6wUV5h4winbmiVNiuRMxUDUXOGZF
         epqSWpE5zKuV5FEjv19DZk+g2VgTjjiKbahuWJGqp19i+MpUTHpXkSkqxxWHqbUTxxAt
         fSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792139504; x=1792744304;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnFQlpRueWJU6LQTCtMO2U4Bg6ST/1jzJh/3XkIm/00=;
        b=kbkxll1xgxmSSxRI+zQzuEOFzVFiIz3iAk/Bguoaw6bKssSyVB251DSZwAEGuCuEA7
         jtLMOUnHs8GWaZ6sbnS+Ro1WdWOI5al295ITGZvkRpXxpFvX5gah5u2V8DHmLLR23vtD
         DK9s/MzWEcRpDqc8R8dhsA1K8146eF3A7yBMCEONgmslKDfisZ0RQ2xFc6Iu+pwHSWYF
         oRPoxPYgWGajxP+Lj2YfUIilM8dXXvDWoZFp5zh9mu83+WPFlEVDW5E2101UaQiKWrpy
         9ps8qRHOhZJ6HTFKQjCSX1l2qs0Vy+r3Jq5VOJMlCuggWq/DyzOzA/xZAcz+XAyadGal
         Dl/g==
X-Forwarded-Encrypted: i=1; AKwUvByBlMfvxEY0jNGQVFaArFF5Yn/Qxjs8r4JrceG0M1x+JHM0bQIls7m/bCZUlFtgJu5llqYsyIQwvk1yNUsrEpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXwV6K7bsw6ke2PpCLTdOtX8hkQbbYj4rVHoFsfuxWgbJLkv/e
	YfKkJqKcmaTsZ2teCLzviU49GuewZQfKUmom5HbTYNU/bgkACwOWvjUJ
X-Gm-Gg: AYBFou2fQ677/hrRt9s96qbWP+oC8VlyXb90N0svMHLsUg3X0xQg8Frhyf39zmEvKTO
	Oxbi9UI9P0NxuZ3gxYVqetu06HcbYBEH4G2xwVbGoEcwO/RHWtpJW0lnbw7QE7AmebaryEhQhKk
	TNPh35LrPIPUUFTNG52c88APRciXJ55mbfcPE0Toacahc/ytamSJxF/8iwPHVh7P9swN6wcBCd3
	PUzV3ni8UgF3CPPzVWYouRcm62AdR1LA6Lgim5BYtkk6GV16H0ZTXX+sJtlbeiOice9l2P5QOBu
	vUjthKY+y5vFSxnrZhhu+sxi1TClo37uNLs3XrQUyiJLmYRtc5Ld63XFoIubItmMnHMGNf60Ryk
	jOAoDfvv3vdW5jR5WLl0cpbF95mAQvYp8UUIMJbYW9C4otvefcObRLkX6JKT6blmklxV27HnGro
	Nsz+MZV5oyIIz8B4884eCr8HHzbQ6TS/3W/GqsXe8smKPsg43tlMgnItZ72V19Zy4rd9o=
X-Received: by 2002:a05:600c:4688:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a18e4a9ba5mr452180195e9.14.1792139503538;
        Fri, 16 Oct 2026 01:31:43 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm38391285e9.13.2026.10.16.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:31:42 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:31:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: Add sanity check to
 uvc_mapping_get_menu_value()
Message-ID: <atHg6s8VaFxNzuR6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch warned that "idx" could be too large, leading to an out of bounds
read.  When we reviewed the callers it was a false positive.  However,
add a sanity check here anyway, just for future proofing and being
consistent with the rest of the code.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: It's not a real bug but Ricardo asked me to add the sanity check
anyway.  Use BITS_PER_TYPE() instead of BITS_PER_LONG.

 drivers/media/usb/uvc/uvc_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..249c68783474 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -538,7 +538,8 @@ static void uvc_mapping_set_s32(struct uvc_control_mapping *mapping,
 static int uvc_mapping_get_menu_value(const struct uvc_control_mapping *mapping,
 				      u32 idx)
 {
-	if (!test_bit(idx, &mapping->menu_mask))
+	if (idx >= BITS_PER_TYPE(mapping->menu_mask) ||
+	    !test_bit(idx, &mapping->menu_mask))
 		return -EINVAL;
 
 	if (mapping->menu_mapping)
-- 
2.53.0

