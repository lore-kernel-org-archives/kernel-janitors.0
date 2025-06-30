Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389A2144C7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312204; cv=none; b=CCDXfmzPm2Gmj8ohn53sdijm7s3uVKttIIQAFrlGHLKMWAvzHFuoSDlQLVw4zWSXnYmpXL4+ZRtFg/nSFQMHC9+QHcuksoxeE3p2yXHeP5x9e9jF6VmJAdi4eJW2lzYhgk+mwJrzoUDkFghIsX9Q05k+qw2Z7nKHaI7qSGFFuJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312204; c=relaxed/simple;
	bh=PIZPJ7i63i8C0TC1GjtbhrzgGNXE4XRxULt5H9rtUVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvzcUUYG7BlAlCI3ygnZTUKi2HOMl69q8ZubKHINWexqJiWgsPuzdzguwKBCvOEnDVXV27yLcXgfvyN677qJS+6q3YJ2ajl7il4fmNxWqMr50L4TfROwHZWA+bzWX/rZEiS3ISHqh/kJjbCMm5Y3cZVyGneTtKYoEcyLxHQ2YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaNZwgCd; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaNZwgCd"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6119b103132so3030783eaf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jun 2025 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312202; x=1751917002; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rFs3jWGVmRQiCPCz55IrWTyhhJse2uDEsntELmdGZSw=;
        b=QaNZwgCd8LTUrRGOqXQg/AzG2jvyTlkvLpxZ+mvKqDxX62j4L9xJTbvtYLSkhGld0K
         Pjj4/ECsMfArbItgVOIoTW6iIZBrJzSp+DVSNVKM6bO27ASyD4bkn9J49/bbxKTs622F
         jegbtqUWdwJG8XdDuatbQnBbUSrjMClsx/5nEGRgBc81Pehz+ObYpe5u6gOhI+FVVEBP
         TRx4jqecbqbQ5C8S4+RFMU7g5TftSyL2TPI7hJI5jO431XJaRQd6e/HXQxcbF+Vk7l39
         EnZ22C8TogGRkyRxF196sflQOLXOM+6ONzJlBuHOlckX2MujDWfjIMgzmg+bISUj1nS+
         nv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312202; x=1751917002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rFs3jWGVmRQiCPCz55IrWTyhhJse2uDEsntELmdGZSw=;
        b=Jn28YSkdiBl63BrHGnLgvXG4kaXFREEc1hTsAYQPBXYLuaVjgHEs8wN+6/8DIgVJBd
         JdR+nK5NVcru83GxnwkKrU1u2H1KnFvrjeOXvgZmyMTB5M6TlCK0Ms6v8FlAiPzPFwH1
         aSQtVWzrMUMhA06wwyvKX3VtM60TbDepcvzb1gaLNFM0yjNzKW2s5nBAd1lIN5GCwian
         QmOyEzA72fAvUcIM7Mf9IZyzCZxcMSVefkVIxeQTw4Xa9eEs71O1wMGfFALJshdRy4/Z
         rTE45qjy+PDfuAOM3J00Px05Zm0SauHrv6nArkliZ8SnNc7ADqMgsHbmHO2fE6rIz2uf
         KEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlnhVm59zjl1z4kq5v1YpHPFIpcACeEGfl/JrB+1eBnP8dUhGXLFZk0BaSBrSIIAfYFUA23MhGTjAwaBeuaK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM4+dIASlM7izUJWSpGrrIeRthX2z5MpZdZ4au3rA/G/b4CSD6
	tHraDvee5ZJ0cqx3ou1v18Qo2o1rauCuBVfQY6rrs9EdKJv6Iuy7XUenwbSCKFj7iHw=
X-Gm-Gg: ASbGncsGRH4ynXtr+YYoZHicqBKuDL8+67Lik6gGyweIuBvANOCx2w6yz4cETnaRrHB
	g0WfjpKVxPZBF7QO3h8YH6KvQ3KcYuCiX0W5UBQAny4+z/5aaOpeY/qMye6+hBWVNd7t49EYx/7
	mA9/DXapC/9ehkVr1hYRTC/2+7cdapjDinPpuWudheSraJ7HnAezXnIO4OxZ+o4GHnXJfp/gtf2
	1xB3e3vJFNMnQLElm3ryZSCyBSfBUZEweVIZkt9sPlGA6iJKXvzvPF+hLWPAnBH/0OuwGl2E0nT
	T95q9E23InO4xgQlT6sggyoHKGUm4HBO67Lffi1FKJkGIo7MI2ABBkcoDepfwjcma/4QmGWQ9vn
	/Rec=
X-Google-Smtp-Source: AGHT+IHjOIaQTv70hTn6APt2/cC+UCDsl698/+NS7It4EICnrQ1NcFfOWmmAvQSJbsGHKSZ8d4JqzQ==
X-Received: by 2002:a4a:ee04:0:b0:611:3e54:8d0a with SMTP id 006d021491bc7-611f389e302mr585444eaf.1.1751312202009;
        Mon, 30 Jun 2025 12:36:42 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-611b848d86bsm1176542eaf.13.2025.06.30.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:36:41 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:36:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Ido Schimmel <idosch@mellanox.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] lib: test_objagg: Set error message in
 check_expect_hints_stats()
Message-ID: <8548f423-2e3b-4bb7-b816-5041de2762aa@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that the error message isn't set in the caller:

    lib/test_objagg.c:923 test_hints_case2()
    error: uninitialized symbol 'errmsg'.

This static checker warning only showed up after a recent refactoring
but the bug dates back to when the code was originally added.  This
likely doesn't affect anything in real life.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202506281403.DsuyHFTZ-lkp@intel.com/
Fixes: 0a020d416d0a ("lib: introduce initial implementation of object aggregation manager")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 lib/test_objagg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/test_objagg.c b/lib/test_objagg.c
index a67b8ef5c5be..ce5c4c36a084 100644
--- a/lib/test_objagg.c
+++ b/lib/test_objagg.c
@@ -899,8 +899,10 @@ static int check_expect_hints_stats(struct objagg_hints *objagg_hints,
 	int err;
 
 	stats = objagg_hints_stats_get(objagg_hints);
-	if (IS_ERR(stats))
+	if (IS_ERR(stats)) {
+		*errmsg = "objagg_hints_stats_get() failed.";
 		return PTR_ERR(stats);
+	}
 	err = __check_expect_stats(stats, expect_stats, errmsg);
 	objagg_stats_put(stats);
 	return err;
-- 
2.47.2

