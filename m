Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AE1C4A16
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 13:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972937; cv=none; b=LRWBklBGIk/PtIFX3+XpKBHVbKvoJhSjwGqiA3B6dmtPPucnaGVsae2On2f9e+xKZKMfgeSRT1tV0IJ+eC15QkU09aJ2PWZfEapFsN1BGyo8c+rhVXPD4RM4XexfbMCfgTyzLokxzyI5QIrR/T1Fit2H0RhgWa+dezpXK3oQCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972937; c=relaxed/simple;
	bh=oMwaFNRSxLI6lNwV/DUx9I+Ovl1YavfQaqXHXDL8Ito=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaYV/we169vzUaWqmc+99fX2lFEr1K99K/W5YsXTCtTUa2XdIuYFuTXvzWr6V4mVox1PiFE0B7sHYquiZE6YTqmXc7hkbtruCMJiz5a/r/Gk4fSOrloZe8bS04gfhnFWfzvQmyhrEFPl0wqmE46tFxVKf4bFTjh6GdzrALqxEhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K05k9B8i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K05k9B8i"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaeec07b705so1003824066b.2
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Feb 2025 05:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739972934; x=1740577734; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIzLBEimKpadUH9ewb3+li+IYyg2jvk1s+5b+2HIs6I=;
        b=K05k9B8iTkOh12rSVkvqXRnUOotxg7UNJQSehggQWBSIAj3vdaXfnpMTjCp/kkNfMp
         8MvAckYpqNdPe5XqeXpv4cyQB2Aue8lP+73+B1l8imOaQPOYTAMLJq/N6O8GiqoUHdm4
         2H0vsxef45+rKNHFaTxcmTRG9jznlYvUO6C1Pk2j6ZO0hPiyJAsPMZ+ZDK/Lpd+LwLfW
         9Val9YmZUoD9LK9ymCevSnHKDfxlUXfVHOkJqg+7j32EYgLDtw4y+Hp/xo0bBWkFcv4c
         k6+onWfNAszcJS6zsNGI1YMagPGp4yH5VlWhx+mogjHCsDSwMKfY60yOvr8vgQAiYsPa
         Hyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739972934; x=1740577734;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIzLBEimKpadUH9ewb3+li+IYyg2jvk1s+5b+2HIs6I=;
        b=naOja0zLgtqLkRFqJu3Wk3+OSpX15GgJGOby3vDWEG/f5ID4gsdnfoXCCPLLScLCA/
         sSFNw02DeC2J2FsbGFQ4b+/wxrkfwRcINlfsQyOy8bpVjRf4i5YflXnHGQ6I589NSVqZ
         k5o+Fy01rzwDf2Egc8T4hhFxkGdl5J57/lAN3qr81/ZRFcWEevrjAqzp4lUlk4huYQmV
         xnZlg+eD3S+vF3ZuRmwtv8wKkni5g933niEy4l0vlHb9z5HbYG1r5oNOH1NtDbVCN7bi
         ZvCit840Z0S+Ehk8TKbWIYnFblciEpX+KMIz+/5S0HvmJDHFfp/NMIA3/Db2gyMm2XBe
         K/yw==
X-Forwarded-Encrypted: i=1; AJvYcCVCqNez0svQZtaZp3LBqsWhNnufFJA4YzLQBon6ZqGu+9Rq4Lij1YBARcTran+fUEO+NsAwA2uXJYxl9wQjyFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFV2vXHwRIWaLNoky+Z7RsYQv6gpeUgqO6iGLZxmdtUs6xwa+h
	xf+4zQh1TaIe5NXrz6PqnRTJ+pl/vsKGSMVPhrW2+LbznNagJf1sdLOeElegZcA=
X-Gm-Gg: ASbGnctdXWB6/bFkWh2SRMIue4o4nwOdUfm+KIRrbPGgoTtwGPE3yi/w7a4h7ZZll8D
	SJWv1Ey4yZKqANl9czkhg6v5bqZs09NorkJeBhHb8aQkL7pQk0a1/kpN99D1if3yiNwF5Oi1NQK
	Ukp0uGrgmu51UgJcf0xvLN9NnoiMh9jWgjOGwjnt1q9E1mqzSyPLEl69WcnK4CAn2Qg+tnXFmUN
	S/2WFngfSfRpkSgos82mH+kA0PNkgutPAYipUJgBkFGIosZ4Gl1u6g+VeZGmX8Or03RduX9ztrT
	9X+enMRTKrdMD8xTVCSP
X-Google-Smtp-Source: AGHT+IGVvTzWtsgWQmX9AYDEGxJVEA48DTkqKoPAbaJuri2XyoyiLcFTQ9TnZOBStmbppRu4kyBHZQ==
X-Received: by 2002:a17:907:7ba4:b0:ab7:eead:57ad with SMTP id a640c23a62f3a-abb70de4097mr1690745366b.52.1739972934169;
        Wed, 19 Feb 2025 05:48:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abbad297430sm437130666b.5.2025.02.19.05.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:48:53 -0800 (PST)
Date: Wed, 19 Feb 2025 16:48:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Luis Chamberlain <mcgrof@kernel.org>, Will Deacon <will@kernel.org>,
	Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] x86/module: remove unnecessary check in module_finalize()
Message-ID: <fcbb2f57-0714-4139-b441-8817365c16a1@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "calls" pointer can no longer be NULL after commit ab9fea59487d
("x86/alternative: Simplify callthunk patching") was merged.  Delete
this unnecessary check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/x86/kernel/module.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
index cb9d295e67cb..615f74c4bd6c 100644
--- a/arch/x86/kernel/module.c
+++ b/arch/x86/kernel/module.c
@@ -278,10 +278,8 @@ int module_finalize(const Elf_Ehdr *hdr,
 	if (calls) {
 		struct callthunk_sites cs = {};
 
-		if (calls) {
-			cs.call_start = (void *)calls->sh_addr;
-			cs.call_end = (void *)calls->sh_addr + calls->sh_size;
-		}
+		cs.call_start = (void *)calls->sh_addr;
+		cs.call_end = (void *)calls->sh_addr + calls->sh_size;
 
 		callthunks_patch_module_calls(&cs, me);
 	}
-- 
2.47.2

