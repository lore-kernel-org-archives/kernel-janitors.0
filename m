Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779901B6D0F
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734099909; cv=none; b=MuZIuYX1mJYYPsRYJOnC+A71sOA8CC9i6UuurGiHv7W0kujJY7YcvrMzoluCdidtChdUrWCaStPm9+raG0fFBsMX+mp2dTbXt3258/SrZr/mp/zVnGs+bRuNFp4XxMpcj0yEriNJo0oBOezWaybiLMTi+C/xkeCQjVhy/xjxHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734099909; c=relaxed/simple;
	bh=t+Fci6Wr6RyAVUyax6WtlRrMWfMTVgsO0PXOjq1qZEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgfzB2KV0n/dgVOG8uje8Uiz1fYiIIBAXUyyWuR2mL6UtHxOubEDftQjv42GtxdTPJdmTzmnpjx6togzYJyiyuGKFWzaKKODC54IIs29BBhb6OhrvjAuqqa0zSxM7vhlKJgDyuSrGll5pmCz3e1zoPUame/KGWcnxrB84zbZgJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AsxJ3AbC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AsxJ3AbC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso3387688a12.0
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Dec 2024 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734099906; x=1734704706; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsEyhK1UDCh91BCy8kAzhKC4PcLtI4+QQ+70pp3vZ98=;
        b=AsxJ3AbCI0PyAe6FAajhwEruu1RTkZ4JvPQ7Bx5KWRRJILmQBq+IO08CnY4TOq6g4v
         nakKhOXX9GzlYTibyzRcujpdYzWLgsdg/r0xry6QLVDX7u0QHrmpotOwjryp82w/aRFu
         K2XsbX7VFEN3+E+9owMxx+MKxUXOTNVyabzQAtxD137bxWyvl8byX8+Bm308siFYHNFy
         o7IAA45aN3+1k5tQsMp6Pp4BFbO57YGO16rAJelDqcSz6bNYlJGdukNcBVui0BtMdXiI
         hz0MAwgFuU7mRlkeOVJRZUN32Q+6VoKjpp8xJvzBypKOUB4cWJ9loecv52cuoGFRYgky
         QE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734099906; x=1734704706;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsEyhK1UDCh91BCy8kAzhKC4PcLtI4+QQ+70pp3vZ98=;
        b=SWrDqwFP5o/25KGCDclTRI3/cL45M1lICec3UQ9o61Or+GJCQ1otaL1QNj9CMY3cAo
         jw1I935x9jOy/e+9u8REsRVYdNc83Fx/WmJKNF8Qhijdycrxt2A5m98UVH6HvD+ozmFk
         D35GR19f6huhGptnutGbc7q1z2ejdK2TXD/rR+Y06/T0l1I5PKBi8+tSK5+kJ1OU86ra
         dtGyWJDSvtyesqRzd9ESGQpGfCdW9qiStKWxkJrjk+TGS3ycUvfVHQ9d0lJBF2dsThRQ
         P7zxlcKnnIeUemGyLf2UqMOARP9BJWI4OtuLJaaDATkulAXPKbi3ZSbE2htKeGrMocny
         uC7g==
X-Forwarded-Encrypted: i=1; AJvYcCXZxsF2MziKg/jyWMw5+fwq9ReFDIGlqO2F3qQWdXxVGRjltDz+HkPRJBZ/n6sSL0NJerzB5yBzAJA01csdDTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEYiux5MFF+6JpoFEyZtatW7fKQbxT4zQbmBsdhcO76oUfmkY5
	yXIy+INhnrkek1Ub5Iwmg168nbOboFGIojmGIJy1Wrfar39PhWPO8PCvA96wXZE=
X-Gm-Gg: ASbGnctAdnw/DN2CQ/GW8wp6s4cw0k9GG8VVSX1Iz3bvoFehpkljZpWIUIe4F2R6Nnc
	Qya20CaaagQLk5ctr2xfsnlvDhIDiS39fAznroFk0w0Oq2uQILST0XodX95hqk/wsaVKQtC6E4y
	HEAuVS51Kv2y5mvU9j9jW+Ay9yBSDJvWrCzSz7/SH+SE4TU6M79dQHoDcUiHLXCO1TtK5mfNk8S
	JmEiXgfDHg2riG+H7c/UODXicEdiZ//nOqPF8yJPRF+NWqj85xDqsH4beTKVQ==
X-Google-Smtp-Source: AGHT+IF/x7LXkAXimyLkyfWi+pepsYvfRdlmpoLdzPWYXB9z1y+v2IhnIOSPg0r2ct1zfV9cRdMS6g==
X-Received: by 2002:a05:6402:43c6:b0:5d0:d845:2882 with SMTP id 4fb4d7f45d1cf-5d63c2c8e70mr2227780a12.13.1734099905774;
        Fri, 13 Dec 2024 06:25:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7349b44sm8530694a12.71.2024.12.13.06.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:25:05 -0800 (PST)
Date: Fri, 13 Dec 2024 17:25:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Chen Yu <yu.c.chen@intel.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] kthread: Fix a NULL vs IS_ERR() bug
Message-ID: <64c234af-5141-4062-9170-2122c3edf088@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kthread_create_worker_on_node() function returns error pointers,
never NULL.  Fix the check to match.

Fixes: e9853c812f86 ("treewide: Introduce kthread_run_worker[_on_cpu]()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/kthread.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 83bf73d2355c..922f15762ec3 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -1124,7 +1124,7 @@ kthread_create_worker_on_cpu(int cpu, unsigned int flags,
 	struct kthread_worker *worker;
 
 	worker = kthread_create_worker_on_node(flags, cpu_to_node(cpu), namefmt, cpu);
-	if (worker)
+	if (!IS_ERR(worker))
 		kthread_bind(worker->task, cpu);
 
 	return worker;
-- 
2.45.2

