Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5171D6DDD
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567762; cv=none; b=hwHm1XpnGas88VvNCXe1sAKTSnxft0p0UxQHBZG21a8x2hcE2LEvzh8XxGHlhZhMl7slkqNfBaTPO8fSNW7z7Yb3JNJvHzQrWn+8g/sJ0fbggZXb7VsGoexqhHDyu60Q9NUJO/Hzhz30HfuY4x2ylSO5ts9LvZyQkvOBF16JMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567762; c=relaxed/simple;
	bh=LssPVw/eR8tGwu63BhqsF4eAyNkjrVfgd8RLy+IzfH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjtmXa+CdwofKzT5LrJ43IZkDE8LUX3AmIeWSPNd4lPz6CNlf9v6ftSCxwAK7a/tv/yVIvM7nuD8EjAFAcXivDdzYri5ckPWo+qVVxr5LT43bxi9TF6ayU4IlI464i+M54YMwtAelga/aY8t1EHmyThsVEcOqNQIggsgxeM3zMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R8/GRT1B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8/GRT1B"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so14110375e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567758; x=1743172558; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RU2ONVmom1Z3vJLSCiuLTOfrELMOd3Zg4NSQXvpae6E=;
        b=R8/GRT1BGQ6etup3OoW79D89S7ELHnl7rQJDrqraU8AyBo1PfBJqsXDU1SPhIMuocD
         F2JxCuuj4s0aBtGRXIFoRNBHM0bOrBzc0Rz8q8OXGC3AKteD5zblXdx+ap3L1s1dg86/
         3Gq4SYnT5jriyqdWfDTC+2pLQn08cqFO8na8PmjTJTvb/keqys6VIosnirHGzQJ9YLW0
         ZssI4Z8d7CYNR26OuKi5coUEfuo035epotMQH8SSkIGwNUy9QCgdW4TNAhr6m1GjmlmN
         jU5X+NN/F8NeAUiEK9lw/+wccIfu7w/GvHHgY0SmSuKjMQ6lCX/6R0/3Hs4iaEF7yYK+
         iwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567758; x=1743172558;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RU2ONVmom1Z3vJLSCiuLTOfrELMOd3Zg4NSQXvpae6E=;
        b=cvLJazCMfcecfTvwSG8Vc9eCvfBHRs+2louH6GuJjy/bFHHItje3RX4YoumKlydg/D
         jQ811VuR1tT0wdEMg02UKvdhRSSQjAWNVylSUio8RWkjfF10elxkgnBfijgDK8Avr+pT
         VGIsLRQXfZb57hFbesOpvEdLJ8VhSnG8rGyKb3v6VqwEn0u6Nrv+udAoG17ZI6gRZpet
         sXaIeV0C7r/sDoxPvMwp73LQQR0rMdoHyND3cUhtYS20WGSiKKkgxMVoLQGiVxf32xfZ
         gN2qrG6cXwLSOjdaOxD6MN+yiw8sb1dlRyBQP9fCxkPhmRwnZYniUEROhbLEWCSJ9Bvs
         +j3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaniWySrKFtuCzcHamVz12e7nMKMHVC3GIFpNdDm0maqDZn5YO4cO9+vV7Ns8zr3gLXr3+rPwFAZRfejQUraw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9suQukxNcfo22cIzEi1G38yOPdIefOpNQrMye/npMbWxS1xF1
	ktWiXdF3IhJkcC69BVLoUScEIdNUlwSZVA4CjppXLQqKBy3ZAnsSpogLTsp2t7c3Qv8N/ECCZgA
	f
X-Gm-Gg: ASbGncvVT2dihNfbDwvx2+GX+nHJQaute6K/LdMt1ybmjEQOd5bbFHT36r2J3aQuIYc
	3qRgo5npEH8XMVYQi2glh41UeA7H5MeUscOS23pddcz7p0lFMgFWnl64uDcgJxZHQ7mM/aRqHS6
	b05wPJwUZ9tycpi8RUPv1q1wC6ZPPApmB/p6PUFqw8c0a5KwVUH2kOOIcwro2qskIkoJV5tI/m/
	p3jSiLHtlC2x0MYNICbD110wMd83pFmrkQ7969bXKQe35zfCxjN47HFSO7A0DdShaY4N8fP8DZ+
	76XD0NlgDlgw/RX+wBWKWW3HW08Hk6S0P82YOJKBb3Umt0vhva15JhOE35ff
X-Google-Smtp-Source: AGHT+IFGThZO/X4twcqLKIJCHzcz08tvoomZPsI1WRvkfM0Dku3p8STs9FB5aANY+T8q/jr+pTEbmw==
X-Received: by 2002:a05:600c:3d85:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-43d50a3c017mr30528695e9.25.1742567758200;
        Fri, 21 Mar 2025 07:35:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d440eda26sm79621195e9.36.2025.03.21.07.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:57 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Drivers: hv: mshv: Fix uninitialized variable in
 hv_call_map_stat_page()
Message-ID: <fac96458-fdb9-4166-94bd-f1d135abc6ba@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If the hv_do_hypercall() succeeds on the first iteration then "ret" is
not initialized.  I re-arranged this code to make the loop clearer and
to make it more clear that we return zero on the last line.

Fixes: f5288d14069b ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hv/mshv_root_hv_call.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hv/mshv_root_hv_call.c b/drivers/hv/mshv_root_hv_call.c
index b72b59a5068b..a74e13a32183 100644
--- a/drivers/hv/mshv_root_hv_call.c
+++ b/drivers/hv/mshv_root_hv_call.c
@@ -733,7 +733,7 @@ int hv_call_map_stat_page(enum hv_stats_object_type type,
 	u64 status, pfn;
 	int ret;
 
-	do {
+	while (1) {
 		local_irq_save(flags);
 		input = *this_cpu_ptr(hyperv_pcpu_input_arg);
 		output = *this_cpu_ptr(hyperv_pcpu_output_arg);
@@ -756,11 +756,11 @@ int hv_call_map_stat_page(enum hv_stats_object_type type,
 					    hv_current_partition_id, 1);
 		if (ret)
 			return ret;
-	} while (!ret);
+	}
 
 	*addr = page_address(pfn_to_page(pfn));
 
-	return ret;
+	return 0;
 }
 
 int hv_call_unmap_stat_page(enum hv_stats_object_type type,
-- 
2.47.2

