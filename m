Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF00262FE6
	for <kernel-janitors@vger.kernel.org>; Thu,  7 Aug 2025 15:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582028; cv=none; b=sR2ZPG/IcQ7ZqJgkRLVieK5H1kX+hl6Kdm8gHFFTUcGSIEk7M11a7IwKEWEvs8SDGgB9YGyd+0xwljWkaFnHeWaBDm4+7sOQkKm0Z3siKbULfkvGjcnYPJ+hAUM2TZVDA0DpIBmAFeNwOSRjzfPfDT/MaRhm3oGE/JVsaOxbFwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582028; c=relaxed/simple;
	bh=zsJFJgwKZVKu0gVQGRYuwIOMgrMMGHGdooipnK6TecU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oJeO0OA7FfJameQmCpcJb9c8aWQrdYFhTxZDeaddfHZOVR5gryCajGZipLIGg+x3eItL8CWwMnVc3zRzxHHzzA7tpIDIFBh33+AT9Oca0EkvY0ufHUw3rdNqAWicNhywtWRBZNvkVyE5NCJnbWNjRSbyOzAnZBsk56GxuIvgWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0XYCQY8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0XYCQY8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso7239575e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Aug 2025 08:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582025; x=1755186825; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
        b=P0XYCQY8cCqFyG56Z5hVawmnwSxJbUkRmjNE+btq5ANzWnifnO5UeyOoA5BvgB6Siw
         0UEMzM5mbs2uKH5ria3yl+br6Vu6Zygb0994VbLm6RQJiZS94hNq5P/LTluVvL18250K
         rT+ITwQs55opqo2ik+xTZ3DjN+3BgR7omY2HyXLKR+XlTYHazDk1Jni7bglLvz50g789
         FUIGdo+routUXeZXJJPBmFzt4OW9mJPoT9+sO1tSLZc6bM1SSiDOkKXHSxVaWSNFARGB
         nrNxE628tdVjwSOeK3yuZAJ2qM3gRdMNfInR/xwefDlxW1uOBLpOoTxaTeppzf0XTBk6
         eS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582025; x=1755186825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOwl9OLQJAYVxduC2ayJxb7hSYBFSiSP9YcfR3LlKkM=;
        b=DIC3NOfm1KX/xjNsdlfBKmzaOYQCua29zfSj1zhn0pirKtiLEeJ8IzgBObbmXnu8E0
         BsFj/s6qIfTN2inJwNvImtD3RyCVDQi5pYBruGIKp41C6rIy9ttW8V4YYD8EYKh8JBH4
         ov0nCppBqcAe0Wf9nuz26zXhLw28RE3LJxZ30vc5oMPBSQXGQBNavcgqzrterGMvOXsE
         m2QauZ/Vq0UyeaMFlO81KDW2DrHEYvxSnqdocXAdxLDgvWwcbyypFrbdpV79StHQ9JxD
         CGpTqTcazrJ7GsCY/TqhHe1/NUVSuwA4MxkMphYLeRTgMUSPH1/R74bEFODION8wC+Lv
         cDFA==
X-Forwarded-Encrypted: i=1; AJvYcCXsV+pAM3Md1V9f+lPVW0xexd82pGNw23TSLfLBJ8sf0T9RyZPzi1QnqbVpjcNKVfpP2WJzJFk+jjbRjEm6xf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxguqElaWta7RlIY3UGzaFzSe9UPIBZ9NpGHb1ErghkZYvavXR3
	H3AFOk6Bt6oGXUI0X58M+7khMqV9id7aPoaVTHcHkI39nnfEY/wCqGcMN3wmTE6vbds=
X-Gm-Gg: ASbGncujMlnc9fxeuebCm/69/ijBQwU9AM9W7G5/Nm/cGSdF+chYZl0NcmItPOiAPuk
	cHnoXHWk0CnTj9gnuZMUqZHHjqvSkqYY5/a5Be4YONyEpltM34mp4Q7T40ATFjBFXaYOO5MLJUu
	gVtnT2dUVX51Yqw/utzrCWuEiL+5ilIH/gtbw5zK20mWlu7/qZNzaWKfEuHkZ+AJkQDCbLY1nDA
	PsvazqkN42iaKryGWCKWHYCmPLVWf+wD+KNgbV/8UZCbPtn2J5FxVkYjks3+W3seTHeaN3aVPhF
	XFg7DqrDfHjO/OkxMV2LeSfJZvWr6Xx3h2FABlnxYTn+XyAnMKplR3qrIiSjU/1UOIPEZs35qot
	mEhFHTb6BGFzA38wxAyvW08hMu/R0wZgJTDpssA==
X-Google-Smtp-Source: AGHT+IEuAgZgwkFD7Z8Xqqn2h/YYU+isAy36WnGYO+M9a5Hc0G0oFkUuedFLpME4SUzRmU7sRh6FqA==
X-Received: by 2002:a05:6000:2204:b0:3a6:d349:1b52 with SMTP id ffacd0b85a97d-3b8f41980femr6076763f8f.21.1754582025300;
        Thu, 07 Aug 2025 08:53:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dc7e1ddesm176487365e9.27.2025.08.07.08.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:53:44 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:53:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aJTMBdX97cof_009@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The xe_preempt_fence_create() function returns error pointers.  It
never returns NULL.  Update the error checking to match.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 432ea325677d..5c58c6d99dce 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	pfence = xe_preempt_fence_create(q, q->lr.context,
 					 ++q->lr.seqno);
-	if (!pfence) {
-		err = -ENOMEM;
+	if (IS_ERR(pfence)) {
+		err = PTR_ERR(pfence);
 		goto out_fini;
 	}
 
-- 
2.47.2

