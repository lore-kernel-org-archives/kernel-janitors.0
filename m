Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF4C6E616
	for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 14:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714314413; cv=none; b=OHhm41gEp17YmOhPPWgz9f7DyGeCX9c9+34F8nHHQ4f3aVi8eYwU4/qzY4do4IWXgtDb4US9GoMcW9x8rnUWyJXq/411bE5diC+VnTDL9HYYa/6FoOgaE9yBoxzr4Ln2iGxVvCE0YeNV1b9RR3y5E9liEKQTOSNVkhbuESFqU84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714314413; c=relaxed/simple;
	bh=zbEncrDGXuAS2BXHWBpvSJLZx5Z0xcfLlItZ5FlSCho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJcwpQy5pXkOq30CLB/lj7TaLOm9M5q9KmAae6b3TpDWUIUXE/2oEQEUfO41UNNkVYNJ5sVf9uwNQ9q5JmDPwWLtrDwCkbuL/BTHHKyQl++qpBGu6iM4Kfsl+sm1IYgku9/q9O5aLwio2f02h+liefGK/J1lgQX4sW3YgVFNAEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzQOTN4d; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzQOTN4d"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5883518135so409386066b.3
        for <kernel-janitors@vger.kernel.org>; Sun, 28 Apr 2024 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714314409; x=1714919209; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2fUsYUPa7vCU9Uvl/q8HyFhJTUlH3/eY1Gab40DRDR8=;
        b=nzQOTN4dxKz4+H6kDyGLMxsDaQA1blhaFknFQb96n+fTlrye669zWNQhdrSDe0fMCW
         i5hKiW7zrKzXTS66ijD5sAeysFkYPmV/0XjrfehugbXYvC7CG/J1uWIKrH1bNpGf7vzt
         d0EABhXKrcE1hUUmubJLAWIlx4IaMVlFPy39FM+i/tl8z9txaSPU6WV52J2dPnMqQSuA
         zI8/Sxstuv92s1q+qvnAOdiDtdrD8p7HXV15EIyS2Uez5f8ZLPT5wpAOiBkfyeuJRqdm
         e3n8KfG2pB3ezXDbTK/o/zCCxCQeeWIjxUGN/l9Ihyjl3y2j/fBAAlkP6tHfz/kACL/c
         udDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714314409; x=1714919209;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2fUsYUPa7vCU9Uvl/q8HyFhJTUlH3/eY1Gab40DRDR8=;
        b=SBw0BXxTzzbCmSOdH5kQe3uAQUg8bi4g46v4Bx5Yo0s4mZ8uOJsEryg8My5AOt9qqX
         +VQkh7KzfVEKzxzYJLJGEmdfyS1vBwxtaY+LIviAFuH/SHZnmTWAUrgJrXiCV58p4dzE
         B99s8LQYz9jI/Ho6COztZYupT/Jaz9oZF+cA0A1bo5SB8J8ztm5Nn8Nns+m1/Mn8qI8x
         I5OYMHA9LakYGUX/lBk2oYK86iX2QGCWd3SJgbrh/z2OwvTOe8oWMx259R5rjnHmD0Th
         v3va+LdzcMAeOJpOA2ADSIMKF1+dpRDi9Bh29HQJWvpKV6iOntswt5IObdVZjqV94av0
         6ejQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5x2yKZ5KyDieLgnyrM4pWj6jjr68SQsYP5cmhv4LRQKKpVGH3OuqffVMOjnyJhCkd7mgWqCQrJP21sRVHJLQKVLnpKQiN1TpfHTvRvlXC
X-Gm-Message-State: AOJu0YzEOU/LbIXbu6wlpxn99G5WKl8oyVq3T9VfzbI36+J0+qf7fnXR
	UlesKKQcmF2AmoWJJdMmNV/FNeHyhx6zYs60Fu1DO/Uj0NUsx8qoLk+frs0aXbc=
X-Google-Smtp-Source: AGHT+IFazvolqLNqHW7sn87qc7FNWmc0vAovKyKfUdTKrlrO2gC2bQ/IKjcBl/MzMLcJjyBDHznzxQ==
X-Received: by 2002:a17:906:5d1:b0:a52:5460:a1c6 with SMTP id t17-20020a17090605d100b00a525460a1c6mr3656668ejt.48.1714314409431;
        Sun, 28 Apr 2024 07:26:49 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r14-20020a170906280e00b00a58e5572f7dsm1916095ejc.77.2024.04.28.07.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 07:26:48 -0700 (PDT)
Date: Sun, 28 Apr 2024 17:26:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Lameter <cl@linux.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Pekka Enberg <penberg@kernel.org>, David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] mm/slab: make __free(kfree) accept error pointers
Message-ID: <285fee25-b447-47a1-9e00-3deb8f9af53e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Currently, if an automatically freed allocation is an error pointer that
will lead to a crash.  An example of this is in wm831x_gpio_dbg_show().

   171	char *label __free(kfree) = gpiochip_dup_line_label(chip, i);
   172	if (IS_ERR(label)) {
   173		dev_err(wm831x->dev, "Failed to duplicate label\n");
   174		continue;
   175  }

The auto clean up function should check for error pointers as well,
otherwise we're going to keep hitting issues like this.

Fixes: 54da6a092431 ("locking: Introduce __cleanup() based infrastructure")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Obviously, the fixes tag isn't very fair but it will tell the -stable
tools how far to backport this.

 include/linux/slab.h  | 4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 4cc37ef22aae..5f5766219375 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -279,7 +279,7 @@ void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
 size_t __ksize(const void *objp);
 
-DEFINE_FREE(kfree, void *, if (_T) kfree(_T))
+DEFINE_FREE(kfree, void *, if (!IS_ERR_OR_NULL(_T)) kfree(_T))
 
 /**
  * ksize - Report actual allocation size of associated object
@@ -808,7 +808,7 @@ extern void *kvrealloc_noprof(const void *p, size_t oldsize, size_t newsize, gfp
 #define kvrealloc(...)				alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
 
 extern void kvfree(const void *addr);
-DEFINE_FREE(kvfree, void *, if (_T) kvfree(_T))
+DEFINE_FREE(kvfree, void *, if (!IS_ERR_OR_NULL(_T)) kvfree(_T))
 
 extern void kvfree_sensitive(const void *addr, size_t len);
 
-- 
2.43.0

