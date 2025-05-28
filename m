Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DBA2517B9
	for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748420033; cv=none; b=RsUP3QgoR3CDAPUourMr0/NcwUoJED10F0w/Dw/5JQMYmqPpGThruhGx/4cQ5PzjBl4noJgB9e8DJWe/aDc2HWP1IrJZVoKbmSCLN31Y1rbR85suffokYJB0uxhApGevFMVXbOxB6xSGnVbUFlFemcDph+5g8ZcPo3ffficOzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748420033; c=relaxed/simple;
	bh=+Y0uRBfTZif9EgODttL1hBd9w/+qxXwFk6XTnVGQ7A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+2DcrJzaTgunVj2EB2RurnepHIW322rBqHp+LODecvtiGiVOGE5HNaP/eItTOt5lezPUKKF8jo8IZu7aPdsHqUkz65jKBp8R2fHIRpJOWakE91KKICYgA67mCR5lGB0xujSXvQo1MWackkxvP8kFO0KunhDSvJ24yOnsdktFcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agntaPft; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agntaPft"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso44895715e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 28 May 2025 01:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748420030; x=1749024830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0yiIdr8kiMktQtzAz6WMndkMTPinkFXHlilIDGPLcU=;
        b=agntaPftrRvV4F7X9Oj+/cKV/e0sHa8FfLilHUrVFjqtxoftC0P9RDT8IwTvxmwK80
         rJF5xHU0xtuQGhjrdXqMkw0GVhu2HY93CGnlP3cIueqZWggD4VUdVDtBrtlW0e55xv6Q
         1jhHACcF1A9soWM/Qh3IDjs3leX353g/Nq2w2nOR0FqizTIwvoUTPsaRFFCnR2Eswa96
         EAcDxoZYAScvFmgM0UIao/pdWlpBbTxB8xgh3othv1n3BaK3gWe/1Pzd+VK5BdVt4y7C
         Ou8dVT1f0JGqBHm7fWqK4oIunxoeAeMOOt0bo0IxtgvX5N8iSjwt/uiQ9mFnByl48vbP
         yFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748420030; x=1749024830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0yiIdr8kiMktQtzAz6WMndkMTPinkFXHlilIDGPLcU=;
        b=tpagBuhD6R1nq8/KSiskhqXibVmhH3N96yqYBVES+vvuT3c5cTahkxAFfGhKCbBnhA
         cMXHP/y4gFLoeccWJGUDu6kwmzA7K0ZuTkNFijqajj+8/wfU0DETyuGoZBWYEloTS0ko
         e5/xubcIbDfkY1QVUhW5Xcd/mmZkI4HnXXMlQI807vDpkPKVj1Eo75oq9muK2S3nE0Me
         KP3VBDyV+ESNHKw/rEcKOA2OUs0UQGd4KIwWcPatI4dtjbvMrzhDQSOjluzQPGL/AoTE
         nfCSuqf8SZrZjy0qVN5r1TMpXmlQLcacySmQygnyZPkDe6okSdppgwJnuXXhYowM9O89
         KYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHOBUqiZZ0OYBtWgHBf93gvqGllIpzIbkjeUJs2HjS821Oe9DhGj/xIll/kKU3amSHN51pynMb8YYpXraex/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXcR18K4MBkJdmmRkf6giwZ89yKE1PMENHaQRgN9bmhD4w4Fkj
	YI1FMYocDeEAxbUEdfzY1ssZzvmPM5nO3e/DAKgb4TS+JORvBbDAdHgnusJ/QXZECIs=
X-Gm-Gg: ASbGncsnlA9CM0xlBm/Jxa4JixtSXUU41DQNZy6KeIGmgfCXFkLWfuWTLiwNPZlU4m5
	C4I9lUpI5zcnjp33XMCmG8i1HFoIG/fHKJkum2amJf6ZtjM4LoIu9JZySb2B2Ffku4SUcxbpOlZ
	tPirSsSLCjnQVMTj3TLksJYI7BgdUkUjckc1WwqdpPyLayosfkbQAZmyi9VOwxrN9PoJIcsKRO0
	GF1KmS03SiJ95qs1k339ymf865WvDLQs1Cz9hXywtFQT0ZRfFxzGnWBvtsEfawbe/eLkavNGhfO
	KwgFncW/7qh3/uudhIwojIvZ/b6h4Nip6n42ctB4dqB1dUBGqQJZSiDB
X-Google-Smtp-Source: AGHT+IHwxFIuBvvAastdxx+Kytl7VBX/kiaYR4D/z8QcwH+3DXyCV3M1g6v8ommXnYfifmpBZc7UkA==
X-Received: by 2002:a05:600c:4683:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-44c932f9572mr154626255e9.30.1748420029682;
        Wed, 28 May 2025 01:13:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45006499727sm13341795e9.3.2025.05.28.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:13:49 -0700 (PDT)
Date: Wed, 28 May 2025 11:13:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] tools/testing: Check correct variable in open_procmap()
Message-ID: <aDbFuUTlJTBqziVd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Check if "procmap_out->fd" is negative instead of "procmap_out" (which
is a pointer).

Fixes: bd23f293a0d5 ("tools/testing: add PROCMAP_QUERY helper functions in mm self tests")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 tools/testing/selftests/mm/vm_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 1357e2d6a7b6..61d7bf1f8c62 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -439,7 +439,7 @@ int open_procmap(pid_t pid, struct procmap_fd *procmap_out)
 	sprintf(path, "/proc/%d/maps", pid);
 	procmap_out->query.size = sizeof(procmap_out->query);
 	procmap_out->fd = open(path, O_RDONLY);
-	if (procmap_out < 0)
+	if (procmap_out->fd < 0)
 		ret = -errno;
 
 	return ret;
-- 
2.47.2

