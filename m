Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05F14C7D
	for <kernel-janitors@vger.kernel.org>; Sat, 13 Jul 2024 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720832592; cv=none; b=PyVbYXUW3ZwrJAA/XNXkXSCb/2jxAalWEo+uZc5h/n87Y2alpDuKpbOWRFijaWKDHzp1bSDTPZAhs7N9TmpTjPYFnhXz9OST9QznwdD72XTW1ZqKByCWbcJwoc4CzCIX4+FmgdZm71hZUjLuTZ6OhqxGXboW33x2A9wzjyXPF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720832592; c=relaxed/simple;
	bh=UNBl82bWy6BK4QvIg/lANifWxpGzKBqS6jSOUjWhy2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kNJaL0Dlu1Bq9Zsxn5RkhlUpeKz84mGZuyCWyZy2G72JbXkoLmjwm22bJ1IbJsE3vlE7QhmO1C8u/zCP16Bob+RhKRQPGsscGz7qGXf4LdDCl6L7lG+W5miVouzsP4D6v3qwRKdy2HDnRT7/7uDAlforvDoRmJWPauGSwKSelLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjotkBUe; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjotkBUe"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25e400d78b0so1020988fac.2
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 18:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720832589; x=1721437389; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXBzGKQHzwTCLNi/QbLQ9MxDBvRYj/mrMe6mJtSFLx4=;
        b=ZjotkBUenoi/S9I65VkyteuUmkLaZ8Lm+s/Bzt9Lt52+i/vuz71szXzpEdsx+Ln9SX
         9sInb/YjNLygYybZ7qzNeKLn7P3OmXwN/hAIDU3LRSNpggbzZ7BXzdmYqlGhj/A0sK6O
         mWJ1RP/1turoZNxlQjmsC5mwWR7KicSnqtDM0wnmyEAf+IUrGRA3kH63QLuvzoL1Mdmc
         BM65ZO3ujqCS5Ru/xdLRt2pzVeQ//Le5iIQgA+SFiAZfV7YzaJFlOKXButr8DvsotLWV
         bZvkbB34nlIYLHXH5EBLtG+DdQV/giYwWBzSvMBGWrVbXKArAlr9Pq+byan2O/WlPmjX
         bfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720832589; x=1721437389;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXBzGKQHzwTCLNi/QbLQ9MxDBvRYj/mrMe6mJtSFLx4=;
        b=SM50vVyCJYP5Ir3O1w5qMuxpepk0pJiv7uw4MWQgv264yOuBnp3Q5FIzoKfKFF/pj9
         swoaI4mAEak0byjMePvG/sBQH56KSYccKjEJcxppL7EyY2V1f99xEw2HW4qvg+ScyBQt
         mQU/LLzG045K/PmDuw+p6n6q1Mrwd4Z0Q1M8Mgh2UFGzHQOIRvafZfyc59+HNN2QuL0N
         2seWbn16y1OTMjiik7Bj6gz0oUz2MRCISt9Ejn9l0mJ3oGQhaLFKScZ6F3meDgMZm/OU
         KsgKcz9PMh5La62MUPUf5exq53sScVk7az0phdqT4AN2YUUlPsuymxtPJqJ9UpE9lhB1
         S6jg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Hrh/yEPvCQMFsqXfkpOv5iXxSXdL5nEppFzKqajv4LQiEn0SIHnKXw1RQk7QqRc5WPToYxCZc40B9E+MK2zRHMlTvQ3IjeOz/VI9kzlW
X-Gm-Message-State: AOJu0YyROS0mc5BXnOK0bGn7mIkyCBricoZcKCJ4KM+hKslYP3HcjspL
	9Ko4aounWPO4fsLSkEwl+Q76z0Ir5UDmjKJ+4RoahRt9B/scqVBLFY/TXFkKbCg=
X-Google-Smtp-Source: AGHT+IHrcn916Hce1CRrEs0ecid1zN7rNG5C1ltGgNYwmbOmsJO2nacySkLmcuDxq0DTDMpveul2Gg==
X-Received: by 2002:a05:6870:6587:b0:25e:1061:6541 with SMTP id 586e51a60fabf-25eae75e8f4mr11263510fac.7.1720832589608;
        Fri, 12 Jul 2024 18:03:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1cb1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2607530524asm57773fac.53.2024.07.12.18.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 18:03:09 -0700 (PDT)
Date: Fri, 12 Jul 2024 20:03:06 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tero Kristo <tero.kristo@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/intel/tpmi/plr: Uninitialized variable in
 plr_print_bits()
Message-ID: <8ccfab0c-3c11-4168-a383-19895ae60022@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Initialize the "str" pointer to NULL.  There is a test later for if "str"
is NULL but in the original code it was either valid or uninitialized.

Fixes: 9e9397a41b7b ("platform/x86/intel/tpmi/plr: Add support for the plr mailbox")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Almost everyone automatically initializes stack variables to zero these days so
bugs like this don't show up in testing and we disabled GCC's uninitialized
variable warning so it's easy to miss.

 drivers/platform/x86/intel/intel_plr_tpmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/intel_plr_tpmi.c b/drivers/platform/x86/intel/intel_plr_tpmi.c
index c1aa52c23d25..2725a1ddba92 100644
--- a/drivers/platform/x86/intel/intel_plr_tpmi.c
+++ b/drivers/platform/x86/intel/intel_plr_tpmi.c
@@ -162,7 +162,7 @@ static int plr_clear_cpu_status(struct tpmi_plr_die *plr_die, int cpu)
 static void plr_print_bits(struct seq_file *s, u64 val, int bits)
 {
 	const unsigned long mask[] = { BITMAP_FROM_U64(val) };
-	const char *str;
+	const char *str = NULL;
 	int bit, index;
 
 	for_each_set_bit(bit, mask, bits) {
-- 
2.43.0

