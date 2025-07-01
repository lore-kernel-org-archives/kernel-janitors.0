Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92992F0C7A
	for <kernel-janitors@vger.kernel.org>; Tue,  1 Jul 2025 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751409006; cv=none; b=GZ8ECsSVM+9GVqlf9wFdAdyAGIEMD60OXqCpQoRhSXes7DXUsobC3KVeYNZ3Rm6IMMY0wLH2Y9XE1DkPRvtYpvvM9Sz/VYFbAcn5BeyegqpAXEBL17qOhqlB3TYbj0iAwYZ3U3tWONly0F5az7QWA5amg32Ktgv2G7WQN9Sm1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751409006; c=relaxed/simple;
	bh=3JrBXH7Zk+tWwvjkRUHmx/6T/vrRcj5uCGINdZkPoik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9qe98KFbg2t8qO5Ti8kDD9owJaTyIujd0qVerNi8g6IoqwhRcicN+aVmUmx9yMdff/cBBeoj3UFNtzOUIXgDdhdAOv7xgm81hL3K5xdLuRh7CjV5g35ltfIfSrQe+BtgLzgXjjftM8x2NEbVP4ZySJn2cd76uwssUdIaC+ZADg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D76sgXXG; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D76sgXXG"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2eacb421554so1124345fac.1
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 15:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751409004; x=1752013804; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Etb4UD6KqWxQem0MdhNJMYQBBrscnivKN90g3gZa3fM=;
        b=D76sgXXG06wExVnxqSdQNW6uxmpBLeMCIpz4WUifeaFnKAJPJ6O9Ma48gRblbpqY5x
         J2pBiQVKbKJCCOM/skV5Knq0ajni/ANA/GnxQFmE3zFlIdf5y4HMwSJrY5qGKRUQurez
         bXf/clrlEUjZRXlgBsGNEwpbWXup1cvA41zOA8/Tv6hUqeNZmnb3qaKJ+zP9wCBqsbeK
         sNSvz0s86TRw9YA4Koiqe4/lSCRfPt/j4AbMKlhxArWHmXmJLvFBE/HZWTFg40qjcFlP
         5KFH2aU3V01LmciJw00UYQF8BjKHOL2NzKSpQ9oSLlHiqpU6O7GnuKfp2tdIGrRCkBSb
         2D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751409004; x=1752013804;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Etb4UD6KqWxQem0MdhNJMYQBBrscnivKN90g3gZa3fM=;
        b=r+e0DZTR2in9xz/xNVYwDtHxPSwq1/AupiJ97HOC4yjOWEaAzjH7/257t0A2DR/ZP2
         TIDX71Ngd0UnfxrWyLxLL3odz5PqFgjeNmL/CstOQSVvOv84C83zp4p4T5SFWDtmdxoP
         XtLRcun3wC6tde1PVoD0EuTIkSmsu56vzqjsDxfP6Dg5bbvceGoOg7iVDKHZbE9mdohe
         pR5aNZAiNIkbX1aEGRVA0FdacSnF82iW7wh04ODEIkeNkpVgk2gdFmICWD2FxlAj50qq
         ndshU63m8W6WGICjOmZsWK3lfkaLL9s+PEjKjPIx0rThus28ajfpZgeAeYUtkaG4pzGb
         wNOw==
X-Forwarded-Encrypted: i=1; AJvYcCX3rvqeAehH9LEV1wV8ksGzjdKyf99Awp1Rlo9rwFAMfTeE7hOoBoddj2Jf/6zCSsiJql2JjPPd/wpyrbh55io=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP4Ph1RCVsGhOQsr0T88TjMHz/e/5BLE84syMkqwZVxRlfy9X5
	X1ctmDdLbJ0RKZbinTVrvw93FCceNbrzUt3Qs1lZQ418pel683a51dNZztE4NzpzsNg=
X-Gm-Gg: ASbGncvZrKJspc2uZQUSE+9fAPwQsGIYGKvTS41rcYJIYEHB2RYkLHPcyf/d5bRHxMc
	9fRVXu03FrIKJ/rSMPx4RSyYsG5ul6w3HSM/i2taiJ69mfIqQo95xzoqrvWWpw4zQNvx9nQKK9v
	p6RP63g6HuH0fWuoRbllxrrCR8byXlnm97YDN9Wvk6SuXE+ljdN2M6p7X0EJcp25Yth4CxK6cpz
	AjD2i0gQFEA81l8gRrgwjEOyV3KWgxFrqoVoPQ+lgUTMPLvb0xtMiKWvvJoEcmIzlCzQ2Tahxcz
	+7/9YHV4MKjGXm2R4nHSxuXlCfrcPvyK/Et2ISj+5YkWbdr/rtLOPvovu/MBnS7L5sd33g==
X-Google-Smtp-Source: AGHT+IGtlelvTdZBEfLOgu4yc8UC9jO/FagWLMwPc+EiONKKAYKCxJCDRSlYN5VFSZ2lgO/XNp9I/g==
X-Received: by 2002:a05:6870:b603:b0:2ef:14cc:caa8 with SMTP id 586e51a60fabf-2f5a8d1e8cfmr458910fac.3.1751409003574;
        Tue, 01 Jul 2025 15:30:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d663:8de8:cafb:14e3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd4f37065sm3517369fac.21.2025.07.01.15.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:30:03 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:30:01 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] cpufreq: armada-8k: Fix off by one in
 armada_8k_cpufreq_free_table()
Message-ID: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The freq_tables[] array has num_possible_cpus() elements so, to avoid an
out of bounds access, this loop should be capped at "< nb_cpus" instead
of "<= nb_cpus".  The freq_tables[] array is allocated in
armada_8k_cpufreq_init().

Cc: stable@vger.kernel.org
Fixes: f525a670533d ("cpufreq: ap806: add cpufreq driver for Armada 8K")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpufreq/armada-8k-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/armada-8k-cpufreq.c b/drivers/cpufreq/armada-8k-cpufreq.c
index 006f4c554dd7..d96c1718f7f8 100644
--- a/drivers/cpufreq/armada-8k-cpufreq.c
+++ b/drivers/cpufreq/armada-8k-cpufreq.c
@@ -103,7 +103,7 @@ static void armada_8k_cpufreq_free_table(struct freq_table *freq_tables)
 {
 	int opps_index, nb_cpus = num_possible_cpus();
 
-	for (opps_index = 0 ; opps_index <= nb_cpus; opps_index++) {
+	for (opps_index = 0 ; opps_index < nb_cpus; opps_index++) {
 		int i;
 
 		/* If cpu_dev is NULL then we reached the end of the array */
-- 
2.47.2

