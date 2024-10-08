Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05AA18C910
	for <kernel-janitors@vger.kernel.org>; Tue,  8 Oct 2024 23:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728431141; cv=none; b=Xr4EjcqOITq8GDtpKHNbrvN6ZTrF4NVyf7g7CaatjrIw2PsF31NzM4UixX7mioTSwDrXAGsJ3wWtOT5KjLWoSASpfr5oUW+CjT+j7bGCtcunYgJXj1/uLFVsq3wE15NYaHOcWwd0C5Uj7YTQhxatdZ05vgiWPfTp09YHEznUlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728431141; c=relaxed/simple;
	bh=bCZmzTMm1fduflRwYohg+qsNUnboVQ3kGZV0ddcyoDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBqmnRWomJbAR2IIhBxWzFyxfksoO3lkfrVweJfTbU5jZv8K1b0yanvxYzx4OGoQT+eDLxgI7zBiqaufbwE010eDycmJRdeJSZjH0cBW/3lvGxlBlBuIL/NWT5pSn+GuKn6mKxJKUxIXW1ugmkdsyW1DnUFVlNGrQvOScKVvePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=fail (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b=NKpWF6O1 reason="signature verification failed"; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=everestkc.com.np header.i=@everestkc.com.np header.b="NKpWF6O1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e050190ddso1973261b3a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Oct 2024 16:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc.com.np; s=everest; t=1728431139; x=1729035939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F6zDPvO9jWfZI0VBRyJNJETUDrhSoVwHfhfz7RdGzrU=;
        b=NKpWF6O1weanghbV5QMXLgYhFpAPAEgH+PvRsxvJk9fbMlK6yWB7khgLxJcCn3B5js
         WwlezYs0uD1gvPpuckKlq3kx6YOGayp6jidua0xPvFoKPwFwy5zGmyxIng9jyxiTiXD7
         tsZAaW+BqYmfPzwsw4U9zJsEgOoX9cfcbpMopoIFP0CGpLZYTGqlH0Hzk/oaEgSCFaJG
         kP4M57Tc7HkwBltRkQEyFf+j5fN7tW+oZzFWxSDolI41zFg5oIxFqHdbw3AeeRpOgIvp
         dtCiVZCltOeYq2u2ib3RB0xJjZFlls7pnREjfZ06g9PtUjcJNR8YKqPp+FtY3LTPTPxA
         DVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728431139; x=1729035939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6zDPvO9jWfZI0VBRyJNJETUDrhSoVwHfhfz7RdGzrU=;
        b=cvS4VhzUcmVajIwql29B3KvhX61Hfzf0MHKAXFD7VVEeeTRCXJfGQOarPUcGWWI5lT
         Ll3gf3iI7CphaW8UzheB3PVUHw/ckcPXZbCvTvF65RHqmuFDmgLtZuifgiimxR8zGNhR
         b9gH/dIlhjsGvw27q3d1KmRoDCTfI5YGVCHIqQBNxUj1xpYjMlCWchwLmTRoVpVL+9PV
         8y4gDxKK3BMiW5I3yoViZOVw4igZubGJh8NRE4EtRhccT4nsJu7jCmtIeFPAQfTk1+Io
         YLpHq7PuyV6kqUN+3p4lL3tlGmYa286Bn503uDRI06tX172TJBAH0YeWDgdEirhKhz2o
         NtjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQGmNqW0N8H/TEG7PeWn2Gl9Ue0KulC+B0OJgg/8/GGpW5MT66pjZ1Q7I1EoGtlUpU5GQf4gZOdjcW30GlitM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzETgvCbxPaNDhejzZmRQZ5SgfwF2i9m7J1bGKM55+cGX5x6uOb
	GbQtOgwtk9tRVRzTE3O/FwcyxXFqw+04HmtFtdYp3Kb0Wo+IjdaHTFOUeXo21eU=
X-Google-Smtp-Source: AGHT+IHk9+tlA16Su1ssevBPWt5oHpt2DeyaQ9HKDjWn0d/+7kP5lBTgDq9UsaTWDOpbj8k3ntKUZw==
X-Received: by 2002:a05:6a00:2eaa:b0:71e:bcf:454e with SMTP id d2e1a72fcca58-71e1db67325mr922826b3a.1.1728431139159;
        Tue, 08 Oct 2024 16:45:39 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.223])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71df0d7d06dsm6634651b3a.204.2024.10.08.16.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 16:45:38 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH-next V2] ASoC: rt721-sdca: Clean logically deadcode in rt721-sdca.c
Date: Tue,  8 Oct 2024 17:44:20 -0600
Message-ID: <20241008234422.5274-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the same condition was checked in inner and outer if
statements. The code never reaches the inner else statement.

This issue was reported by Coverity Scan with CID = 1600271.

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
V1 -> V2: - Updated the patch prefix to PATCH-next
	  - Added how the issue was discovered 

 sound/soc/codecs/rt721-sdca.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 36056cb7a3ca..4fd26e490610 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -611,13 +611,9 @@ static int rt721_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
 
 		if (!adc_vol_flag) /* boost gain */
 			ctl = regvalue / boost_step;
-		else { /* ADC gain */
-			if (adc_vol_flag)
-				ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
-			else
-				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
-		}
-
+		else /* ADC gain */
+			ctl = p->max - (((vol_max - regvalue) & 0xffff) / interval_offset);
+
 		ucontrol->value.integer.value[i] = ctl;
 	}
 
-- 
2.43.0

