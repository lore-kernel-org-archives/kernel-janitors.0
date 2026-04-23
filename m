Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FA3DA7D3
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 07:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927654; cv=none; b=IrVBDNjbDp4d2TnOB7MRqJ/LeO5WtH/BDvgoGAeSUsvQgD4zlHwFtGu7XLtljWDy0mnN2OM8LIi9hFcnevyZkMAVI3ImYJuySqFuTY35/4vPpyLxLVdSmVsrfW4KCQednEItTygakfE01cwqsbXYs+EXa3OLT33RsNegcTkM05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927654; c=relaxed/simple;
	bh=NvVaZuTiqo4nhPYlRPnLw4qoY9n3uCs0iDruHZXLw44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/B6Y9oNw3ra4ASsBkseVhCNA/DnPIR4zskSZXRAektXr9df3DgXo1n3h+QqkkWAsEPBBX5tA68XNyREriCaoQlddTLoOogrmSMXSfXcV4YW8ZC8Q1Ps29nhxNK3rAgXSed6TFRZ38tRaVufSEfORl8ZdDge2wQuukq/efSW2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbHhG83n; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbHhG83n"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso66784567b3.3
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927651; x=1777532451; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vsWji0MqctKLH5RWyMnSGJ4CeDIPIJ8NnIIk/Ffp050=;
        b=DbHhG83nRoGi5F4SyoT+LJWDcghoNvrqBOlcxEmYoXIkGs29QWZZ4UkLxEcJQqrO8X
         0J5nG2YRbPXLvjPjAOACrBEC06XBCZ+sTZKQ4/8wUdXoT3XRr9YxZRwvg8g04sSW2p5D
         qYKrCv0+jaWfaIcG19nufvB0nNa+718KuCwqUaK7rGwwiiIjsSjWDkuuKmGYefORVWvU
         Zc8qH+ERcrlT4begguMmir7Lj9t/zZEJVx2pqqsYl6duvK9f5YmGXYLrAGF+JRfZLG1o
         FzaS1idglOHQeEPyTF4fsa0fTY1hqXRiJBpo8izrD1416ry3mypXpYeizWr9jbOW257W
         xE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927651; x=1777532451;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsWji0MqctKLH5RWyMnSGJ4CeDIPIJ8NnIIk/Ffp050=;
        b=Yfwi1yTPdKktScgDKOIJhi5oPjV1CpOsUGYuQyiTomkMwxU2Gr5R55tFlTwIsdqf/Q
         +5pDanKapRaIbrH0BGJb4QL6DVcv18pi7jLU8peX/rbYG6yB5L+j0u5qitnuXjye2mWD
         /tMTLpTrSZt3RSlmqvDVetASGvpSux58bgIWZpNRhfzqtm7w8kUnSC8U4NHSk7xjGPWS
         cOwN7gyTEA/t7ryu5NLux6Y7uMbe01Hm4pU1kiBlkmnu1lqX7ftf+mCAihiP9fMC+Ru/
         +hNCK+503giKWHGEL0pDL9Gjig9mABYz8ZZPSLvuW9ip17F9NaAovB/RyPE51VfEiajD
         hFgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fDmFOWnbT8E1vH/xUIi5YpfdM7xQUvwAy3QAwooDN0NuWtPRrU3re12kgQiz32p4LBC+tLH4OW69AqiM7+5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdrX9VhGH598eaoMvJmk/iDsAs84UgVoRoJ2oQ5Onr8n3nb7qR
	on4pW2M0MSfOxFM38hm0+YQfwaGw8aipyVaB38KlBURNSMq/vntHa6mj
X-Gm-Gg: AeBDievSwgwWOrhw2/QnavCEuHwi0rBdWThozA7K/46iDnNQBN37Qw1l8M6A04co5Sr
	xVNdzMRzu2u5ARGVcbfeNvZS0fe2OAvfo+9KYW1vHkJu/7WWVUTGbB29mnhg1pnwNv1OXGMOxJu
	PbiqpH8q6ksi8s/I6dU3+QckmeJYmWPmHZJSNuIhl6o7b2zjLgm3a1Y5o5E0KmlP7U9wbVM8YFP
	FP/fWhjmSA4c9KXGeyNhPYlgphseehottfaaVrNm66XLuOByLLS8SkB+ud+yqPy3lWZKJ6j0nci
	imdMO2xYUQNRwl/CtdSCisDQWNHgBlczrPYuQFRzjx4O2SZmPPEkxndGVIGIqoVe+ROINbLuDfO
	SF5i3yQ4+DX0dum1TuRVuXsw1FLtDqm5VfEf73gjvPN8X6qYvn6tNEzNmnDA8i3ybkDCO+DsZr2
	9IBS+OYeFDD8alZMeSHfruhWYOzBiu
X-Received: by 2002:a05:690c:d8d:b0:79a:7cff:7b81 with SMTP id 00721157ae682-7b9ecf8a0b3mr260371497b3.27.1776927650884;
        Thu, 23 Apr 2026 00:00:50 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bb005abc7asm29906347b3.38.2026.04.23.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:00:48 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:00:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Guo Ren <guoren@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] perf dwarf-regs: Fix off by one in
 __get_dwarf_regnum_for_perf_regnum_csky()
Message-ID: <aenDmXNIKdwdtMzn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Change the > comparison >= to prevent an out of bounds access of
the dwarf_csky_regnumsp[] array.

Fixes: 8cac4013b0c2 ("perf dwarf-regs: Add csky perf to dwarf register number mapping functions")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
---
 tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
index cb44b774f8d9..4c586a5cb763 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-csky.c
@@ -118,7 +118,7 @@ int __get_dwarf_regnum_for_perf_regnum_csky(int perf_regnum, unsigned int flags)
 	if (flags & EF_CSKY_ABIV2)
 		idx++;
 
-	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_csky_regnums) ||
+	if (perf_regnum <  0 || perf_regnum >= (int)ARRAY_SIZE(dwarf_csky_regnums) ||
 	    dwarf_csky_regnums[perf_regnum][idx] == 0)
 		return -ENOENT;
 
-- 
2.53.0

