Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235C1A5B8C
	for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865530; cv=none; b=cbvkp2ANwmUHcLFsTTKzoJP+pFCEwGxj3mPINUrGSW/dFQ1V0EflTcKWZLceZbfkkzp28/K1KG26m2E+82wjVBMssH1PrqlgnsBtSvZHpRg0wVWfR/FN+6IijY5Qx22eYzi97W76k0m5xvzSVPa58veXCp3G2x1cMHevf/opKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865530; c=relaxed/simple;
	bh=x6feCITrFhPaGclC8zFQ2HR1RuZnWD4n2DVDo7w5SLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RB+AhjtbEb3tcb7udhKKpATiXoO/FhMsGPb2zObWksS3pqYH3+YG94rJ7zLYfECqt1dJIRehU42Pv4LW9CGDs41bpNoVQnRwPt3WbZbuyhhOVEfMPYbsroQloJ6iPkvTmRrySnWywRbnoehSe415lEdd/LjVdQdEoGVuCupoTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkINNl6M; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkINNl6M"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-735a8be4ea9so1767140a34.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Jun 2025 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865528; x=1751470328; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSbIY9Yl8vGdIuAQaYjHaIKe7rsAqaxI1VrCaxGNZw0=;
        b=PkINNl6MOv/ae6cm9mouEGJSDtwAfzwyVphShMnC7nlIVU4MGOzLM1F7WhSu/DKUJb
         vrzT0dHTK9IEg81Sh/sycODTBjzNDfuoOtc4P4z4/1KCwLU1Q7BOZfWxXIjVo4nM1MaE
         SU44gQyOizJ4qkq/Dgke/WqTpeQicmGXhwKoGZPXx568wp2EhZVISxLQ3/LYlCCNve04
         uWxMHnC0lWt8BklKCov0zxaQ9PlMYv7cDwJgV/xckoxO7LHSsQf3GQQUsJUj8R1ggXY/
         nrtHJjKksOo+NnX6lU5PIamRUw20gjZNe9wSBJJzIgrMZeqCFN2zy5+qX/ekU8XD0qa/
         i9NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865528; x=1751470328;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSbIY9Yl8vGdIuAQaYjHaIKe7rsAqaxI1VrCaxGNZw0=;
        b=T6vKPX50mKUwZXnTloOJDQuf0f9ua8grUUf5RyubAKZA/m4dw2BMTuL5h9eHRmCMfb
         RTM+JZQEIBTvI48wXSz+pDXBMeT93J1rvNot3JgUgf/IbIOHcZBWOC/GiJu9nrhVN0LK
         mmzYP7ll69MualYXOlvU1lih52H0clODfCJRhENmCwM50/Rd3oMPqJ1C2U/KtP9CFiPs
         dangbEqLX+QIVKCDaqoxhNl9u7p0cAxJIOsgVDUNJMBUo01drEXvRPTQxFI2wSt25BYe
         mRiLvxxLc3CnFNqO+woQWYiRH9IRjoJ2Md6TZd5T57vxwURJSen6oqUrtvlPkJOW0JzJ
         MJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCWQSPnjBA1+VefM/RAu2QUzgC9+lLj37shx1EXWpt3fYR/vnGmRV0JORP0kGX8oAuxHwC96VbvNOTwH9L72M7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVqHlMNmDfajj9PvfsXn8IBq6iA363FAS9Hhvr/MM1pB8cU1Mo
	qY7jNboGqXm+SEcW/TWpPL5Awqd9jmg017duV40z3Cqh1rOR8N/GwvBOIqHvnClNrCs=
X-Gm-Gg: ASbGncvxleBPlGMg6mzFLRhZdKqgAwCjMpKUGJ/q8qBj3g3B4GdaOBeNo1KtTLckBTC
	35uedJx8VRK/YKMxAiSliD2xXcMPS0q3rMCCyo6OhreCiFNOdy/3YTEiwO9n5+YrQTQeouBfG9W
	0VviUQ0X1J48NYbcMu0cwLfx9CHxAhFgEKAW3otXrLC5tH0sSqyf5ixbrmLJX1isEQwkmolL9Nu
	golQP5eWiNz17D1I+UkVRAvadibSAQSA9FuX7zRLYdtsiBwxIWwFO/QmNqHFG3KuM/wdJwXgNGn
	vQcqQeeratgThHcI4eqgLyj9gBd/FlAyEUmc3dbs+pY17L1+oEZ/k/cdrrNpk7Xnh/6i+A==
X-Google-Smtp-Source: AGHT+IHnooEMEz17n4Y/kHC8fTdwEsKQiWCHXSACT92x6wJgEO1U5hoZYWd06+PlWgby4tspZtHXSA==
X-Received: by 2002:a05:6808:81d5:b0:406:6fd3:ff18 with SMTP id 5614622812f47-40b05c740b8mr2902678b6e.34.1750865528333;
        Wed, 25 Jun 2025 08:32:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11bd8sm2252633b6e.39.2025.06.25.08.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:32:07 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:32:04 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] mm,memory_hotplug: set failure reason in
 offline_pages()
Message-ID: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "reason" variable is uninitialized on this error path.  It's supposed
to explain why the function failed.

Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: I misunderstood the reason why the function was failing.  Use the
    correct reason.

 mm/memory_hotplug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4d864b4fb891..e4009a44f883 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 		node_arg.nid = node;
 		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
 		ret = notifier_to_errno(ret);
-		if (ret)
+		if (ret) {
+			reason = "node notifier failure";
 			goto failed_removal_isolated;
+		}
 	}
 
 	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);
-- 
2.47.2

