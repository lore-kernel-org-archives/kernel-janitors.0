Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25755193088
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Aug 2024 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723206758; cv=none; b=dQSpHZ97UTTyvvlQv39R3Oa6B/wZQdPLGM8E0n86ClNxg/hgUkICQAhWhQXHZ6D95yQhsAspsol/ogNMvS/dKV5IoorIDEnkTxT0FzWW70AxD25DoaaeWpCc8a4nIziwD8McAFx5RZ7jL10lF9RhA86vMJeWOZ83bu/nlSy1ceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723206758; c=relaxed/simple;
	bh=QNcaoqLsaVCec6Cy7SIaExvsGVbtIi52cpW6p62gqfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ekOneJJJq+FroPppMFgfcA30jHq3kL6eQ6oiEb0ucSKMV6RdDb7KGcRhCSeacnMP18Ykk4hHg2XZyJUD5w3LNjyBEY883PpMpX/aV1BnQwBzIY+1cYvfas7b0ltnvaFOn1PssuCh4dubH86teOVXuceaBQZ2tdUqP4SgXeGUd2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IiRELPhf; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IiRELPhf"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f00ad303aso2529741e87.2
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Aug 2024 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723206755; x=1723811555; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XEvmrJApAdAdB8IUGlSUXCcZKgELg0TXzRkX9FYQA2E=;
        b=IiRELPhffhyMMLf9Mkhbx5pVy7wSrrlRl2m5A7RuUOv8hgePIATFegZEYow0ytnnl6
         3V4qbdwEmcwS76zXHfVbikZCgIMxwEm+v9T2g4hpTaZOOER71xh68PTrfVE2J6TQBcbu
         i4pPUAVNsPFyIIelLvbmmLcariEOS2P+f4JZaWh7JeiPu5Zl2Aha7HHQ2hSXq3GY5jSU
         EoJC8kysXtJEOVEFwu5iGGOLLklOEnMv7yKG4blbs0VpdNegiMrYJKKqlyQga/iEjQWh
         Nbh6gXXEnAdTR2q3eYMKj7DyBvYMKWh4ufZIRgCe9UcEaY3Oe5V8kd7WBaBp0JaEh+TO
         XOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723206755; x=1723811555;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XEvmrJApAdAdB8IUGlSUXCcZKgELg0TXzRkX9FYQA2E=;
        b=UbqBpvxgMs+RYw0+5n7UQEo5uSHWjGGrpi40IzhHMyjXCJuW718y8cxrIHXfy2g7pN
         ennbIzAgaLcLuuBEuMR5ELesSXbNpFOxxait6fByYERuQnWCtiLs+AeyI7N9/YqucUym
         NPQ2m+9afqIC5C7PgvXje3ka5PUHS/KMhNNPJv5W8WpMgBUaJ4Y+F8O7a/X95Qu/7Dve
         6F3D8xMGm8nnC9cJANkhpSj5SjzpYa0tR0pkLS+pZwyTNdaf7//2BLwDpVuhv5kHqFkl
         6mo7lwyOlrUp7LaQvqyTqGcfxW1WaqKG0lxkyKplOVm0dukYiXUjkB0qomLPtdm7jgI2
         NjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+wl6wOGY4LfdlFoYkJozYljRtNAV6IwhD5Fe7Lb07XixCsMtA2G1zn+dfQNgMLqgy7sTKynMZXlVA0nKye9odkaqeIqkjpR0vtrC/CedP
X-Gm-Message-State: AOJu0YyYYl6Tv/e3tAm8YrOcZIA1gV9ub9J3IEDW5W3blIbIz8YLPX8m
	q6pGWi4+oHnSdQ+k2sGMcic14hRXyMLKmrBkbZbUmYzaA8cGVo6qgGdsPVIci3xV8B2JoDkINPK
	I
X-Google-Smtp-Source: AGHT+IGzPu2doVLDNZ6syQ8+456inTtlzazWj4IP4I0oNXM1Sz9cwjKQLoWzh+mGsvT5bHuN4rBo4A==
X-Received: by 2002:a05:6512:3b0b:b0:52c:6461:e913 with SMTP id 2adb3069b0e04-530ee97436fmr1248689e87.16.1723206754996;
        Fri, 09 Aug 2024 05:32:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2bf8666sm1495151a12.9.2024.08.09.05.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 05:32:34 -0700 (PDT)
Date: Fri, 9 Aug 2024 15:32:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] selftests/mm: compaction_test: Fix off by one in
 check_compaction()
Message-ID: <87470c06-b45a-4e83-92ff-aac2e7b9c6ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "initial_nr_hugepages" variable is unsigned long so it takes up to
20 characters to print, plus 1 more character for the NUL terminator.
Unfortunately, this buffer is not quite large enough for the terminator
to fit.  Also use snprintf() for a belt and suspenders approach.

Fixes: fb9293b6b015 ("selftests/mm: compaction_test: fix bogus test success and reduce probability of OOM-killer invocation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 tools/testing/selftests/mm/compaction_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/compaction_test.c b/tools/testing/selftests/mm/compaction_test.c
index e140558e6f53..2c3a0eb6b22d 100644
--- a/tools/testing/selftests/mm/compaction_test.c
+++ b/tools/testing/selftests/mm/compaction_test.c
@@ -89,9 +89,10 @@ int check_compaction(unsigned long mem_free, unsigned long hugepage_size,
 	int fd, ret = -1;
 	int compaction_index = 0;
 	char nr_hugepages[20] = {0};
-	char init_nr_hugepages[20] = {0};
+	char init_nr_hugepages[24] = {0};
 
-	sprintf(init_nr_hugepages, "%lu", initial_nr_hugepages);
+	snprintf(init_nr_hugepages, sizeof(init_nr_hugepages),
+		 "%lu", initial_nr_hugepages);
 
 	/* We want to test with 80% of available memory. Else, OOM killer comes
 	   in to play */
-- 
2.43.0

