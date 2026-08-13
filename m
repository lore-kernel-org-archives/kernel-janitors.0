Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3D34C9A6
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 07:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604995; cv=none; b=Rpfc2uz8c4Y4lgnYENrXkOjtt+0pd8bbhGfofwyoOBhg70iDVlxsAqnV6HwQdoXFK2vbeo5C0fPmu+u+31zkk3FRKtulX+tqVnY80uGIcp/0Fq7YDUFhYxgSIr+BNiftTp2HYCzU2MCk3saYwSxWNb5TNbKwrXVXuDF5PbR8BLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604995; c=relaxed/simple;
	bh=dl4Qk6v3T3U8z1ZQxbabAyZ0hnb8hTkK12MfMtGRkZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFg42bfhfXWaIt5NXmExSqJWlfeJUwaC5aJoHWiT0OpXzbvmG3n73hUzk70xkmyFpB8ShYOZWgk27sgxjexelU9D2li1D0JblhfVcasdA0q1XkhyxngLcyG9PFoxkdWtU4MdWbFXSF2ynskuCezQI9UM7BazlQpSh/LZ13MOqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhk6/62B; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhk6/62B"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92ea24a2dbfso31123085a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Aug 2026 00:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786604993; x=1787209793; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3MaYnYHOPM8bGKboWFu46JR1KiOLz9Hc+Ei/xGBa9w=;
        b=nhk6/62BVlh/mlQ5GCwRDYbFlsuw13tz/nnVF+KQhtgmECrNDh+lFN8NNun5Ic2y8w
         B9U0b/cNg6d2Y2UZVyvzVpWFJpZhUtZwCofe8QiyG31eGF+eyx6YS+K3X0gd2uYFHmRW
         E6ay/ZKVaecSMOPfcIMEMGpzuyGl+f+J/oJW/zWq2PILFmDMdB66RHwzhN3E2sYJOSdN
         TgFq97xNlG6q6nC/mRpkQFjjimxIIKoAsFdWx+/+0oEa/zQPBYdm6PCWCJhQVNR8a3Ph
         vh9yqoGdX0GvdhgaOpx+RhrjSa0df4XnSCXwm5uzg9HoeLAatNv2DqMUquFaCLzNQxN2
         gRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604993; x=1787209793;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3MaYnYHOPM8bGKboWFu46JR1KiOLz9Hc+Ei/xGBa9w=;
        b=ONqhrykqGFzoeUsU5U/alpw4OkeVo68glMOr4gZ3HADxUEBR2F/wEX0RrJUy0dZe7D
         M4G1df5mTNqbwOu8W0U0rzAYx6SpQC2GoAkaA9gp1yDt/+ATLF5TSi4Y5IwWzbkFMHq+
         4lo75uJmXCULfMzXaJantCoAW1yK0G1iGMF0xZTAhDw3OXiE5R0sn2SMJzIHn+ayfTvr
         aT2bLTDJr/WP7R1L1k2a3twclykujJ2QlNRkpcMetFSx7Fe4IkF18gv1qwMm+XeK+kxz
         9g/gZlMK9IIpb8vrEUC/nOA6pdwta58m7b7yJza+fAWZjPcEZZ15Q5ZS1pLd4D1H8yxp
         szSg==
X-Forwarded-Encrypted: i=1; AHgh+RrV2m6jKluoGmeSVZV1oXzqFMgreJtr02aCN8zXjoKJl4PQhXBXhbdrX2B9xZwSUTjA8xH947nYTYDU9n8dAmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhNuAR7JJI0RIZhXuRnTh1gpWalM2ql1KPM2q6rNAKMDaQGG8H
	s/j1dElmLyIWVIpVouwLIrszvSgMzdg3EKEXamQqkq+Pz2Vmw8XaouuX
X-Gm-Gg: AR+sD12FCy9uHIfgBYWtlbNWoHlmiD6lbamxuYkn82AwHgnPjuNlGmA9Vkad5qKd8xg
	jRTtqGUICgZvDD253DFI/MRZFcqAOmFW46N47nzZZqMRnZciyWmCrYIgogqq3lB+qTrMPyojN1b
	RDFTwp1Y92Um/Tj8DbqJD2AgfdCmFMnXRF5xWoaoZXJhMVi14KC+TMtJu5RjFDEcRb4zGRp5J3+
	UlDTNNu3/8jliDLfwuKN7cNd2724OqfTQQ0CU9FuGMh5OBhDLYY1lSg9DUaJniasDP76LjsFfRG
	o9i0Axm/19L1q7MBEj71rXbm5UKKdAprdUc8OtX9wFDhxYe6WVzEOgQ2jy7Zku5IgNGtR4MKNmd
	yxnvW3ZKvEP39NqQqimKsy0AJ31ij5i7/0I/cjcJvwEs4ENrGDOgdVmZ3P1xmrYEJlrXKyCmw9X
	GtskJtXdN62d8zqKc/AupBVejiVVkfz0XemlYLByMcI1IPUwpMamsKnQ==
X-Received: by 2002:ac8:5a05:0:b0:517:2c1e:8b6 with SMTP id d75a77b69052e-52d73e3bda5mr35334591cf.38.1786604992962;
        Thu, 13 Aug 2026 00:09:52 -0700 (PDT)
Received: from localhost ([37.19.206.57])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73dfaec3sm11467541cf.1.2026.08.13.00.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:09:52 -0700 (PDT)
Date: Thu, 13 Aug 2026 10:09:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matt Roper <matthew.d.roper@intel.com>,
	Matthew Auld <matthew.auld@intel.com>, Xin Wang <x.wang@intel.com>,
	Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: tests: fix error message in xe_migrate_sanity_test()
Message-ID: <an1tu0z3T-qX1ogn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is supposed to print the error code but there is a copy and
paste bug so it prints "bo" instead of "err".

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 3c1be809be82..f10d9513747b 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -198,8 +198,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 
 	err = xe_bo_vmap(bo);
 	if (err) {
-		KUNIT_FAIL(test, "Failed to vmap our pagetables: %li\n",
-			   PTR_ERR(bo));
+		KUNIT_FAIL(test, "Failed to vmap our pagetables: %d\n", err);
 		return;
 	}
 
-- 
2.53.0

