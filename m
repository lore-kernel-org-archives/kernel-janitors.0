Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD9074C14
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Nov 2024 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730539881; cv=none; b=swgZLn/dB1wweNS6U+FqA/YwVH7h3juHnrMXhcyA04UVD2zyDjZxPQpLwm9vQYTooBEoem3d15LTrtqSI8SOun4aF7uZe4ofMid352DDIjCOVJULbvw2lKfCi/I83ewjyZqYlST1tThb26OA83EXFcj9RsbIo21IsvvpQN0YmEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730539881; c=relaxed/simple;
	bh=H8Gb3WLJbngLpNTN81q7DwfW5UpCvmMUw/IR5xIOfr8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUAynSoIH98BKOSmE/OPC33UDiY2mbs5cw1UiPpXsevx9wtCGTRNM7xDYjN5wpLKYWDCMlsmE6+/5O1HkrcthgjHTmwn/QVVhTABYbSsaetxZBmfMrtbBbuTw8s1iDeSE9ZMcAb3LoL2yS7HtHFlBHsioRMddhYziY0izvCkpLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YbIXG55G; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YbIXG55G"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4314b316495so23176775e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Nov 2024 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730539878; x=1731144678; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y20IPLl0T1Inu0ZWcS2TQ9J2Ib1jjVRfeGEd17R1p8c=;
        b=YbIXG55GqcQ4NPSVURngZzFPwMzQYTqsc2WZft4XTzMn9JhbGbXjxNf1vNesUGKl28
         yZad2LQll6+By0vhwVBMsARyXLYFPrIg8L4vdfnsbcY/czATgHH6xt5Pyk2OsJmzXj3z
         MCOLcFs2Wm18LdOqP1xwst92qdyZVT5xu4Tct3e2IzTGtJZ8ERFymk/EDdf14x/3MHlY
         1dsfvrNtqz8HPjZz0MCeo+3ezwOCs0mnA1pCK9Fw9L3g5QXApbw5U1P97u0kfBDOWRRO
         p+AOz6Gd5PwsFwgitA9EYV0iFahtoU6ioutXKq5eJX1n6+WmyI8KFlbdtIhPp2d1GZKr
         mkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730539878; x=1731144678;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y20IPLl0T1Inu0ZWcS2TQ9J2Ib1jjVRfeGEd17R1p8c=;
        b=awNyelDo2tQfaE05XeJ4OWOpwFTfamWFCMWGU0NCSvhFqYcXftkFlScevIhhdCx5YI
         hGeUio5qzwSig18i67prRTB/P4fl3V6V8hAaBeQ0JMvVuVEP8x8MuTF1bQWwpNWPgnoz
         L8K8sNyFY+IY4YbrO6QiH3zHYWA0LiN2ExZbfgs0wkeKausllF7sflpXkO5EOPoLhj54
         bqNfSur9/UtmsdqBF6CpI1bBeiQOfPEoMdkkBg25f+Ha0G7yAh6qFvQlLaJk3iPCQh5H
         TMnXMdgqoAM8XrawebAyBO0Zp0V4fiAGjcX5LsDhdRH5pHxrSAgchD7zqQJ5vVo877mr
         TCvA==
X-Forwarded-Encrypted: i=1; AJvYcCV2/K+CUCOD/SuZoLpH3gtvTBmnT3t6NEuMYTV8jGb1+YcbGeg91YLebZCO4bJD1zwNkA7qync9i/djqKTC9+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPLMnSp9gVXaFN/lPJt2A9T4xGmayyYCCLp1jayL+iB0+pi4GT
	GQ9Cs6vFDkpxMt1qNNA+2ddyeZAqumiFwOJo70W9uQWxdSvdQCzAG923inNwzko=
X-Google-Smtp-Source: AGHT+IElQhl8RTx1u2Qv+Hf698kNw66wgtCjAXGbW3mdm/POfTMzJMzs4xEy2zd12QkNz0gSnIZD7Q==
X-Received: by 2002:a05:600c:a08:b0:431:4a83:2d80 with SMTP id 5b1f17b1804b1-4327b6c1c78mr88114585e9.0.1730539878363;
        Sat, 02 Nov 2024 02:31:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ac37csm88619985e9.10.2024.11.02.02.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 02:31:17 -0700 (PDT)
Date: Sat, 2 Nov 2024 12:31:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tycho Andersen <tandersen@netflix.com>
Cc: Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] exec: Fix a NULL vs IS_ERR() test in
 bprm_add_fixup_comm()
Message-ID: <18f60cb9-f0f7-484c-8828-77bd5e6aac59@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The strndup_user() function doesn't return NULL, it returns error
pointers.  Fix the check to match.

Fixes: 7bdc6fc85c9a ("exec: fix up /proc/pid/comm in the execveat(AT_EMPTY_PATH) case")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/exec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 7e24d585915e..c5c291502dca 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1512,10 +1512,10 @@ static int bprm_add_fixup_comm(struct linux_binprm *bprm,
 		return 0;
 
 	bprm->argv0 = strndup_user(p, MAX_ARG_STRLEN);
-	if (bprm->argv0)
-		return 0;
+	if (IS_ERR(bprm->argv0))
+		return PTR_ERR(bprm->argv0);
 
-	return -EFAULT;
+	return 0;
 }
 
 static struct linux_binprm *alloc_bprm(int fd, struct filename *filename, int flags)
-- 
2.45.2

