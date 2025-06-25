Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7926B763
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864947; cv=none; b=p5OPIZNE9F0x/WCaJReMDRhs3D9oXop8zFFtt+osEgHh7XSw1nvX8lo6UhbYEzcM6qXRv+RV8uRbCTvVEtbvsZSj8Kb6kF3lVgHVUaZl9qdMXzYWppjZ14E+asJDtJJkPfBi7wKNtA9aUIGOgqDPJT/dLaFeS2TQz+C8W4NmCyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864947; c=relaxed/simple;
	bh=tPS5HgtBH/a3YI75SOngGR5gSYBTs9/8ZTRA5upNPuY=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=Jq5DBkIa14OZkmJdgq1DRQUL/ijvIFna2PelIv2MoaEI19LY1yyJhCoocR0QTE6RLrd6NNxrES0jqIuMa/Mjx5+WkYBBW3qw5NDEm0O+3zVHU0xVJLddBgGWrJU+ZuyPtji2vu3VUznjDqilePAOfnUnZiTID7TUUp5nOHfob9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUDvy8oy; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUDvy8oy"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-735b9d558f9so602009a34.2
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864945; x=1751469745; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7RcZ8tD+YY3u8+1Exwd57sweAEXV5GRa7q2EAtC8fU=;
        b=TUDvy8oy4Vj5NJRISQLoZWYsTrI3pumAE1AJMWveuBRE6Pv8Rpx8NgiOPuIU83m9uT
         T6n347s7Qmxy/g1Os0fniC++k1I/45Vknz5IaZ1FEHZXTa3Fe82zO1bsqQXw4up8Di7i
         riTVHnWin+uXLvn0Mko9IhXEOfWePSUAXOhdgJlSTt/GYY5vOYEZFDRIE5e6nJXuHedn
         FW6dwVXMYmrJgDXH0T37EzF6aq/juAcO2iaUBkqWX5ULS+DlIg7KrfGQnwivrfbB+XHs
         Gzm9wdoIRT/DItpGJZZBVobuwJs7ifEst/1pPN12knKWmYcj7C9t3Y2s7BWSh1zcKQrw
         iHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864945; x=1751469745;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7RcZ8tD+YY3u8+1Exwd57sweAEXV5GRa7q2EAtC8fU=;
        b=MfNajOTIafAUxTUv8326YPfmrvRI4aubuBjEoxMNo700UclyiZunbFA9LaudHZw/eS
         tJi6nMOyXhidaXz3B8TSgnSsvOGYBAr4bdi7lcPdVJqd4CK34CFTw5BAnQX2GXXvc5Yr
         B3WKqy/K7j8pm79ZzWfzrmRHippUgsJnQfLx2tpsi5y7tQsTJNmxf/O13Jvwe1k3o3E1
         B/fa5pfK4iz5WvqmeP0qKb9WT8NA3YDpFkeAXzENowcQFcBOTDQvuX7G/XJUygnKQZPp
         vXrdlcOd8rDqCDQx12UlsfKLC6SnOnPoqC4EGMEBJAqvXbA736q3Z2lFILd6x+eHJy+P
         0Uzg==
X-Forwarded-Encrypted: i=1; AJvYcCXIFpokx3dZhCIwi4XYYk+FuG9yds69RA+Nw2P+vVYI5yFX59oDS5kNhK/CU7k0hnVWBtUUmx9sWEYLIcOAmXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw/LKS6+6rGmkliSNY6lFdDRO/5xDva0bR+3pyfMLRjmZ3X5W6
	Irvf/jpwljZnHoKO3B7U2upHbSXcJo+bDHXwrw7/HJhjfbxa9Z0oCpNqvIN9aTT3o4Q=
X-Gm-Gg: ASbGncuCsJ4uQa/0e+0mDDoGuS7Tou/B8AaSrAKcBraLpqIMCUFgvA9Y2WMypZTookY
	aQ6S3n1oOR26rh04W7pkdFMO7vIC8nvFLvPeSAjFyx6hrq14LHiYDlAPQyBStw7qMiZzt5te8mm
	Tc30UO1kAsxDh7ZdhtvVrKkKDWdYApGJMGrJ1gKvieVXvw4VAs+ZPnKEs2gIgawss6OCpPR85da
	5y0GElXHZGcakwy2aDrwWd9Ep4ekvITi9ZTpwF/6HjwKsRK/UZkHpFyl3oz2aPkX0o2gOFDFYZv
	10nmE4+mKwhXPPIGwhdPAkZ6hoEeT217cAOugxj1QuThCfkEf8H9jLh/IxBXXS+4Tw6MYw==
X-Google-Smtp-Source: AGHT+IHb85FqTS0ycz4BbaaNVMY143Zje2j6HGa+QScgiEjK4EjT7d3k0hQ6xgLXGqqJ3LGIaVnNTA==
X-Received: by 2002:a05:6830:8088:b0:72b:7cc8:422 with SMTP id 46e09a7af769-73adc7eb8eemr1794371a34.20.1750864945168;
        Wed, 25 Jun 2025 08:22:25 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73a90c921a7sm2240183a34.34.2025.06.25.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:24 -0700 (PDT)
Message-ID: <685c1430.050a0220.18b0ef.da83@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:23 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhu Yanjun <zyjzyj2000@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Daisuke Matsuda <dskmtsd@gmail.com>, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] RDMA/rxe: Fix a couple IS_ERR() vs NULL bugs
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The lookup_mr() function returns NULL on error.  It never returns error
pointers.

Fixes: 9284bc34c773 ("RDMA/rxe: Enable asynchronous prefetch for ODP MRs")
Fixes: 3576b0df1588 ("RDMA/rxe: Implement synchronous prefetch for ODP MRs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/sw/rxe/rxe_odp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_odp.c b/drivers/infiniband/sw/rxe/rxe_odp.c
index 01a59d3f8ed4..f58e3ec6252f 100644
--- a/drivers/infiniband/sw/rxe/rxe_odp.c
+++ b/drivers/infiniband/sw/rxe/rxe_odp.c
@@ -470,10 +470,10 @@ static int rxe_ib_prefetch_sg_list(struct ib_pd *ibpd,
 		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
 			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
 
-		if (IS_ERR(mr)) {
+		if (!mr) {
 			rxe_dbg_pd(pd, "mr with lkey %x not found\n",
 				   sg_list[i].lkey);
-			return PTR_ERR(mr);
+			return -EINVAL;
 		}
 
 		if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
@@ -535,8 +535,10 @@ static int rxe_ib_advise_mr_prefetch(struct ib_pd *ibpd,
 		/* Takes a reference, which will be released in the queued work */
 		mr = lookup_mr(pd, IB_ACCESS_LOCAL_WRITE,
 			       sg_list[i].lkey, RXE_LOOKUP_LOCAL);
-		if (IS_ERR(mr))
+		if (!mr) {
+			mr = ERR_PTR(-EINVAL);
 			goto err;
+		}
 
 		work->frags[i].io_virt = sg_list[i].addr;
 		work->frags[i].length = sg_list[i].length;
-- 
2.47.2

