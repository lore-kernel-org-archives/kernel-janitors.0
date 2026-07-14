Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B4A12FF69
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043992; cv=none; b=EbtVd0QEUAT9K2nqYxCKdLu9Zj8g4iIForhh5sGLsXloQhuw67jlSKf7PKAFN6kEJOiuup2DhTeEfVDyV/l7dUr0f46IXEFVjI5ID/jIQrInBgvUY3lntPXfNmXNHxG5qDx1ophjWser+MsbwFHkXb7oTRtjpsyLlG0qIF+sxhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043992; c=relaxed/simple;
	bh=H8JQXRpqd/R7eiQaAagelhJW+xLzxqXCql6x2TIrkE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DoKfXQMlvi+NVt8zqjt5324C+XEQAqbbcEm27Vsfxe29mfBo8u9i9l71sBz1hBdyA20RLGCbx31+9n9qe6UVrGJlq3i8vGqn8NG3vprcjJQxvTGYqvKW0P+zXZvul1bq8jg4WBifFO6PR+NMckLNAR8PXwzKWuEw8odVqwC9P4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYMN7/hi; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYMN7/hi"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6a379b68f76so1467105eaf.3
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Jul 2026 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784043990; x=1784648790; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lj8R2/2mEi74TIV5QrpV60lR2ndY+ekEIggjae+o8XY=;
        b=YYMN7/hildu6lEedL3Foe8Ev7vNSISGkpqiyYg1o4QvX6W0yZZb6/3QhU/FYZVLodP
         DLttDmWgzT1TNcyubAfcm7tiQxi31w9heRuTSqoryFn2MxfHK5aLmYy8wfbXCPzszoFW
         aVUNewe661SSZqkdshwmJnw6jL+4BVJJPXBRfmdEEkR2MG2Mzt/u9lcuoRihWOob3XSf
         ViKcrrT0k2ttOtgaLKqk0Fk9lPZOjPeO+7hfmJ6BVKtcPOWW4ZpdgkZzWIyw9dXf4iUq
         H9SUivwVza8u13xh7Q6ksDMTKyHSmmv/mUqkuwP0zXqmjREukSjx+janZJCbADELbnoz
         b7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043990; x=1784648790;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lj8R2/2mEi74TIV5QrpV60lR2ndY+ekEIggjae+o8XY=;
        b=ocgabzxQnHO47PVbPHBwji2is5fv1r0RVoMAPBDSKHz7p6gQ3daHtLq9QycNoy0lub
         VR7Hp8t0bZ1uM7UVggoH0Ke3qIiuaNGzBeOQ0pb/8ib/MsVZfz5Rw+qwhYqhzzlj7wfn
         LVE4Q05wXekICm9VgCzOemQdPl0jcBlTEQh9G4H6By6aHoJT907EEX3bcRc3vz4C5YWn
         3jfyPH+93XpmtpcHFqVUwpvuujulFNuB0dqCu92UwMebAtY41q041Qlitr0AWYPsKIyv
         tZnpIeYb64HL+C0ryiR5cRfHmqx0nCjoNC7HiOr6UM3P+rVEorBfwbGBgfrqjSXVdgPb
         axTQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qhZUGcpAQtA0FXJT57zsXhnWLCLXTh1Cmg/9EmZFBesb9bD8DykCCJOnXk84MrHSOeI6CDpgGUswBKLSAstU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPX1Sv9C7PW3TlKMsNtgUjbtEQrgxdMbqHzhlxOc3QJptv839D
	NMC11Gc3Tjq5yesRzNMDamxHhfDpbILZBSdPgB28Gj8sNLXy116xrbws
X-Gm-Gg: AfdE7clKrncsdp3bDkNRrscwnP5hSYb15gIPvhJfnoC8UFhFGseXqJqwYyPryU8vyqt
	nw3e82hYHtJpoLVtsRO/ut8kuuiCfVSIp1SsRPTAcnS2EhmEvjFSkP6XE9dj0ylVchuVTos3YJR
	5K90lx6LVjXdbjia/ct2+jYMRN/VJip1oBDxYFEDm131K0RW2PRQeHd2sNmxX2WZnnpiMXnTYXH
	FJSePABkeF3cBEbnooWT8Hk5URbebtk4S+5CHajshRhwlv8XWbOoVSeiqcVncLg1SCli3yFumGl
	dXC5Rvxop/fzvwK4M7wKNWsadleQNwqPQ3JlfIe8v9DoJcB8rK+sNthq8xI8ZHCyrYnwtFJKmdT
	bVNgm1UrEEdFX/QWpsWElXc0iihzN7eY5Cpt4wg0O+98T6+NE7Db2ASvEZUUc7tLXDfK0qir+Fv
	OLgLl5
X-Received: by 2002:a05:6820:814:b0:6a3:7d24:7b7f with SMTP id 006d021491bc7-6a3cb80e54dmr1400261eaf.17.1784043990420;
        Tue, 14 Jul 2026 08:46:30 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm8811714eaf.2.2026.07.14.08.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 08:46:28 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:46:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak Sikri <deepak.sikri@st.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] cpufreq: spear: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
Message-ID: <alZZzlY9rfdAvWac@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The clk_get_parent() function doesn't return error pointers, it returns
NULL on error.  Update the error checking to match.

Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: fix subsystem prefix in subject

 drivers/cpufreq/spear-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/spear-cpufreq.c b/drivers/cpufreq/spear-cpufreq.c
index 81a0780b2ebf..ffe5eda82f0b 100644
--- a/drivers/cpufreq/spear-cpufreq.c
+++ b/drivers/cpufreq/spear-cpufreq.c
@@ -79,9 +79,9 @@ static int spear1340_set_cpu_rate(struct clk *sys_pclk, unsigned long newfreq)
 	int ret = 0;
 
 	sys_clk = clk_get_parent(spear_cpufreq.clk);
-	if (IS_ERR(sys_clk)) {
+	if (!sys_clk) {
 		pr_err("failed to get cpu's parent (sys) clock\n");
-		return PTR_ERR(sys_clk);
+		return -EINVAL;
 	}
 
 	/* Set the rate of the source clock before changing the parent */
-- 
2.53.0

