Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC429C325
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Aug 2025 05:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063496; cv=none; b=i4hNmj6VpAmUvqPZQWcVzw3l7qN8EwMzVMvwMXSzQTOgo74Czcls3dYPuRBWgDBpBiYLYgjI0jv5BKrk0BfCHAWlnfUQodv4ZIsjvZd+8prP8occRUV8rWkTG4fU0EjzcdlfUhpLaest0/JZ++OGG3ek1CgS7T7XluHRLHYN11Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063496; c=relaxed/simple;
	bh=fz7vpn3vSH+1er2D1cBKJjGlj43FOUOvtWS0JgPz0aE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sqBvCkDnk7jfQMj96f3bha+24Nmi1Zw0upZtBMK3BdTwvWn2LYdFg4wYaRz3q2yxgK2iqMbx5kgB6IMpRsENA/C6VqeYlgLc7PoGkvJu4USIP+/AR/P7JR88va4ZF2loKXf8CRoe6zoKTj5l7+K1OrLtRYFi4A697zchVJDmBYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EB7ZJSF9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EB7ZJSF9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459fdc391c6so33285885e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Aug 2025 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755063492; x=1755668292; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZtm3WhRjngbfc2XVyDmoZGiMzQGpKQ9/Z/Y44j56eU=;
        b=EB7ZJSF9LGiDssAhP2jSLBJ97II5P0jZ2sJ4jNsj3q5dsvFUiuZD3uUgcJ+4S3JEyS
         Ar+4xAJfmPXiK2WT6QTkJCB6b3DVAlpFjRTdpHjgaFk+V/J+TkHz/J0ueu4BH4PBpl0N
         s2zUELa36hMfIJ2p6pn8/Eru0qtgUmogQ6pjgfJ4ceoPWmS8PVZXIjMVNvEmLAysGZQ6
         rNDoF00LLR4Bgm0s9ADXk9Y3k4B6mUwSrgVgP6nc8X6lemM4X1PxP6yfR4ivzCZWGHR9
         cjFny+PeMKHhphAYuQpMpgrgsKx0BvV8nfihWCIR9cdEH4+WJ4Lx/+nzgz28Jx5lnL3W
         L5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755063492; x=1755668292;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZtm3WhRjngbfc2XVyDmoZGiMzQGpKQ9/Z/Y44j56eU=;
        b=ARh9FoF6dxf22I7kKGTvQ2sSEKY0uwZ9UWtJO4acNGb00AwPX2PUfNqAnZ15QaaU4F
         +UvuZ4ibfOAhtvJLNtEmEZh1K/97r/MvlSlXX82p180EcbnKg/V9BsJQV/2/5yZQQfi5
         AHkt6NAXk35N9adKvcY7/55IZ7bLKS9jAuE1OTlT3G/x2kOMCMbO617Vt1lo92wGAjO5
         3LZV6RmKZoZ5AdBdzmfENehFiI5nkG6q8/6hdQ5Kr+IE5CIkvrbUTTa3D1DzC0Vyq7Co
         O9kNiwZ1wQ++Q1hQRilYvjSeUW7Utb+ymaFIVujRmU59MWuZiKPsg2OAMRa/012gHAzo
         MtIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZcgR/nS1bD7VU4qLxxMRxxsj2svJQS1ox63NSpcEU0m0QmbrWRYwAkfdv6/k5Xset2QnfyCuFuyKPaHH9uZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYXHxOyqvZP9ODywv8hX0kPTCdf+f73+zhzTkg6IhjBAftlUl
	Pzc5UgOFluZ/rY5VJN49at95bMB/XP5L7PoUAy0mMsQ+05+JGKT2i6GMnyXa17XHJx0=
X-Gm-Gg: ASbGncvWRsw9UjFH6ZUv9002odAbk6i2uTi3T0pqTDdWZOPRE4g0O8F8n0cequjfV5y
	AgAme7qq6quW2qR6jfPpbrD6WYrvLum3RZD174PpIBiHNYezRzdzVoBfv9ucDf1viGr7z8XQ0lq
	wXWBrA9tIICJ1XnbxCMw6OEHi82B/dbhv96W0RfdxidTORQ4iNTHQV5wtiwq6FiILKceka7CYxT
	jS4/7DabIJniYsepkukytpQillaCuIAJc+74TmvBoFiRBD7+MeSP7X3bTw8AT9zAd8aeBPzu/Cd
	jJ+KAIw3o6dyGkqfICR5dBpIc9sJ10XXH/zb6u+03pSgdH5ZVZTV18K0NNnhms12Of3igRN/vrq
	Z2FFJLAmoDTR6dWfuxr1pd1iLfN4=
X-Google-Smtp-Source: AGHT+IH+A9B65CILVNd8g+8r1zIX9u7ub4DQznDepgDLM6ZOnlHu2xwuwZKKdRqHmlx+u58rKL4KAQ==
X-Received: by 2002:a05:600c:45cc:b0:458:f70d:ebdd with SMTP id 5b1f17b1804b1-45a165dc8dcmr13438905e9.16.1755063492511;
        Tue, 12 Aug 2025 22:38:12 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a16def069sm14136905e9.20.2025.08.12.22.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 22:38:12 -0700 (PDT)
Date: Wed, 13 Aug 2025 08:38:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
	audit@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] audit: add a missing tab
Message-ID: <aJwkwMRSxUAvI4dF@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Someone got a bit carried away deleting tabs.  Add it back.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/auditsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 1c29541c8fb6..497bda0043fb 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -1778,7 +1778,7 @@ static void audit_log_exit(void)
 						  axs->target_sessionid[i],
 						  &axs->target_ref[i],
 						  axs->target_comm[i]))
-			call_panic = 1;
+				call_panic = 1;
 	}
 
 	if (context->target_pid &&
-- 
2.47.2

