Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9C21D3E6
	for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 21:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752873765; cv=none; b=LoyfMAew4rqVOzrB6iFbbsJPOszMxV8F6auU4XHrpU3DdhOTPIOc+Ev5ALP3iLnE4ZNM4BC/sbUeaeHvygRXuV2BjH+9iy6VtCQxmq49pUQv/Zdm4MDhckH8FlX5s7SvLcZ0gUqsscJjx3oA4M1eyGZaxVfh0jfcGOMf/S674o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752873765; c=relaxed/simple;
	bh=tSTrgPIpnpGNk9NG4NpmpQ1B9Z+0uOo8Jk7BbP98nVo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlc+8fvqRxVz+iGA4Xhvi8RqR5VYuCVoaJqcb/5xM7Xvo5tfNZSKqK736ETIX/avoWzDcAw8F1tOihjz/RdlIkrbUvfw5I/4SN/OyUFACzaBtVTQnuMX4OeLBVLucoiVcXDX2NBWgcEMh6DSWjybzhLpB+W7saW3+GUinJDyoss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqHNJFJn; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqHNJFJn"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e586fcc28so2060482a34.0
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jul 2025 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752873762; x=1753478562; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsvoKg06SgJJI9+VuR9QTODLjTqy09owpIVoI3UQeUs=;
        b=lqHNJFJnIAE/xDx7uJU9Te8OTDiojxRoiHqh5sQqne6FMIGj9JT8bOX4dH2Z1vvYdI
         GT/UVGi6zELgO9GJBP3+5XW8Jv08Z8hEWe0M5Lu4GPs/tKGRyGjraT2nGp48slJzRANA
         yf1ygijYkx6MqPVSWeDzV3Lkel0ZImZSqDdw7Ins5DjAtLEC2o3oJkNPbl9t7X2DuKa/
         B8ErO+Rv/uNw7/v1kiG4HgbwqQd94FejR6lwphwlJCkONVnd9yfo7RNSxzilxOIc/NWx
         wUPL+9ZKWgSKXbs384qiIs1MOXL3lU79gTQkm5Cxana/lCbq6JcVp6iJGo1haPXPmjin
         xz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752873762; x=1753478562;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsvoKg06SgJJI9+VuR9QTODLjTqy09owpIVoI3UQeUs=;
        b=oyM0rcNZPwT44+McIOOQ00Tmgpfq2MuWUEZyuFvjnB+GcefJ4+fKGYJ8hnTcDAWiuE
         j32UcPRUEob6XbOWQkz9l8m+B2BKVCg5LNv/2FO9NaiJRgk3KPU5guYs8SDw3nSbC4FP
         AWUvMe6Hg4rcWDEMdYCCZsnXbGnQcOrp7ei4ASyAAyuBuLN0RuK0h7XNMssUFn0HD8Br
         5yDiZULVfpOVK/Jcr6IvoqNr/QMhz71ExmW1cpm+TnQefUFCOlz2tgpyXWPCodsGt7lM
         e5euM3WS5u/jLM+616srXrStOVpU9VZtorKh7WpAOGPnX+IP2HswpbnZnkGzXAAIzcfl
         /KKw==
X-Forwarded-Encrypted: i=1; AJvYcCVolg6N4UrKOp9B8GJah1uZ0T1EF7JX+5uf7gf+Cm3KiIVSkeIayU4/15xuDtORr7rDVWrCYXCvucLM8AKGHl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM4AFkt3APD8y8ZncMcTNHNBoGD0qH3ViJBDuX9Sdp4k596ait
	/p3Dfn/G/iTLNwr3WwIXnf9eZF7QLi3Ca2uPL3ZFXr724sLwPlfj6v58DshHY1qCLe4=
X-Gm-Gg: ASbGncsS9VzkQvLh+/WojZKPqRR4pEAR+5murGhd3WXUmcEybAO/LBNrTPaQtQvEl7V
	NTfSTBdGnTtVfRG54Xh9FVNdFzaxlTf5/ZQKnB4aamtdWtwg+LXlIp14WsUq5XXy6E9oDCf+0xh
	RR1MaF4FRj2DxO2Wq+eZBLzpcWNmq8HPe0BJrQST56VxnZhZi86z0ZVMqkuJJ9NvJW/Ua1Zij/Z
	kJkyTWXopWrS6g2QQnoSklqhQo68V3MpASiMdcxP26Ux42WftW2Eis/KBouA014qCn0QgsTXh3Z
	GBklRT8xVsIjYq1OsWXtntEIzj1nod5GhcU5hJ0jv4SKgNGWeldJ4DQ0/fpJs3iL+J1UeAGhGDL
	N0/BDeZdGvgs=
X-Google-Smtp-Source: AGHT+IGh7lU3JyUSFdh98iTvsA+uq1G9ywwnUkqJkNKmpyQmKR/YnU9/CQLlNROcG3cTeKKCoijI1Q==
X-Received: by 2002:a05:6808:2388:b0:406:6aa1:38d9 with SMTP id 5614622812f47-41e2ee52148mr6250832b6e.13.1752873762342;
        Fri, 18 Jul 2025 14:22:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd10c0ea6sm751747b6e.1.2025.07.18.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 14:22:41 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:22:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Robert Richter <rrichter@amd.com>, Li Ming <ming.li@zohomail.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cxl/region: Fix an ERR_PTR() vs NULL bug
Message-ID: <7def7da0-326a-410d-8c92-718c8963c0a2@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The __cxl_decoder_detach() function is expected to return NULL on error
but this error path accidentally returns an error pointer.  It could
potentially lead to an error pointer dereference in the caller.  Change
it to return NULL.

Fixes: b3a88225519c ("cxl/region: Consolidate cxl_decoder_kill_region() and cxl_region_detach()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index f0765a0af845..71cc42d05248 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2108,7 +2108,7 @@ __cxl_decoder_detach(struct cxl_region *cxlr,
 		if (pos >= p->interleave_ways) {
 			dev_dbg(&cxlr->dev, "position %d out of range %d\n",
 				pos, p->interleave_ways);
-			return ERR_PTR(-ENXIO);
+			return NULL;
 		}
 
 		if (!p->targets[pos])
-- 
2.47.2

