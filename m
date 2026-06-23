Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF23A4F2F
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200976; cv=none; b=EsZSGAvyLT1a2OmCtSW0dB/ai+wcwKDCADngFVARtXJqDrNzPVhjiPxF2/owhnB4g50N9510RnsClFWgZzd6nDdxCopqL61Pv5KD1EVZTmbL+xFk0CH01hVBOqVYhkjW5Oe/I6vWlG2El52nwFLudslB/mRocKC6k6Lwe3z35xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200976; c=relaxed/simple;
	bh=X0z8lUjRFMAm31SvVn3XAHG6MCbc1NvvPfUwObFN9nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MuCVyPg+2TCbLtY0ALwug4h62/4eGfKmalgpgqxjHXDNetwlllJIW2D3mTcKimIZWfI/ENSRkgktYpL5rLlzOGX0QuZVW9J4NdDDe5bSJyPMBkP8t8Pkqadz4hH73N1xpARXxn8VXW79JdYo1orH3/ri7s3vc5Au5n4Ia49DKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyCKRtR5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyCKRtR5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c0b97e268f3so499298666b.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jun 2026 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782200973; x=1782805773; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UrCfxhTAecILkVCugcEHsa3TmnRhxKjXZll8FagDxjc=;
        b=CyCKRtR5WPjpGWv9Te0IUKhl9RPy6F3svSTAmM2bai6Z1zL3wFltvsmGot3IkU3WZ1
         T4AI7gzEGG1Fbd0MD7R3ilAI9UN74CNB5CLmJlSo4X8I1H8llLC9u5bWKHuwDxWBoDK9
         e6xgsKJ+cBckk9E+SUEm+KyGQGQe2nm5AX2Wzp1GIXemiKNgAi7R27NNuR8IHDq5SBCa
         YoB7/jn7sJQxxZ35lYo7/tJbYdbai0W9eYo5cw+PBIYI+YCpcVrtVFsbc5yjB45udOnQ
         feeXa8Ti8TD0fJxeHlQSrUC1AsXssJdBgRCK8yXgT3ESBZZ0gFOCV6moSCBMP0pj7uBw
         A2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200973; x=1782805773;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrCfxhTAecILkVCugcEHsa3TmnRhxKjXZll8FagDxjc=;
        b=ngPB002MkfcBYK+oK51WJRxhYxPrO8zF5JxF53mkPD+z4s0HV7SpJpVIk/do226rfY
         3immsWg7TbKlvN8xKFvITMInGrcT8JUGOveNE94nLiyP86V1qwCzgAPzaUUWU9MbWqTs
         GXdynrhs1K/g3WSi+Hm9WeqE/UN31kXB1Cvcef4sJVL+vYSD/qlt/WO0fYuUqZ9xcyy4
         kLS0OaAyKuVhvm1D6Hzo2LvHF4YE07iyhI1eQ8UwEmFwVDilNKqILdpLOIOnOTMLuG0g
         8t/l+eXekS3zkMXD6UTqMZFgwXRY8kq4AMitp426Xow+Pi7Xw738+N7aV4x8v+JFpXuY
         g+eQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vQMOvyVXoGbUUjJ8bEimfbFSK+KDjBaryylemETdugQdZtWw+9CAlotqOZKMdb9mzHNZOpwnysXP0JS/zbA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2iybnIRyjXBgt7E/iskk7MLYQhqaGLlHKd1Voj+y51/vuSWjV
	nLcBxxQCusczzBbxAND966WT5phAVinuE6S8rDa6RwluV8yz5Wkw/hw9
X-Gm-Gg: AfdE7ckIeO5fRh2JQKoGiGwjo2KVvzoTm6qXrhEgDFb+CnmajSJWsWg9FHwWX1fQHVR
	1CkzAL1MLhfTjsXW18Qz2/aUn/0h+tLa5dW3LW5A1jYEaV7O7i4+1R7aweLJ+OHaCsAzvBrKsNX
	Fi1kOeGvQPliBNfdXnI5ZFFCBGZAlZraHrg44MhrcZpolKNpYy4wZ0qBjL0P1I3+LfxNhbBTutv
	v4oRqDHxV+J6rbhq03qJtjq15Ow/NzVlIDgmNRTHaO+EIk6kz5eWxfguiDKaSvkxK57fJNuKwib
	zWhcur5psttTK/c1HnEfeMHeu2gSddIP56Ufrf74/r9zwc8vYzAZffLDvPQ070Aq+fDj6jzT+XT
	6WbVSyeoEiNTjf1V5DqDlYsAUvT6r7RjQJzYTddQKu0DmkrSjEdI0qgqylyJlr9i+FZdkZ7I0LV
	udbhJwvQzd
X-Received: by 2002:a17:907:724f:b0:c0c:3b13:5249 with SMTP id a640c23a62f3a-c10908bc4aemr64165166b.52.1782200972913;
        Tue, 23 Jun 2026 00:49:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cf8sm457914066b.13.2026.06.23.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:49:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 10:49:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] thermal/drivers/rcar: add error checking in probe()
Message-ID: <ajo6iQ3VWvcxedA9@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The thermal_zone_device_register_with_trips() can fail for a number of
reasons, including allocation failures.  Check for error pointers to
avoid an error pointer dereference.

Fixes: 9d617949d490 ("thermal/drivers/renesas: Group all renesas thermal drivers together")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/thermal/renesas/rcar_thermal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/renesas/rcar_thermal.c b/drivers/thermal/renesas/rcar_thermal.c
index 6e5dcac5d47a..71f836fbc698 100644
--- a/drivers/thermal/renesas/rcar_thermal.c
+++ b/drivers/thermal/renesas/rcar_thermal.c
@@ -492,6 +492,11 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 				"rcar_thermal", trips, ARRAY_SIZE(trips), priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
+			if (IS_ERR(priv->zone)) {
+				ret = PTR_ERR(priv->zone);
+				priv->zone = NULL;
+				goto error_unregister;
+			}
 
 			ret = thermal_zone_device_enable(priv->zone);
 			if (ret) {
-- 
2.53.0

