Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F033CC2
	for <kernel-janitors@vger.kernel.org>; Fri,  9 Feb 2024 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707483972; cv=none; b=qFKfAqAoieZgmTyHzQsIGKsRSGCBjYPkJlLIQydhsaRo7qjcjlvrpPQVkZFkj+d0LqVxsWb+IO0W3QOSw6Pr+fc/ljqkGpy3FfdH/lqJIS+h3wZ8Gi/A69sP8IEU0Avp7E883ybeFkNKge0akoJelNWJC+E3p1wnrQwaqAeqvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707483972; c=relaxed/simple;
	bh=D1I9C82K27EKrdSDWRrP1udXuSzgZmJRqnn1NoTF8yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zs/pa4xeNocUgItO5L6Iqr/o28LvCaTygXMY8iR9BN9BQVlHwf+P/bGQKQvfMHbRIuXM+kM5VThloOypuQshmLLhLmtznT6JaaY4yhAD02YjADAP4d2P6JQOZLrBNO/XQfkU4gwJiRSM30PeqkbgK2WcJMvKnFysMKFcYWErg0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KalGNxGo; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KalGNxGo"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55fc7f63639so1327001a12.1
        for <kernel-janitors@vger.kernel.org>; Fri, 09 Feb 2024 05:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707483969; x=1708088769; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLtEo1OKqwUWvTBgCakfkTG09kqUPK7D3C3/KQylNEw=;
        b=KalGNxGoV+JgDIrSFPgXwEOomKw+DsZhYjuJj5/pQbG6muODI8sohhrU1bacjmoAp6
         SWLxPu9ES0w3Kf5lFr5AVFczauaIIumxR03B40ZYpefuXC+oeVej07HVQPCe90AS1iDW
         8xdLxR+Ts4FuEywUfQVMaERmjvvswr6OPtIDNYAEOPNQNMuZ/J7z6PBy3qgFKrCc8Y8f
         CmU28SzcSW6RxZ9MSbL832Id8xjSndkEwTOMemJhMstOZv4bI8uV+n2wdWjNEsdolqdy
         UbJKJImcpiMVzw+vPXLoau9smhRixA1bUXXHOviJ9s9p/aNd0ylS3nscS20RKFXCcKGs
         w5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707483969; x=1708088769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLtEo1OKqwUWvTBgCakfkTG09kqUPK7D3C3/KQylNEw=;
        b=qACBpHr8fFXUTte5Jd7WwZ54/saf7tZ8knEJ8jkUlYCTE5IG2YCrXE0eoK3vztHHH/
         I6/neTuevN/1rE++8x9NwFQtDEJGYueKEXJN/otbPsNXKR4E09gOOAKLUjeT5rdYTrHI
         lsEeyCMFQaqYIMNoKCNfghlbXWVgbztKtt2co4O9rCC62nOgVPHUZaBA1vsCqpMqoGzF
         BMFPi+FB89vudgEAH/1MN6k+sXDEpTGxmfQe9se4angXT72GmTG8rPWzU+w1K7beHVdu
         PDEzFSBXob0w395WMm4/RJCwcayThqeB75dWg8rNO2DruhgZltjJeLlnZqcgVi5OmhRU
         LOjQ==
X-Gm-Message-State: AOJu0YyeHaGgXcl7IYFqRvkqjfnhtR4K20CZ/jUpHV9j4j2UzyHG4P5K
	QBXee2YbNKdoDfrJH9s/e4hq+LYnPYbXir4yJgPPcHCcWqhhaBccWWi6jl/c3Bc=
X-Google-Smtp-Source: AGHT+IEN5edzSFeEvjz3iI2J36XXz45v/QQzi6sVUlIxDFtjifYo68zTTErxjbxGObFqhdBgYmlXBQ==
X-Received: by 2002:a17:906:b354:b0:a3c:e45:4f3d with SMTP id cd20-20020a170906b35400b00a3c0e454f3dmr45052ejb.30.1707483969465;
        Fri, 09 Feb 2024 05:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmo+XQH+yrKac0XvIJqSlYVt9IIw1L+e7oFiTQgBGyl2mgIawunfVwRGwmw6/ipGW0YVjrQCPOK7+Tk0byAhSayncFaCNXgt5IAzyXNEcJTShLznj/7Hrl5mQWbVOXxtJXdokNuaY+5Z2k1CVZJ7B7V3WOAzm1GFKUWi82vm1arx/ksFuOz1Q=
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id st11-20020a170907c08b00b00a3843b13729sm743753ejc.35.2024.02.09.05.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 05:06:09 -0800 (PST)
Date: Fri, 9 Feb 2024 16:06:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Sakai <msakai@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] dm vdo slab-depot: delete unnecessary check
Message-ID: <16ffd614-48a9-42b8-961d-2dc8a69c48d6@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This is a duplicate check so it can't be true.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/md/dm-vdo/slab-depot.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/md/dm-vdo/slab-depot.c b/drivers/md/dm-vdo/slab-depot.c
index 42126bd60242..2f4a2ae5e082 100644
--- a/drivers/md/dm-vdo/slab-depot.c
+++ b/drivers/md/dm-vdo/slab-depot.c
@@ -4100,9 +4100,6 @@ static int allocate_components(struct slab_depot *depot,
 		};
 	}
 
-	if (result != VDO_SUCCESS)
-		return result;
-
 	slab_count = vdo_compute_slab_count(depot->first_block, depot->last_block,
 					    depot->slab_size_shift);
 	if (thread_config->physical_zone_count > slab_count) {
-- 
2.43.0

