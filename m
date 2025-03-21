Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D93154426
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567737; cv=none; b=I6YE7TSiILI7EIm7zh0+wFe4Mwdh3qshWQe5PlCMN1YavdZppryIQCgNBR8c/Tu8N0aV6GtckXL1YZ+B6kfWY+ao3F/kRoNAwGXBYR8K44GAuN93YGcPixwDca64q2LgerJ0PJaqSB6F5nJCihE4RMy874vGr0ncndegje7S59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567737; c=relaxed/simple;
	bh=jOvj8sUhQOnWWb9RP/PYMDVrKj4dgjPG61k1ISynHeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p8Vy1BoCWxL9h/PVYWlluREZlZHnJlqLoajyFs88RKFstz0q/pbhnUOBeXeL0XxrtgbEJkarPw687ufZe8dKCTFiybEFKTe+gQMIpbMXNIFbbneBw07SNH/IbNN18b2uUFvK1pHV8aimWCXFbnY5gycFZamwnWhJAH2rMWFOYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHAc0U9f; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHAc0U9f"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso19557435e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567734; x=1743172534; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePP2nkQSnuEG/AnhVnMeNi8KNMe79AtuZeTxXxzHFJo=;
        b=IHAc0U9f3RG6Wwpu6N7vtMeH50i8WZeu58gJXcBTFuzGgAs4nWodu4GIxCbxrgDrEP
         juIpsWWU2hi+7KrGOSNBBIQKLP8Zf0RuwkK90NngLHL8xZBLL4+lnYQ9oZSpJu6prA8w
         prdaO63mRm03h/Psi34Dyxe+M7oyth3aoSDuHFI/HcqyM2klwC+1Nx+X6l4JVjavHTOH
         mSx9S3QA0oSNpRF/VgyDQIssDDEis8DW2ENXhqNQIORqfvv7O7xn2+S5rB5vJHtgg9A1
         skyY/tCiX3pF9qBw55rk/2hqwdXBby261+F5XiUZOTL+4mii0IUU/WXazhDHWh0WVPo7
         3egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567734; x=1743172534;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePP2nkQSnuEG/AnhVnMeNi8KNMe79AtuZeTxXxzHFJo=;
        b=ruHixfK9rMBSYyu0SGtZQ10Y6aKwETDrYdGs09+dRXBM3p2t5q+T5bk3yuWB2q1zPA
         F0fCswl/vK45hJ0KtgAC0z3ccAxo+BmDeQaNydURLsFw/DCagvMxxzPMysa0pN1bKXiA
         88ovC2obo/6rWS5tGO+bbTv4b4mN9OHbBJf7YFrbLiDxYGTxFWUjWtbwPiSZqN3qFl4Z
         6z1rO/qDem4kNYQszMMODoY1ScBYeIn1jKMdOTbzuYU0g0VQ4Km5RY2yF4I70KMQMOqf
         jXyGk7x3PGOw4CVtWiQXGCN2wbii9MsrlM0Fn5GeFoY2EdMbbRIEdYgGEgD2aw1Pt4e2
         roUA==
X-Forwarded-Encrypted: i=1; AJvYcCVRunOQ9+7WdpCj3jIgYcPlPb4KVMO2pUNmDbjV8OJBZHsLCWleytnLXh6SZAGP5tUx0xhjwZwPDdTv562ezlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ2DLrlIESY7GwMv0P5SaX52tmyS6i9HcruRhgLHFzqi95UN8/
	nIjMQ6l+VxCmiTuokL8L7/iOy8w28lvPSxXlIGHLA2ZjcV3uSc7Nt8ViXhOfeVUEkjomJVxOV0v
	I
X-Gm-Gg: ASbGnctXL4wX9N0PzQoCQeoQFJii+eta+xqKnb9qJLsMGupWGXZraOWSHVlx/BBUvfr
	1I96LHgMfWH2HOIJ3meaWUtKBzqv0htqmXu+bzkqXvRy7HMSrWBe0GNfqy06WmxEDNSATE9krbg
	wOeiLFRJEOpfmPyNylz1HEWr1zPD4a6NeizTcaj7TwcVwNceCtBx23H3YPOhEk0QD5FOE2Y6F3y
	SPnZS8xSN43lbNqNmXQ4uMiX0kssmzMrUdXxcYMWgrB23blT8F1lR9ewqqAhrX8/dfCYHILBU/z
	oEROTMW5GbeC2kW2fgzUM+3Vp5uZ+u3Hld6R11VE0Cop7/Fi3g==
X-Google-Smtp-Source: AGHT+IHo3Yc3MCPOadC9UN49uSmHsJsixyIQa4snXxSgTEg4SRqx8S+qcU3YVR3JJisZ0M7ofeV/DQ==
X-Received: by 2002:a05:6000:1842:b0:392:bf8:fc96 with SMTP id ffacd0b85a97d-3997f8f8be6mr3252239f8f.4.1742567733638;
        Fri, 21 Mar 2025 07:35:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9eff6esm2504188f8f.100.2025.03.21.07.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:33 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] Drivers: hv: mshv: Fix uninitialize variable in
 mshv_ioctl_passthru_hvcall()
Message-ID: <97036225-597d-4a2d-8f51-7310757b9929@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "ret" variable could be uninitialized on the success path depending
on if "is_async" is true of false.  Initialized it to zero.

Fixes: f5288d14069b ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hv/mshv_root_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 29fa6d5a3994..b94d8fe0f691 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -151,13 +151,14 @@ static int mshv_ioctl_passthru_hvcall(struct mshv_partition *partition,
 				      void __user *user_args)
 {
 	u64 status;
-	int ret, i;
 	bool is_async;
 	struct mshv_root_hvcall args;
 	struct page *page;
 	unsigned int pages_order;
 	void *input_pg = NULL;
 	void *output_pg = NULL;
+	int ret = 0;
+	int i;
 
 	if (copy_from_user(&args, user_args, sizeof(args)))
 		return -EFAULT;
-- 
2.47.2

