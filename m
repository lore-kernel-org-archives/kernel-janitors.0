Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765407AE50
	for <kernel-janitors@vger.kernel.org>; Fri, 23 Feb 2024 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708698020; cv=none; b=u4rAa8fq0XKG6MlKzvUHoIKBHLd3wpo6xYz0bhm6S2D81gONQSG0Z1pmNYilce2vQaR2mfFNFNeRD1ARP6nLUlcNYnH0YPe90eOH9a2d7iu/pJWx0DYun0ZdwmzIPmsuFl66ITyw4tBF2DIAqa5Hc10x85cuwMaOExutsfwE88c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708698020; c=relaxed/simple;
	bh=P9QaVDrmjk4Jn91La3VhEGTQaiz1JWgebffCRbAeQP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EhwBWR8099HlC3MLubXajUmjjA85CXWwz+sDXGev2+6AM5sp4lJovj/kW2hK1zXy9AawnnBPonhsyEmnRIn0Quc3fK7SgR057iYPqZexp47Bo8+ErFZsqN/fulf8E3yJDdSxtUJmBaZXqAt8E5VEUyz+tcTaIBKuZ+dac41c2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uw1QsRTX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uw1QsRTX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41294136c27so3648315e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Feb 2024 06:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708698017; x=1709302817; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2AYcb7BkAamBT8laTS5yV6Xd89bfL5FSrmzKjPqhBc=;
        b=uw1QsRTXWuPeSb/2UJqVI1qeWx9300OaT5dSuuKDMWAkfUKeInP2uJiSHOYydBI9kh
         sgQC/CM47/aBex7bremuF6BDQuaQ+fx1buPWddMGixBNxZ0KNlo95laS7zaO7u6p1oFx
         E1mdLEIBPU2higXQP/Z85TJ4EMhHiNvSXW2jstFN4etqhtqHV8ssykCouyxm2p6zjTCc
         CPY9iPf40Tu/igDZ5cVMVtlXLJ+dHxWfk0x3V5Y1ZpUFZZrsNkxza/1fc7srvZmJDuEz
         WNFKl15Mi3jDycgZyv71iSsV/J6SZMnmv43ymr2cjrJ92syFQRnnNJfDh0Hecs8l/Fxu
         5Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708698017; x=1709302817;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y2AYcb7BkAamBT8laTS5yV6Xd89bfL5FSrmzKjPqhBc=;
        b=r+0uG5/xFOR4CQ6Q9OMfDNMWJNW6ZsrRarO1bT4AnOjmqdJCUFaZYfMKOAEF3u+SB7
         Xxp79wuaoFfKFjfWs89JV5li1Bofq9gcRJcg85advfXT8lB8sgzaV0buI+2ZYfamg2bO
         R4niIeKzLQ5qPMKRWgGHDMK8YmOsBNf9NIPABW+no1mZbVuAiKssr+OZiGrGVqYu1mQm
         D6ElBye2jffckzm8HsXdp6tbEuIlkVDW7dDmK799s3YVQikG0twYJgouoi8ji1naUJeF
         Fddb2vf/hHtp/ZKimn0Z1jf3j/EdBUKCS5VpwTd/7TnLRtTRdvBzyjIQrl8AvCcUyc1N
         7+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCURF7crv8DlF4VZZmP6THxzf1MjLe/QCsC0hQW/ksLiqOb1tRg7RyNDtvVRKCFO+dWR+0S7nObtDSyisnPBnSevDyg/cxEa9mZaDs13wQQ0
X-Gm-Message-State: AOJu0Yx3jlh6o9PZotmP8HaQ0xD3abte1RaxFoa0im7rm10dGb0y5dGV
	iaTNmgLcfXAhML45/i2k656tXYXByfL6X9ovNjTK68SK+n7Jnh+eZmxk2G3+UpY=
X-Google-Smtp-Source: AGHT+IGvvyTHIzHSJgDc3IDWolA6PB7uhiChrNVPgIcyXbduQ/ai5adJSBuYtEvQFDu/bAgDe3ZyHg==
X-Received: by 2002:a05:600c:3051:b0:412:78da:8abe with SMTP id n17-20020a05600c305100b0041278da8abemr1408960wmh.30.1708698016772;
        Fri, 23 Feb 2024 06:20:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dq8-20020a0560000cc800b0033ce5b3390esm2966338wrb.38.2024.02.23.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 06:20:16 -0800 (PST)
Date: Fri, 23 Feb 2024 17:20:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] lib/stackdepot: off by one in depot_fetch_stack()
Message-ID: <361ac881-60b7-471f-91e5-5bf8fe8042b2@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The stack_pools[] array has DEPOT_MAX_POOLS.  The "pools_num" tracks the
number of pools which are initialized.  See depot_init_pool() for more
details.

If pool_index == pools_num_cached, this will read one element beyond what
we want.  If not all the pools are initialized, then the pool will be
NULL, triggering a WARN(), and if they are all initialized it will read
one element beyond the end of the array.

Fixes: b29d31885814 ("lib/stackdepot: store free stack records in a freelist")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  What seems to have happened is that originally
we stored the highest index instead of the number of elements and when
we changed the > to >= comparison was overlooked.

 lib/stackdepot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index 8c795bb20afb..af6cc19a2003 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -447,7 +447,7 @@ static struct stack_record *depot_fetch_stack(depot_stack_handle_t handle)
 
 	lockdep_assert_not_held(&pool_lock);
 
-	if (pool_index > pools_num_cached) {
+	if (pool_index >= pools_num_cached) {
 		WARN(1, "pool index %d out of bounds (%d) for stack id %08x\n",
 		     pool_index, pools_num_cached, handle);
 		return NULL;
-- 
2.43.0

