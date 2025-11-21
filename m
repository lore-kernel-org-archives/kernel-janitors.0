Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF52834D39F
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 13:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732205; cv=none; b=O1taSwf6IpsaOOX3HciDwuvkpW5LvLnKovuJuSbTbe7cTvo7hWXWrB7c77bi5MuKegcSxB6YOHG6a5wqrCwkqjqL9Z9fqxmFhU98gX+NZQuCZux+ENbUkqZBWsx3ByX51rb1c8MbnEhlCwVPJs89oNToToxpfEivhpwy5iGfmxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732205; c=relaxed/simple;
	bh=uE4HXHI9Mc6ljZxrgmkbsKbCZ4Sosf3M2ARYwEUQLlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lj6h0jSEq3OEUv5dxXP2QYyBY7V5CV8SeNZp32ErwHrZpx4jLwPdkHHCqCiNvrZ31lLuWcYfkmY0LT24RJCqysiGFpZRwjeYjpXPtedfqcd3mFGmtbDvSMmhgsxVlyaL2khCljE6AXHqa3GWfRilRp1B/s234Hxp1fb7GZpZjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyYRYvTi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyYRYvTi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so17907505e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Nov 2025 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732202; x=1764337002; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TzEyBCas7IooWk+MKSQXAh7ZMi3I77yN3jnhiz/DdHY=;
        b=eyYRYvTif7jhkC6JXRvPfHTpJQ8u1zzc1UG49YcTT3rMWYe/wWl+aziWGD6MWczsMT
         PHCTJSZ2JQuLXcPN0lLN8B5W3C0KEW6DahfqcS7xej521azRDgHLIpfcoB01J3ycqiPp
         uQ8h7x4WUEBwMZQmydNH0e54iAN+lM2ECEcD22mYvsJTSs90lDahz5Ms6E3RIEtS+VhV
         jTlyVSCx/8/kVc5hw9Tn6S5v4xkjhfALdyzxW9NzJugAitlManU0/tRKHwZTkG1jEvVy
         UC87uaLuh7bUvG11tpcxD1UUDHnwV529xsObi60wYDXHABS378SUW9UCTtvFWNhOu6P/
         n+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732202; x=1764337002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzEyBCas7IooWk+MKSQXAh7ZMi3I77yN3jnhiz/DdHY=;
        b=LZYn4MJaUlVm+ZagjJmb4rTTpaylbGdQH7AOPeqaSUJqY+4tuHzauSl6YxS9p2uoZS
         +aarxx0ij1KxSY34WFpwPHrg+SZKxY1X0JXmlUoaLIqrocpj+0RnwYdvXeG6Mx9/KZHE
         YwPP0YFo3er+VHTljOYiMpz8FfoGzOisf9ShH3Wkf/GDGO/uVbHQ+GnoZxCsSrWZvwDU
         +1k4hHDo28TIk8WJotftzxi/deTQth6eqP3YJnuM91q7+YsZj5AGQT/utXAKZT+nqu8V
         AVpNW8dlLPq8RtIFC26GgooIqQxWyGQqlMYBHVZ186Ag/ZE9Ii7m3lXNu1xU4Qe34ILo
         f7Ng==
X-Forwarded-Encrypted: i=1; AJvYcCV+/oV9hx1oUXBuFJUM7mz3MGU7zbkazrxvid+dbLYh5JGjgN7rctmUrzj5riW3S7Y38lnIU/ko3UvdIRu0lZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxizHchFK4lK2If/MC22XVOdTzL7r+nC+QcbV039cjBB+5IkDT
	3RiFCQ+iY9vpR1brBEHhOvKQ5NqTkhm2UM5qVZzw8NTF0fVet1jbgtmssmPOMvM1c+0=
X-Gm-Gg: ASbGnctPHhA5gnDzp2u2N40di18tRmZ+X41x3js0hRuTnuyAOQJhDif9cY6RhXnFmly
	VscNfyMlxckYKlu1Sq/XfxZoheaEsYNSbi5wQ1h/XTFmOkfJPj2f1HjeeFx+MkIoMuDCl/k7q3y
	hg1508PVbc2XUFZwuDyQP7n6ycO3nIGXGv2p9DfgQE10QQY4ZBrwsLuQ1ByuwOvqZacywFiqKbW
	DKCvLIJOEJmp9XbaB2Plgh9gDHHcALDXh+IikJmfWE3k18RGuDo2Vbo9NC05BJZ9nHGgl3Xk7It
	CKzSG0O2HWebmFCr/T9aXT8sEKcw8rp71EZ3yefhCEWyu5F5a2wHdRYtARcIsRszSUZoa/DijVL
	y7omznvnTNTKOKtzfCWHHUBcH8lNiq8JomuGa67PJzKaTgzdHYxyv9cCXByse9CZhoxXjzQwYQC
	X3eYFIb/c/2BmNU5YD
X-Google-Smtp-Source: AGHT+IHn72BgHYyXBAFrHrkEPwDLpmHZJhWH76OVXgjki7oj4pfilEmGcsYHhJxsG+r/JbIMusA7sA==
X-Received: by 2002:a05:600c:470d:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-477c01f4f4emr28632935e9.31.1763732202028;
        Fri, 21 Nov 2025 05:36:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf3558d5sm43686925e9.1.2025.11.21.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:36:41 -0800 (PST)
Date: Fri, 21 Nov 2025 16:36:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] mm/damon/tests/sysfs-kunit: fix use after free on error
 path
Message-ID: <aSBq5uSPIqsqH8zO@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Re-order these frees to avoid dereferencing "sysfs_target" after it has
been freed.

Fixes: ee131696794c ("mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 mm/damon/tests/sysfs-kunit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/damon/tests/sysfs-kunit.h b/mm/damon/tests/sysfs-kunit.h
index ce7218469f20..0c665ed255a3 100644
--- a/mm/damon/tests/sysfs-kunit.h
+++ b/mm/damon/tests/sysfs-kunit.h
@@ -76,8 +76,8 @@ static void damon_sysfs_test_add_targets(struct kunit *test)
 	if (!ctx) {
 		kfree(sysfs_targets->targets_arr);
 		kfree(sysfs_targets);
-		kfree(sysfs_target);
 		kfree(sysfs_target->regions);
+		kfree(sysfs_target);
 		kunit_skip(test, "ctx alloc fail");
 	}
 
-- 
2.51.0

