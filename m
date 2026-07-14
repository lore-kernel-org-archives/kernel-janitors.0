Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA947F2D1
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 15:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044228; cv=none; b=LguRkoj+qrDu/31fP1amB5BUv9VDWWeubZSdds3wlX4yN8Ez5LbeN4NE9vTO44iF6RPaLMTpecvkhWsyS06xBaxs6kpTmjKmrYOaDm29qFDqY8y9Qvu8MrwPnFszKqJapZlHKWoRk8YeLuKzlEQv4IRL5vBpUSQkuYMnoJt3S0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044228; c=relaxed/simple;
	bh=HvolbyoBY6X05ttoi+SK7pVHAyLB/PfNOG8NaEtuyrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jSB2NSGqmEtp/rymkgLNh8S/gkQiswLc9hNPgRIbbSNFrOKNsOL5e1yYeL112NQVUZpZQIbb4F5Zr5nmAV0vv4wepNIBnvzGf1ktneMwVE+ebUO03TCogZqS+dCSBLkJ52P2tYb2E0ozYaSfXbSegd/TX03HAjK1iZSRR7uWFTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT+1F5IY; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT+1F5IY"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6a397db52c1so2308881eaf.2
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 08:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784044226; x=1784649026; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=64SzPGE2xoqq8LCPMxKpT8c3wPEFcVPzYJmlW4gXGCY=;
        b=cT+1F5IYdnYo9EGyR2ciJtKcxp2JWNXuUj86L5DlnhDd5DOvLIx2xYDmtPvOOraRkq
         woIbaQtXqYXyHhxxdC+UzJujeungombnhcBo4eIibhNYFog/vxRe+damcEyqO5c/YbuG
         w40YXLX3xzzWBToQmGXp2O5OfR3Pa7gK00xtkXHUjKTtjg7dxhSWNlolITwa9f3qxj9g
         HEnS+kYE1992A98vpjAZ++IZCaHGdp3J+5wsCxghLvNMcMwQzf7ePN7LnIs3ggJxQZje
         K5GzX4dVEXH81sSnj7qHN4TGPnav9w2GHw8cjtzPaohBuUbmI4c58SDpTh18+b5Ly18f
         gSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784044226; x=1784649026;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=64SzPGE2xoqq8LCPMxKpT8c3wPEFcVPzYJmlW4gXGCY=;
        b=Rdl/fD7TVMu9g+NvEIx8LtKM7fDf3edvh2Rd7aM/vxMrT0fieMDuKLCXXZVbw/Z2fo
         3SWibouCj9zk4mB9lkK8dQdQA8TUa5bkr+Ta8Wl3gf2qUF9zLkw5IQjxAZdbzDIr7u8h
         REbsvYxHScSenMmkJnZg6vjLX5F0tW111Errjbomo5oTvrLZf4EufkX3JJ6NmzMqAIHy
         U1HAGuaoGfGCLdPSXTZK02ngS0xcOhRbOgB++XhHjotf6hcSZ7VgIlV+ibR9TUf0RElW
         1/m3br4dLRO3XtjRxqgmcCgb6Mgx9w0LlFH9ASQlQdVveaenG1h7cD78qnLmY4XnS5Oi
         1x/A==
X-Forwarded-Encrypted: i=1; AFNElJ8Brz6frQ0BwLscPHiVbM6+Ie6bdqZguD7M7Q1FqnyyNolvde5KbpAyGsXABBD7fv5kbpSxcq8bUQIFqFkaosE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhnP1yB3UoQmc5og5TCC8q1YKuHuVtOeerXVGh+52m/IuJSih4
	XMOBXCSppoWC9seQIreVkfZoNTP9YDz5L+HnY4xOBqqLsQSOTb2imVGa9RmVwKTKbjA=
X-Gm-Gg: AfdE7cniMELCBuJV6YWNdsB36bFVEVMY1lelY8EoBKRYYImENo30rW3irzYNz1WAkip
	SyGIhCO/YgVpCHi0uDn21P87AaCi7Pq4MEsnlFHC5hkplT3Q+2qf2E0OVtlsYNY/1b30fq7yO/H
	Bt8uI5/5svhdojT6Uk+5NlTmV8Z6g4m8bc9cLPtttelrDsUOpf6dWMLO4PaNrLwWCqB1W349LgJ
	BjS1XIYcgvEVziXw3OHfE24X1rjqfIaNhk9BL/n+yd1fU9f/o+5aOD9pjRJRoflbQL7Z3uwvDGY
	sec90K6lLUQuHLeZVYxnqfZ7OXYFCUPchuzJF36be4pIBFhi2ivLeEwG9trKWK2gVXDhxpMjd3x
	fHEVgz+DWbHIL+LOjFm98G06fH0WxaYZMgVuWpSjtsb1eXj6AlQuQdo6BvrANyTKu53K7c2GTjM
	d4h7pt
X-Received: by 2002:a05:6820:60a:b0:69e:41bf:fdcd with SMTP id 006d021491bc7-6a39a6e47efmr8043091eaf.38.1784044225906;
        Tue, 14 Jul 2026 08:50:25 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4546f12a6casm9146457fac.8.2026.07.14.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:50:24 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:50:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: [PATCH] clk: document that clk_get_parent() returns NULL
Message-ID: <alZaumcBpsRS9tyS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The documentation in the clk.h file says that clk_get_parent() returns
error pointers but it doesn't.  It's also not consistent with the
comments next to the clk_get_parent() implementation which say that
it returns NULL when the clk is NULL.  Update the comments so they
are consistent and accurate and say that it returns NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 include/linux/clk.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk.h b/include/linux/clk.h
index 998ba3f261da..aa93ce1fbf37 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -951,8 +951,8 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * clk_get_parent - get the parent clock source for this clock
  * @clk: clock source
  *
- * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * Returns struct clk corresponding to parent clock source, or NULL
+ * if clk is NULL.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.53.0

