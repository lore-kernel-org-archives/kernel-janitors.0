Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212301;
	b=k5hKf/YGj4lQuKbQdA6TJPJ8I0iGAwMyoS3fPQJRSYTLkd9SQ7zEfCTqqYmTiMbHaz6U
	 uCCbhbEwP1yn0Y9N482ROS1MRTH/cFooKz1TC3XhlCZB0mgfbks67EoCJwFWuqIaOaMvU
	 a6m0NENv8evo1mLWgYwf8T8hCI8HfJalURy0vMaBbCw0Jn+vbgF0yUD5VZtNFNkgVF3Dz
	 XTIzMJeCmTAx7S+XKdO6j6oRtSLe8AjESInVbpMfHCXKfWVgoJ6gGGb0vFHNdr/34yHqS
	 Dtw49qRdXAHdzHAAaAgk+m92657Yi7iZppLyVidQT2FGFXoWgxESC/zEQeekT58b/WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
	b=cx2X5ffHly732Q3V5eca5D3h3xswnDRhDlaGCzqCfwuLhhw6GRUSKtL+Xiar8KGcMRHP
	 grzpcF/VCA0lnicbwveOOGOzChyv0+vkJgdtvmWTKWcDFIEsfdV0qFKXiqjnsVwijLNt0
	 3DuOpdcjvDpgLV2NuQRq+h5sYRvh47yk/zm3Lkg+zSj31J9ve2QoxOWhxn04OjqsZ2yP2
	 nzYZMlU+9QVCDgPpqVKp3UBupo1YeZxFSMTnufdJEIYQabeRhybotAFywpHJfS81xWQns
	 ezcgeC/9061sXZi6eFWUN83dnmW5E1MMMi4TJ/FNlbpm8NzzNesBWeRb91Vxhmg5rCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q3I/SShW";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B4606A31D
	for <kernel-janitors@vger.kernel.org>; Wed, 28 Oct 2026 18:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C87B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3I/SShW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so12873665e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Oct 2026 11:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212299; x=1793817099; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=Q3I/SShWWIQLoN2RtHEvS3tWyt5qY8W/OL12MoF4oRRZohECYlsMONQyUzyl3lwFs3
         dS8/l5SIzHnQV95IUGRfYVivCw80NKIlwiVbB5EfxMB2OSFPl/mQQTgSbC83u9K1E5gB
         beQYiwuVcn+D1KL+RCmy+NZzb5kgy7hbubOhgQdyADaiKZa3TLTwWRrr05JHXZ6Hrq7L
         UtyDKdZ7795d7EDIeGC5/E0R5wXO4N0GIBIUC0LTKVMN2Mr+aHlzWFAIZ552k6mDtHby
         dsLy5FvT5eOaQOEtxMEDuMGr+KSRP+VoW1ehD95Cio/5wcmRqahTaDDG02V3tIwYsa2E
         8fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212299; x=1793817099;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=N1JoZ8s8WXP1GU6f9FXpdBGij6OU5AHO93kmVeOEQXoYlYiBxteZ0+J4wmymCHmZBw
         4Pn3cddNke358JWjmvTbTfXN4JyX4rJIe/cEXsOYxhZMYnfCpL//+wjGHVIAOMgfyv3u
         OqB/4m2tS2Svg+stGHSfATJhFicjHwEhajWoBWncOLu8VwQNFZtlxH3V+K2fMGiKYTTd
         LWPaWDGyqti5NiYK7D+YsO/N87wz58XSN0af3YIyc1uUUYANZOScO9eu6tCih8f15ZzW
         bnVXB0N2hnwiD914Ck+T1CyQ1l1M8kB8H/mQv4WiSBAJZak5r9ZP4bGwDJwgEQw16kee
         LKww==
X-Gm-Message-State: AFq9FYK/RiGEaF4cSPogBq/5IEb1xkRXJ9Q8KApvupcYqqQE3Yq0RqaR
	9pR11GMP6eOeaFKTN0xy6nrzUjkSRnmH6peIP4hAT28kMZJPggs9r2H0
X-Gm-Gg: AYBFou34QEEgU31k6rESpUGzAGdImllU+og6Q4MI6Vrxk3sdXgeTtFcmom0zHL01EUw
	7n4Ta35DEuPEsd3Fn+j6JC2xNL/1X30lsbyKfCw/HITSoecFh0pORCAbfvz5h3RVt7GMNVQ1CGw
	QEl9elUkwkOJZWNZTDrxGE2vE5FeCaW3sYGPJrfevrHwPgB3+om+vVeKN9GyObjZwTawBHzdVPX
	vfdyPJK8HGOcHFKpokMc/GPZd3OF1/6fsCVBo1L1Gg3kUO1jKZ/HKdKFvg0SIl5/lq/OZXpgVIu
	4+njPX2EVSs6LlFzKV2zkc0VaF6MvFdaea7nMSACH0BicsqO4nouynTF3/Jh41WrE6hDqjAe1dT
	kbRqvTFo1KUnatcvEVgGnaaP7PUYoCWOU0YH82qUiyB+M0VfpFM+TmarEtKel3vjOV9SmAtqXC5
	Bfe1nONDNv7gV8cx1WGgByC1rO1NZfI+3V2Sl9JpN9g40fpsamA8q8FCHPaLstEaywWiruRhEgX
	11PujyMrKBVixXf4HNCcWFBX1bFYBLO704aEPQ6bpMHOGsrkT2aXDtoj4OD2ZMkYC6WPbnRYSMU
	c7R09gbavXxn0xXvJZMUx2GaLiSTE3jl1+gruHqzwHeC9knB
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr29197025e9.28.1793212299033;
        Wed, 28 Oct 2026 11:31:39 -0700 (PDT)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm29193591f8f.2.2026.10.28.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:31:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: John Garry <john.garry@linux.dev>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
Date: Wed, 28 Oct 2026 18:31:37 +0000
Message-ID: <20261028183137.537812-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/perf/util/cs-etm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index bdcf94813129..65bce2450549 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			continue;
 
 		if (!intlist__empty(etmq->traceid_list)) {
-			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
+			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
 			return -EINVAL;
 		}
 
-- 
2.55.0

