Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1251537CE
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961353; cv=none; b=S6sEmXLpvkDPRrRELQ/SdCn3W+ul6jKd+YEWbTCer4d9dKd6GYu+GM9md50HHFSUA7z3C+0n9EJNSAlCDkq87fr8VwDT/s3k3y8lqYNRtYZ8xU07z+Yuce5ljvdjHIAJc8mWKU+d0TEJaGnFi/P8JQL3PMXKNIhi5Do8BJxm2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961353; c=relaxed/simple;
	bh=Weo2a5ax1Dgd3G4tabJuyboWF8oq3jSpkgDF05+i5rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=REI63WmmlWyQ3Nv4/MePGO9h59cM0L97oAUV5samVDWiWtx9a5asoXlaeUa57Qli9FX7frqbi+ejsdTFpKS2HM+UMowyEJj2H3G3WnG/Pgb4xwoRsfBMZ22ZjV8yTxsJ1OeG+g5affCW+6DUUQ1EqdjxJT5QZOWJDpLjDD9UIAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=shwjXy2o; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="shwjXy2o"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa5500f7a75so402602366b.0
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961350; x=1733566150; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zAH9/uMjrIge6JK5bCm30pjNTYCTeIEEafsvRP3s6t4=;
        b=shwjXy2oDhi5ItM6msESdX0ad+mtnsrYYEClv+EUxN9xo5eexZ7M418iqbcbuaKRzY
         9x3/HHIeMVtQeNXZgocpOZR6D9RYUB8HC6A93t1n9Px9dCZ+ylXVRWTyHU0xKz/MLtl/
         8c31TOOgRX0xiMn+ZQQADJ+I4mSRP+yHt5O5hPw512AWqx/5k4U8r7AZk8ksVIIZgCU1
         Kq93SqCGiJhMhhhA3wO8GSVH4G8KKzetwcOsfRUQhRSiUGGI8kMcVhme0ugVJSY5Jfgw
         DAb1qC709n7aYgQC+ffdjG5LrrzZ6/mnkxSGV9qT30pgtAqeiM7qqcJFEVatR+p706hU
         64pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961350; x=1733566150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zAH9/uMjrIge6JK5bCm30pjNTYCTeIEEafsvRP3s6t4=;
        b=GewBqZadhqKzPQBJr85AcbJUyoFD5a3TrzdRscucmpoLxFEEoUijx0OsNBY90+zCfI
         tr3J1azt9lDMvaKk//z1eBCg0LmkieYPZHwy/gCQHjI77kbLPaMF0pA+o0lscMeZOEy4
         3sNSB9EswZqS0Hn3yl9qcNl61eucOV5PuazzjSerwjxAgHiAaNFitRkSqlkvrHdykuM7
         xWLeJZCPSma7Hc9RgMZVikORKv+j77DoFqyHDe+PsFoem8fUfSAsB2MTLmGWTv/S1P14
         /c8GPomju5xyJHEkyvrPLOIv4SHmepuGW2cS+sCs2RrHrJ7Zk7tTAYsMgVCTDnhfl4Os
         0h3Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1uTHCFvF5r5q91RK5xXNOYuEivb8UBttXmPVIM5KdCFuuK0YVEK6WhlbNrcmc4b5EJvZzTLpgg2Jh5WU7rPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/zPFEu8db07ycYWz4/0+X30wnwXJb1ToC83fKdeVgaBBSE4/m
	VpBiWoROWiUDTMDahFeVLWx6Rz9t5lrqMbEIxS2kzNnUwcCunrAk81Ty+fNl1AI=
X-Gm-Gg: ASbGnct4G8lkhLi0D7VApbCfEbNrXiSh0dxuc7CfNIR3YBoJSfWuOyKiagkH3znl6Ch
	iTLLYKootT4L4wwcqztASp9m9Z53jM3RKpw6Sfv9Esq6H5yHvxvrA5uHOebd9i1VDlCwYKhjcXh
	zW3KQBucrWkc94qvDz0MkFLpckfvpI+fZJsuAoXdGBH4a3VTdDLaQP7CbwlNG01ezh4YQOIsVKf
	k6zgLzRjTaHb3hMNCLEkKEWunKXV+0CCfL59BvHhqfjZKSsbTK2L5LKELybGp68XOYn89yF
X-Google-Smtp-Source: AGHT+IEPDZM1flLC7d6h2HgZwNLzFPMq58Jh4oKHV3DLxZuKAwi6yH0/K5kWtWvk0GadwpADW8Y4kw==
X-Received: by 2002:a17:906:3091:b0:aa5:4b7f:e70c with SMTP id a640c23a62f3a-aa580ef2b2fmr1196125466b.6.1732961350575;
        Sat, 30 Nov 2024 02:09:10 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a9dfsm264657366b.157.2024.11.30.02.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:09:10 -0800 (PST)
Date: Sat, 30 Nov 2024 13:09:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: SOF: ipc3-topology: fix resource leaks in
 sof_ipc3_widget_setup_comp_dai()
Message-ID: <67d185cf-d139-4f8c-970a-dbf0542246a8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These error paths should free comp_dai before returning.

Fixes: 909dadf21aae ("ASoC: SOF: topology: Make DAI widget parsing IPC agnostic")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/ipc3-topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index c2fce554a674..e98b53b67d12 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1588,14 +1588,14 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 	ret = sof_update_ipc_object(scomp, comp_dai, SOF_DAI_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*comp_dai), 1);
 	if (ret < 0)
-		goto free;
+		goto free_comp;
 
 	/* update comp_tokens */
 	ret = sof_update_ipc_object(scomp, &comp_dai->config, SOF_COMP_TOKENS,
 				    swidget->tuples, swidget->num_tuples,
 				    sizeof(comp_dai->config), 1);
 	if (ret < 0)
-		goto free;
+		goto free_comp;
 
 	/* Subtract the base to match the FW dai index. */
 	if (comp_dai->type == SOF_DAI_INTEL_ALH) {
@@ -1603,7 +1603,8 @@ static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
 			dev_err(sdev->dev,
 				"Invalid ALH dai index %d, only Pin numbers >= %d can be used\n",
 				comp_dai->dai_index, INTEL_ALH_DAI_INDEX_BASE);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_comp;
 		}
 		comp_dai->dai_index -= INTEL_ALH_DAI_INDEX_BASE;
 	}
-- 
2.45.2

