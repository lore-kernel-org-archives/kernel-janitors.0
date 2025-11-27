Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D936314D3E
	for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 07:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227671; cv=none; b=VxFwMI7o/daCCR+9NBcZVpsho+llGp5TvCxr3UP/FM9tV49LebyFeVICVRSqd2kZUH94tKDJCNXG8Cmb9eDg11PVR0rdgR2gAwlF6o3NDYXTP3yXIqInlrUTKwk41T9bhFF9PlpyrS6qjpUypRDxL0iuHrXl/nrFIZKfoUfJ7UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227671; c=relaxed/simple;
	bh=mdkoxkxeU7ykpNuyFLBJbdhmGSBV6NdlT9B3JjTOWAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1MavrW8Ktic+47hlCVEBMSsA3HZKgUnY/kxWwiqKbAYoAUdYoPtLOnz6NrPEEVN7WaRbeoUZs+Ryf4vSQKD9bAusWnmMRo+kmGRkzJ8L93kvEpJNQVKm9Z69CYDizpc2+YuGrdpS8aGR1wd6EAegJlh4mKzecK/I6vwiwcdNSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7RRzrF1; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7RRzrF1"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b38693c4dso221729f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Nov 2025 23:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227668; x=1764832468; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GplCav842hV/Nvc763gp63uharYZd9oV29bPvsaZ7c=;
        b=Z7RRzrF1DP/kyTLJyQihox71sYsTsxGr+y4FUfFwngM5VNogfL4D/kjTOiNMB3FnAI
         BRkbK3hSnJu9TevRN/MMfY6xEiT9G4U8/LIPCoHhb/v1J4FCCRJJ2EeHo7f0CXtOg42L
         7VMyrPfAPEsF9EFlU6C5GWEuANmzAM9SLz5t8K1OrVHGIlkyTKfcIzQJjxuVemJLKze7
         WQ+zIVgfcbUUcXnxXFBQhP9NLH1221DAycwnLHsCIrJQKLZSxqu+TupGa3Lio6H+C2Xx
         4f94hLnOZ8MZuqFT0kczmHO2cbqSqaDWA/Fa0u1mBy6erkyF7YWLoIMlUy4OtTlpmCMS
         ZQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227668; x=1764832468;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GplCav842hV/Nvc763gp63uharYZd9oV29bPvsaZ7c=;
        b=XTQis3HSGTomAqymwvPR6ER3IZD8l4to3LXVOBPIGTD6Wz0YgCXBDwpG93haP13jnq
         1ImsQYbD5I2a2uBYSvCs1aAQjARpxjtFEwfoRky3QPw6ECqOsmjyTAOuzw/I0oFzynYV
         sjVSJrXHumGi7U+IxvEj//1O0ZYm3zTx4h5AEEy6eaVMCoNBAoIlb9Nivkq9QXUmeB9I
         CBncnBlixlqFXbY59T0UNlpPz1Ed7abSjDuxBIKr+06kvZgybivNUZKX4XPl3hyztVHh
         iKRL/xwMuolkEVxdYdmQnv82OhSfDoZvCYbgrakXjISr/xqq/vHPndAA/nuOYil5aNUz
         4cnw==
X-Forwarded-Encrypted: i=1; AJvYcCWGDjXkx2YNLQNu7ftpVwpWezcQY3IP/khIrTAVrRaeo9WRObg/xXVevDxvJNe7po4nouf9mAJL3YpuBdJnX7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YySVjakrIWXevqdnmwK8xuDB3YwyvkZoxR0rKEk+tTFMuMbsSIA
	RcEcgfFOOHJVSCHC3KdPpdT5JJP980QaHOC5MDcguLcBDv0yycNNFKKB8PPQKRh1ARU=
X-Gm-Gg: ASbGncukJpLcx7og9Ms3dUsSexHphKzoyxIjYHpd1J5Pa2ubM+9rOizfolfGvo/tC1K
	M0MZ0pWJcbnG1vKlSwejE3mZDtrhBGLvsO4nzXg3Aopax1moJytI1PI1BDViStb6EvxHkaPqPS6
	fR9jD7XClx5Zx+s7IQuqYrlFU7h/CfbxRVAoqcyKpKawCj8ucGCdLNL4MWKaQtYGvGfJFaikQW3
	2kUkSS/j+3ooSkOH4cqZ7LnS2Vqio1QC83STbL5MQ90KCqi8NFQlfzXf5KSCfRJ1U5FtvpLVLB1
	yC528onMxrHeDu51A9X6RTZOcobHxZnaCghhUTRG2pzAUxU3Lnt5UQPAWk9cGn35ay3NUYanqiJ
	kOPy90ZxVDQSEySI20yVxCNMmHP9FXmu9dJjYjccNUVtinjj+lmKbgiL8R/Wtg2Ebat6lDr6+Of
	Y3tP5kqQsFXFAEpEirmEAalI7osKc=
X-Google-Smtp-Source: AGHT+IFZULvedfdDJQMjNfZ7h5QuwFdTyPL+YRqIWRICCEohX6Tw2SAcEoIQp1s4lv6cnwQOhiZ5aw==
X-Received: by 2002:a5d:588c:0:b0:429:f14a:9807 with SMTP id ffacd0b85a97d-42e0f34fadbmr9794453f8f.40.1764227668370;
        Wed, 26 Nov 2025 23:14:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1c5d613esm1899470f8f.11.2025.11.26.23.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:14:27 -0800 (PST)
Date: Thu, 27 Nov 2025 10:14:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sun YangKai <sunk67188@gmail.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] btrfs: tests: Fix double free in remove_extent_ref()
Message-ID: <aSf6UHCbZrgZCQ1L@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We converted this code to use auto free cleanup.h magic but one old
school free was accidentally left behind which leads to a double free
bug.

Fixes: a320476ca8a3 ("btrfs: tests: do trivial BTRFS_PATH_AUTO_FREE conversions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/btrfs/tests/qgroup-tests.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/btrfs/tests/qgroup-tests.c b/fs/btrfs/tests/qgroup-tests.c
index 05cfda8af422..e9124605974b 100644
--- a/fs/btrfs/tests/qgroup-tests.c
+++ b/fs/btrfs/tests/qgroup-tests.c
@@ -187,7 +187,6 @@ static int remove_extent_ref(struct btrfs_root *root, u64 bytenr,
 	ret = btrfs_search_slot(&trans, root, &key, path, -1, 1);
 	if (ret) {
 		test_err("couldn't find backref %d", ret);
-		btrfs_free_path(path);
 		return ret;
 	}
 	btrfs_del_item(&trans, root, path);
-- 
2.51.0

