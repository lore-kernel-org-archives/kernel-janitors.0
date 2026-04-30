Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DDA46AF01
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 18:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572904; cv=none; b=sQxVk4dp3cZFCyM8NMZZef9JNgOuSrDbQN2BTg9LQQb6HRy6b40qVMt4yPFNRrbBy4dXfxNomy3TYTaTrWScn8aRycOO2tMuRHr+UT6jj3b+akTq5oj4SNpDt53fx4J3ecXfP1UdEOi9aSMsC0LWT5PSuEIXa9PnYbEiEkjViG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572904; c=relaxed/simple;
	bh=m6tdW/PyQ3fNJU6yi+8EeeFjX1bF/Ohn9ScCCVCvGIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mVJ0Nj1uQKHzcJy2pDPjHycqlAADK+vGJ0BiYeZdh80Bu9Z6lSm98CMwSNQGxOi52kblwi7q3H6OmWOK2dtEj82HfQHltzVBxtFhaDjC5ES8Z+iUPu0NvRMlgomRifzT5h6yeKCA+L9DZRrN3KaGX4EsHol2degSHp6h8JQyvTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw7QO0XM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw7QO0XM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso23230045e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Apr 2026 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572901; x=1778177701; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+odbWKzhO0lfnlkFEGcDKWY0FJZ2otqINMazPnX9HaE=;
        b=Yw7QO0XMbTWPlEXaF6T+ZqA59UIkOY1YI2/jjfVvcaO6eZRJTbBB8rEbGtlqyRCkPm
         rIAcr0ZvB22jCsvkGaurtW5pQdgPzJOQ0EO0KT2rd1ngFSPV2YpQJf3ZLnIQqqcJHEoQ
         aLebphH4uibVGpzDzuY7dBbBEyncXy4JV3QyiNb01e01/7sXTpzPl+mSV/WBlJhhoc1v
         lf371prH6AyIQ5X1zpXiBnStdvKmVVDut4X7ldHSnBgYkZ1qWtxAUwowQdmL9RVn4naz
         Qfvx5c4dypBbCjPALKqD4f921kjWB9z6Xqxv0ay7tgQOf9XqeinLCUdF2xFsNu9uluES
         wi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572901; x=1778177701;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+odbWKzhO0lfnlkFEGcDKWY0FJZ2otqINMazPnX9HaE=;
        b=VGZeqXfvY985S88MZvY1IErWewpoz5VK6Fk5zfGVRu5VPonO10wlLkdawVzS9fuBaX
         ZiKvDaCKe7uSGwkBF+jPS2yl3ykSAIdopiH+08p3f8YLUK+Bpp2j1cHDIizcDqG+CQrI
         WqrLAK8F1BkWX4Z+/jn0H11bg1ThIk2m1Y9vpW6+XvDQBmLGVkW6T0pLj5fJNiWOwKJ4
         qigZNlXrFOXeGk8pK0GF12idCYIXZEW6jGEJZxlWD+o5WTKD+pN/c01KgV1RGqinTbxQ
         UHjk3VEa177WjOBnDerzWXn8mpf83WS9GU13fOX0lwfwHuro3FT6KIB6lG1l3Dl+IxW4
         srnA==
X-Gm-Message-State: AOJu0Yw9kWFpDFDanyFGBIJDo3Nq9/ynK1Owk1iZQGyDoHy+BVhpEDMD
	it9yJMRm3fA9PVIGkQTHA3NEYrwksOj4JFnZQAPfdAAoK/69WXg/c6X1
X-Gm-Gg: AeBDietoTJW85dtrxPGj7gvfWiF8/fvkhsPCgbopNWk4vI6LSzKbERpsoJRzJMbMfRi
	EcTQA17XKGWCLIiAf/+tVEowpONeR+ntAGqa7MnnJNxASoWp7hr9uUdstQQcvDpmbp5uPmK7ofN
	g4rGnhC+9mvvM/R53oTvANvH+Jsp3biGd4uWTtic4tsXYSUdxhVaiR+lbt2RTWGBUbfx3spe57k
	fBJA3O8WUiORClQIjR3F+ww4xyMhv5mCGnPEvHT0TiUkVM24ozGit2QEIJ5vZBAy/r7cd55LPtg
	y0nGT9odfD4b4y8A1Igu6XXYIBAuQGUGdbrR0Xc4vSj4OcHpoe2GAeH4s4yqi/UakynrAPbR+7Y
	UYJ4XXhaoNVYlMOtrCDVZDL7lYa23YG4SXk4xaNO+EvH63OOJFBKQHICu/mD7CB13itMmqvDd+I
	kChrDXekzD/ThTkcDsCCFezF/BQ5fefQ==
X-Received: by 2002:a05:600c:8b62:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a8609bebdmr62229625e9.14.1777572901228;
        Thu, 30 Apr 2026 11:15:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c324672sm46413585e9.32.2026.04.30.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 11:15:00 -0700 (PDT)
Date: Thu, 30 Apr 2026 21:14:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Potapenko <glider@google.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] lib: introduce test_meminit module
Message-ID: <afOcIan1ap9kD26M@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexander Potapenko,

Commit 5015a300a522 ("lib: introduce test_meminit module") from Jul
16, 2019 (linux-next), leads to the following Smatch static checker
warning:

	lib/test_meminit.c:390 test_kmemcache()
	warn: bool mask is always false 'ctor & zero'

lib/test_meminit.c
    378 static int __init test_kmemcache(int *total_failures)
    379 {
    380         int failures = 0, num_tests = 0;
    381         int i, flags, size;
    382         bool ctor, rcu, zero;
    383 
    384         for (i = 0; i < 10; i++) {
    385                 size = 8 << i;
    386                 for (flags = 0; flags < 8; flags++) {
    387                         ctor = flags & 1;
    388                         rcu = flags & 2;
    389                         zero = flags & 4;
--> 390                         if (ctor & zero)
                                    ^^^^^^^^^^^
This is like (BIT(1) & BIT(4)) so it can't be true.  Was && intended?

    391                                 continue;
    392                         num_tests += do_kmem_cache_size(size, ctor, rcu, zero,
    393                                                         &failures);
    394                 }
    395                 num_tests += do_kmem_cache_size_bulk(size, &failures);
    396         }
    397         REPORT_FAILURES_IN_FN();
    398         *total_failures += failures;
    399         return num_tests;
    400 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
