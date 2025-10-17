Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28FA25F994
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760717021; cv=none; b=J5PdKLVFSr/W+JONzpK25Hv89CbQNU6wIaHA2IAS5ZNbckkhaFgmq9rWjbbRwejPb/v/PzKhHPq4+ymhzelrR0ZPxm2vZb8l10FRgCnP/v1D2JAEHEy4fPjiyZ7CPZjkTx8tpVxiAUJ6RoCoD1aS0qsx2gFBRwsp7I+BvkZKI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760717021; c=relaxed/simple;
	bh=CLm1Ok7Ui49vhD4HdpEzRFDDqGHRFmOOUE86aJ808sg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/cL+/u7Kzn7Y4JxGDZjhFDxdToTcZqgHVFHyvtz2+bg67F+4bpp/m2yRMhiNHxREVIjMUUGYwbjxI/1JRw9Igu50G21MlVjEJDOwBhBUjJX2SIbW93IS+YEHGYzESN3sFYFE36I2gh8hCLzHD25WZgvyQ2oR+y4+FmodIEwVow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNRv9T6t; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNRv9T6t"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47106fc51faso23060995e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Oct 2025 09:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760717018; x=1761321818; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ppRljhpZ7sAECJRgv3z2Edioee6aFFS5l0XZiKbfH4=;
        b=yNRv9T6tnIL2uaaGKBbfig2R+icZw55Mkd8nAaA2LjTCocf/91KqtnlkSWE6xXZ2Qg
         82EnWQWrMmSkrWOTSmVzgCE4SLC5QwwplgN+chrhNuVa6gj7OO9qc80F2+1duSsR+cvZ
         3Qqy+Mr++GUJAKaD2skd5MGylZ3eE5vDq6Cv4YOqIdWYs+bDd/rMoGjTCIPsEUN/wrck
         xcIY3Wm2gHYvn14+KPkNXrPZ6bf6T6TX6GgkM+VD215lD4oFhVhGcvsX2/ngKQv0LNlT
         Yb4lZjR7FKzhMwF7lIXV2ENq6A7G1nu2G24lxB1D9cdHnJojn++FohvpcjfzsRPUC/rs
         rfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760717018; x=1761321818;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ppRljhpZ7sAECJRgv3z2Edioee6aFFS5l0XZiKbfH4=;
        b=S7iL+OceKzoLslPEa/BNgCKmzVoYoa7EH/bmfAMqCLjBrcwtotvtWu1w2SaggJbs+N
         PRXwccCd5u4NEb38J+Fu4zl2Y1CHEWnvQ6jnFn1D6lgCMzsBAd2UkDWxqBTWc1Qw0rvb
         mv++1Q7xk+22uHi1Vj/myJL3vm8DQa7RaE7OwhoIm12g90E2HZFqAiM0HaoyGrRbEcz/
         KX29yAC6l1YkZeT0Zt09a4QNaNj/hu30WsOpe+ZqDgp32cDejV4YfYRw3ZoiDgmDt0c8
         03UjCbVhZqNu0yCaJqVp2sYUa8Ttbz/oZ3NB4rcQUIZj/Zjx6/xon9JL1e1Z4PCrSmA+
         6n/w==
X-Forwarded-Encrypted: i=1; AJvYcCXMVvoic4RVBCPCiBevEyq4bSZR1CwU+bU3vt+Pp1GjUJrfzat6CnkVCE7hTz5iJwaR9RlmHjMEyDCZZ1pdHNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFH4hdV46Hhs9tMTHrjQaNTH7GBPSLplVHZXzSI8Gx3qsWgxKo
	7qjYYq1c1+z5KGjs9znmXKbupJLH3sJ9w2z9PSPl96WkDDRu1a8D1DzGkLxGmOoIPz4=
X-Gm-Gg: ASbGncuNT6DOeWraCaPesgYOx29rhh+nn5NYRrcoSkajcDh/m8D6X+raTWfXUDzgbOx
	qyKCxWotbemHSyxytfJ+t7cCebksj6YAdBUlLbVSXQvcz+x9IMcxkJMHKYj72bDooZ+KEZU7Eky
	96nqjxaE6KnZTNFFKrjBaGyt/d2pBLH07mXOPd9XOEUyWFEokGGNVPLMogzYaolPlGElduVakLs
	AJfe1k6rXM4Bnof0ZY18+oj1byMn9vYIGkgMzv+9jrgCQQ0g3qB8/zfGiP+WBM96zbjLWPhK7/o
	LK6DdLbLI5DdfgB2f5T9hRqB9n7G6GuG15Kwu0ekaV2cTxapS+FxlXTBGpk4xGh5EGyCQbACR+P
	GxxQQ1I0pw/YZ6W6vHTj+rFcCy5Bb6y2sRG6PYqcdFxr7xpgh4mxVIFDhYXlGWWziMVANGIPmL1
	wXvud0zB7TA2260wLAdmLf0/ssScU=
X-Google-Smtp-Source: AGHT+IEvEE+Kq6kgGCQVfufhYDGLF1UwGNj+vy55Ir4PUIuACrWwdwcv4BS7vhmELR8Tp9IGWl6shQ==
X-Received: by 2002:a05:600c:5296:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-47117879898mr31462585e9.9.1760717017876;
        Fri, 17 Oct 2025 09:03:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4270665efdcsm5017211f8f.29.2025.10.17.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:03:37 -0700 (PDT)
Date: Fri, 17 Oct 2025 19:03:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/sysfb: Fix a NULL vs IS_ERR() bug
Message-ID: <aPJo1W5Dl4rmGX_P@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The drm_atomic_get_crtc_state() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: cb71de092553 ("drm/sysfb: Lookup blit function during atomic check")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index 8517c490e815..d2c4d8f3d4d0 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -259,7 +259,7 @@ int drm_sysfb_plane_helper_begin_fb_access(struct drm_plane *plane,
 	ret = -EINVAL;
 
 	crtc_state = drm_atomic_get_crtc_state(plane_state->state, plane_state->crtc);
-	if (drm_WARN_ON_ONCE(dev, !crtc_state))
+	if (drm_WARN_ON_ONCE(dev, IS_ERR(crtc_state)))
 		goto err_drm_gem_end_shadow_fb_access;
 	sysfb_crtc_state = to_drm_sysfb_crtc_state(crtc_state);
 
-- 
2.51.0

