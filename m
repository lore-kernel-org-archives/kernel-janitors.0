Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053DE3A1D1
	for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 06:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708496540; cv=none; b=R3cfvrFTTnK5ZZSZrN0U94tVaO+C7ejeqYqwJTb/kMHWIeWZ9YPs61igaZvBhxACaylMax4FHS8ZH/9DucL7UzY2CVg8O54IE8glSzkQyhMTlvCORsik26OnQ+X8/7eRQRjs0XKculcn5r23x/OaAmiFOamUnmZH6/M+n6y5jww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708496540; c=relaxed/simple;
	bh=/ORo+31O3kd98nX0AZA5d+ZfF3faL6LqgJFwI5tHRnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3L6MfnOYXf+Jth3U/GR7S7EGmZZkwo4cAblJlDFp5G49OWbaRGXY2t6W+OvMDlZKYAWFdqrLu3FijSBvdriJ3iJ59vWfBe4noZY+As14iahpmPI/djtCi4VAUY3G0n0F31C5kO1uYF84n0/JVjmMiWXRN/DHyUlOJ//mYbG8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/6q52NQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/6q52NQ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5643eccad0bso5273422a12.1
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Feb 2024 22:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708496537; x=1709101337; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=741qzZnNSG7KtGFvhuK+y/Zf676UMWnlta8zE4AAseE=;
        b=j/6q52NQw4ipEzh364CQo6/f6814vS8doLS6T3Ixue09CY11JWJqENN7z6tEtxetdz
         xIEzSF836DkQ8R/XIK+f4iAK3XX4qxfeuICWVgke3zs1Prgovk/nCzgTgkKdULcSF1IP
         P1mJH/GO7eLV24aan93ShYIjQraqICVqpuygMNe8y7Y0oFK8COKIBprfmx9DRXQkgCwb
         7EFvfouj+ZGvKA3DdWrUBhX+/dV2LAKQDk3YTx2KJ2sRlQbe8H+/Ef2Zd7JEL3j2VP+n
         CG+hKp1tY9uss2IjjI9/0KCjNInersxX+UjXsrIm2K73oFIBXJniAFF2CXNOCiKJWjeC
         8Y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496537; x=1709101337;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=741qzZnNSG7KtGFvhuK+y/Zf676UMWnlta8zE4AAseE=;
        b=gwWWOn2IBgfR9h9tu+KMfPzH+zngg0JRtDfjOPAskXPasi1Uvl16R6NqfxLuu3k3zB
         p/SfwFYWf/QxfJXOlIPH+dzcKM0yT0XvEaBIEnaOInZuUQNQ2TfCxME/BnhVdAJgm+Rj
         +A0Q5ayr7b2sLYp5J46H3RIl5AucphFwQoEEz/hrSOklPYMXLTk7d94RAtjN3nTtHaut
         IpK/mC9UvSV+0+y4KIXuAOEQLiy+1Y91/mzsfZL0yCcL5Dj8gA12zImxW/1KuZ97N5q5
         3nY+tHMhmjQSxTDfWDmOB8pCSclFgMauhkE0UO7y9QNO4MgRibmN6VNIukzAngwHO1Tw
         tosw==
X-Forwarded-Encrypted: i=1; AJvYcCVrVG+8ZNvWx3zMnVO8AeuXbM+rT99hL1cRuctPtoHMqg1jpdPre6hnW6V9qllymcPWi+XcoafKszi4QtcRY27aSGepPKOXVdMkGpe4VtrV
X-Gm-Message-State: AOJu0YwP4MUp1TKSthej9vPX8+V6lcqg0HhMt9H8QcjaHHivUSfKu9Z+
	MYvZtI3SZQILOgZJKa6xceWpikmlW+eZMlbRTPUq3ePtkvsnFXuY/IZfP7bb9OI=
X-Google-Smtp-Source: AGHT+IHO2SpqxV7EEds5UnseQz6m895b8lvndStl3JKPg+YCA3YJ6jhNvZizr3ciEEIKub3G06vDkQ==
X-Received: by 2002:a17:906:6949:b0:a3e:9ddf:9f68 with SMTP id c9-20020a170906694900b00a3e9ddf9f68mr5159042ejs.43.1708496537367;
        Tue, 20 Feb 2024 22:22:17 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id jj12-20020a170907984c00b00a3e64bcd2c1sm3404027ejc.142.2024.02.20.22.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 22:22:17 -0800 (PST)
Date: Wed, 21 Feb 2024 09:22:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mm: use ERR_CAST() as a cleanup
Message-ID: <5a64b69a-40a6-4add-b758-ec3a9d93eb11@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The ->page is the first and only member of the folio struct so this code
works fine.  However, if we use ERR_CAST() then it's clearer that
this is an error pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This was introduced in 2020 in 539a3322f208 ("filemap: Add
read_cache_folio and read_mapping_folio").

 mm/filemap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 5603ced05fb7..54e9ebaf4e84 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3768,7 +3768,7 @@ static struct page *do_read_cache_page(struct address_space *mapping,
 
 	folio = do_read_cache_folio(mapping, index, filler, file, gfp);
 	if (IS_ERR(folio))
-		return &folio->page;
+		return ERR_CAST(folio);
 	return folio_file_page(folio, index);
 }
 
-- 
2.43.0

