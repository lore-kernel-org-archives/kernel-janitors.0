Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1AC2DCF57
	for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928039; cv=none; b=HGWT/0WhegCEcYxR6u7U/k555Dzsa5SnLoTJCL5O3pwNA1zQw7v0Wpqc13bD0jBIF2/u3P1ALVmTpovFRI04SaTWlru2nKsQF9yJJ9a24y/WjV1sot3zDps4EgBKx1TWzr/2XYQmGGhOw13p5k7UoZhOQYmWZd6dJ9W/nQO4oTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928039; c=relaxed/simple;
	bh=ZsYZVWSRpYjND+seai8PJAJvodVuBZleUViz9xE938w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sf3aeHPrh0gt08IQ3bMb4x5GPo1yfZD3X41W1WcmGF7jezIpLHeW6e/mENPVi8qQH+916KSUNo39330uKZuDH7eY+uli5le5ORT1DVsUWll2l27knXQXESXMhRBsHsO1HvJ+n8lXBfMRKtjB5BCIyly8wc1yEaRocxzi6sWfofQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsBNZYCl; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsBNZYCl"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-651c7ddf514so5857008d50.1
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Apr 2026 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928036; x=1777532836; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1Rv8LfN37lFeKpCNjjDsd/mT5lAqzaOO1E9Bkiy8MM=;
        b=BsBNZYClM0dZ/j/upeb7WypA0oNBk199Y4/sNJ2aZyzvl8ku6NaPkU6s2pDr7/VqYZ
         YIN1im/pCzgk/aSJ8OQLUA1aD2WawcDSzArX5ZZMJ8X7mABphupyyUW7mAafUx4jS9Bw
         XdFg43uAyJW0gGpd79s/XmKxQpb0WvJArnCCNsbuNtx5mnS6gFc9tT5z6dbNWBgJaY0+
         2CXXXVJdI/eSN455ZIzz3W3MINSvDI1XlHtmgySmlA8eN5C/4skwDytHdx3NmYfZML9h
         HIuiEcvLGDi/3mVLAbW/Q5ZvNLxbFG3KSRV9YB7E3WyqYW3U7DgOUrqzLlLkBAOH5u/2
         CPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928036; x=1777532836;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1Rv8LfN37lFeKpCNjjDsd/mT5lAqzaOO1E9Bkiy8MM=;
        b=JRJknhu45mPdegcieDZdOu4PsdePdTzd/AVmjso9BTRt/zgqTMjfKd6+eurUQGh7C/
         ugWTnADhJjz7etMFhVYu1w1h3aLazu07lUvM/oTAnqUVxTyViLUUuHED74rXz9U7MmLG
         b1n7PufYpekMLgzPHrA6teMRlCgqCtwQgN4BwBPR20fn3j5h23stS4KhF++GehvQLzqW
         s92jiH7c/jsbebPizOT7mWl+SyrRFJAi7eOliDA4vQj5PWTEkVHo5Iog1l3axZ6HRoTZ
         z5WrRXrafXAvPRXt6qHLayAVJKRYiOy1L4tKndIQ8QM1UmeqsUDwxEtd2Jv6JTmvBkXU
         ELPA==
X-Forwarded-Encrypted: i=1; AFNElJ88YNEoHqMlhB3mY5n8ldsOIcprCGVMJuPCZXS7awbbUWvO1CEAJdw50tH/kzi6Pg0QHFwkwhhHoP3OWi4Or5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGd98B9PDBJp8n9kakDAVjDLsQKk9XTgG5CLiW9J8raPFr3pl5
	r+sJAwi9n+TiTbLttvcf1HBtTzDbNJ1KnIlEWbYqCVsfMdULT69gPHIT4Blv2LFN
X-Gm-Gg: AeBDieuMo8wi2Rv99DQrPbHLnF2aNlRFnGkrtLs0CHudk7EhZqwBaiO2ypCteImtERd
	mDYhDtRwxObCsDFmGPmJAh0qgwViQwCaBhzy/NuNyiz6rqKQLiQEM+D7R+u7P/ppUu3EH8R8t3D
	tm3/yK4y5vW0X46MPAR57dCADF1BPmxrquQIGAP5r+iP81M6jHDCnIOqvHbw0OkrEI211eMTuEP
	EZVMSVyuu9b1GkKf8DY9nXyYd+M72n7QKwf7FazHrv78I173avnhQrqYOHtXt2qIWslQUn+cVuY
	h9IXwy0vBlrc3xvv+dMrLCh9ON3u6jlHlMoIhCIcOMuhwy7DJxTeOscrMW+w3ZWat9xmtHb6UkT
	YNtdZf1j4nS+gbJzPjF5RyIlz5nRwTR2OQmDNXkwJtAaAJ7vBmE4onytKZtSw9cij4bNWTX3Tck
	DxV9UnQI4MjEYesPqoTr3JKWv1+Dgr
X-Received: by 2002:a05:690e:4199:b0:650:1d3c:2ae4 with SMTP id 956f58d0204a3-653108350f9mr21476505d50.19.1776928036181;
        Thu, 23 Apr 2026 00:07:16 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314b7d42bsm9178674d50.8.2026.04.23.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:07:14 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:07:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] perf dwarf-regs: s390: Fix an off by one bug
Message-ID: <aenFGy9WDllTEO0S@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Change the > comparison to >= to prevent an out of bounds access of
the dwarf_s390_regnums[] array.

Fixes: 1e452dd850f3 ("perf dwarf-regs: Add S390 perf to DWARF register number mapping functions")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c | 1 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
index 310a37451bdc..f79216a7665a 100644
--- a/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
+++ b/tools/perf/util/dwarf-regs-arch/dwarf-regs-s390.c
@@ -45,7 +45,7 @@ int __get_dwarf_regnum_for_perf_regnum_s390(int perf_regnum)
 	if (perf_regnum == 0)
 		return 0;
 
-	if (perf_regnum <  0 || perf_regnum > (int)ARRAY_SIZE(dwarf_s390_regnums) ||
+	if (perf_regnum <  0 || perf_regnum >= (int)ARRAY_SIZE(dwarf_s390_regnums) ||
 	    dwarf_s390_regnums[perf_regnum] == 0)
 		return -ENOENT;
 
-- 
2.53.0

