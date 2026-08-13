Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156F34C9A6
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604897; cv=none; b=YbJ0oxZ8JpMliyfqU1wiknv3U0rTnNypnN+P7kTJPa+a5TonDqcR1N+FjPnOVtPMxgpSZkIXs/Bzke7SYNCi0aVfW691ZYujAEbDNPu+Og7jGQ7BJllWnIN6a3i/qUYhuFm4V0eYVgMpOGGqZrDmKb73BZZJkDR8Jy+oMown3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604897; c=relaxed/simple;
	bh=bh4B7O/nniVK1wq8M9cB8RIRsbzfRKwBou+ARWbIlmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XXq+GtSxpJxiFXINBmMpm8on99+S0cpZgRu46AyxomJJtuCO9qe4XkwF0dOP7oGnAtz52Ry6R/ExnmV50icPhy/6L9f6xcwWOK4Oo1y7Z6hwtUqrwllASG25PYXFoSTh/tWdfVvvYUB4HjmG/9dgsldQUtsBIQAQP3/N49OXRyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djmJiA+H; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djmJiA+H"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c2a449c57so11423791cf.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604895; x=1787209695; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSbJwX3mVENBYQLVT50jOp9wDyIPziduBiZzfCOk5ZY=;
        b=djmJiA+Hg3zzM7IFZxSXdt3GnZXkQVK5TMETfh8TUPU7vY4f8r7jUBt6naH9f0GD7h
         6YncLIglUdw7M3M0lP2UZbHnD3zlcA3ER73zclB5Xu1TgQd/bfMWW0r+wtXSrwNSrm6a
         xmAWddILUPYUgKRE0i/oDpbBeZ5D/z0bYm4j1bqBK6+igodzDV8aU0xG0NT+hYkZ2q7e
         zNtbDwoMFj6+JW74aEZCKNNeK2onDTGc+XY3LuicspSJbE2ka563yqtkhUPIF+A9WedS
         aSglBNV+hXMfCUixZ9K+u2XnpF2MFDgymRCzLzZcl/vo7pb/OnSafsNj4OoTOuyroRXs
         DSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604895; x=1787209695;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SSbJwX3mVENBYQLVT50jOp9wDyIPziduBiZzfCOk5ZY=;
        b=W7YFNtjRSehSUNW6T/Tit0YYIbJYogM5rWS6vfCzm0u537sSIVHJaYVCXyQtUIQAVb
         4TmZxrwuEhf5c/2XC897fHstbg0BttehHY+7Hw02/7noSVvoH+qbPKJwOzcZCmt/J8r1
         TVFRG60Dp2v+lcw3fv7Trsjgz+XEBsOS1VHQbOXCd2IFJdbrSVul/JqLryvQ1QICyMmw
         7vqCkKRyzQWA43MlALRpLkMjPSih3+yKc1ar36nWRYtjr4xOZhzGuXvdM33yosEG4Mkw
         HD2mpTThP5C9zxf7Bv+4sLcxk/+n6YqCGt9yMji9eJ27HWvG39luVFSuIs5MzsexDOrF
         Hvgw==
X-Forwarded-Encrypted: i=1; AHgh+Rp+1i1IXBs3RFSHYaPNENgvBAaIYmLSq+V6rsNkT/wjvcI/ecR2S/geOyEVsO8VcWBTF1Wl+KEiOmGOhRNjcUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMaEh5RvGW6X/72O4mAkM7q0nC6HhR7fTHwM0Ke61Us9LY5Ln
	TNVxKNc0fM9gTJAebtxfF/4xKgylC1XflL9NFGeXszG9XHZKAEc0qyz8
X-Gm-Gg: AR+sD10RETC00YneIAxl7M+D9YSsZEw5lJisys7YS+mh2xD+eegti5T+GmWHZbNJTDw
	uRkTmywpseHWmaXA9tsQNlXOppkSnEiokPK8DrsC3IEMoQykNumROc/RjQ16vJ8JdeiXTktJ+ss
	kiKIxEYhdz/GRg1to7c4Tl/rkbSk6KRQmd3BGZQe3JXxV8WOHk7nXowZH/IbvvQzZjotZGtCcg3
	TPm4qwqXJtAFheH6vTOpDxyGDzNAQGG2kEnX/djhhpGqz4X5MbveZEYH8wbGc7S6oSKk1TbrGaG
	IXKMmzLr0peNHtSA+3U1oJbPi1acJIrdcviX3WKuaGW1km083eWi4AcTp5LGSoXpB9J8YMH7RTX
	HT3o9F6gGVUb+JmLFnoVp43hIcx+GzcIOLVfjQctHUQ+EWrQEd4LbGvBM5TTF/84Z/GMJ1S2L/M
	MpnX7/qIT3QUjCi7NZ7oxEXKXDWZPsy3fK/8h+qOG6nDPUp0XRjImo7uVNpuwUw6w=
X-Received: by 2002:ac8:7d0f:0:b0:519:8b76:2ce0 with SMTP id d75a77b69052e-52d73e0144cmr31264241cf.37.1786604894953;
        Thu, 13 Aug 2026 00:08:14 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73dfaf51sm11432531cf.6.2026.08.13.00.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:08:14 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:08:09 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dave Airlie <airlied@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/virtio: Fix a NULL vs ERR_PTR() bug in
 virtio_gpu_user_framebuffer_create()
Message-ID: <an1tWfHIHwtXd9SO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that returning a NULL here will lead to a NULL pointer
dereference in drm_mode_addfb2().  Return an error pointer instead.

Fixes: dc5698e80cf7 ("Add virtio gpu driver.")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This code is obviously over a decade old.  I think this patch is correct.
None of the other implementations return NULL, but I haven't tested it.
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index 44ffffec550f..85ea252c658e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -344,7 +344,7 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
 	if (ret) {
 		kfree(virtio_gpu_fb);
 		drm_gem_object_put(obj);
-		return NULL;
+		return ERR_PTR(ret);
 	}
 
 	return &virtio_gpu_fb->base;
-- 
2.53.0

