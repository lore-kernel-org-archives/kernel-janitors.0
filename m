Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3FB153BE9
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003527; cv=none; b=Uybo9bfpIT26FjxYXEzBlUc3JjoU2PORQjdEpJiVBZ0LAr+Jpo6iyuMXDLFp5+4VpO6fbpuinKXuwbNX0EMNd8AHr5D8EW1n1YQa6WvpnrudTSRJqs/fKcYeSObxVay2XS5/f4uj24G7T46PIM+URlAiIJJy66wViPe9y4mWRhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003527; c=relaxed/simple;
	bh=iyHWDRHqIdQqUjQt4Je8Lh1m7HHX7UTqjbeJ5D3U40M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugXJ6sTSoo7DFgt07QYPs0+WgsbOnPFhlbsCfahqspitnqn66GG8DeKijAOFKn9msbyiJeEHMGvlu+N50cjCdgANybQlT6/0sI23MR5l8u5aLKQ6OLjI1MAknIRmRy5MNI7mbbQT+DGO2SQ3boqgubi7ZpY74kCfyYNPDsN6kg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iwTD3xXO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iwTD3xXO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso2550557f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003523; x=1762608323; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=da/X0BAO6IQgxLa90hj30nT8tKzSWhqU8L60WSbzH/k=;
        b=iwTD3xXOM+qxlMwWMd1K2KaslvSaC2jOgu+6rXoKd1XUWfG7TVc77nbuEY+b7HBAMu
         JKr+h0Wt9zqLhJrm410eVEHBoxykkJP1d0bUobLlQhkppRqFDWvw88Gh4xbqtqMXx03G
         aIvzHW9LHuW89OkuGIOehSCaz1WDilq6IeXQBup9cygDZqZAOF1Y9NKY3PSqpfBKZj9e
         0UoUqSeXWwMMfgCobJEZ55Uwrc8UW7ns5pzW/kb7i4JADTXmaW4W5Ax7EYAG9/KCtiXH
         c+tz4v4g6RLUnNOy9HSuXayj7M3mrEK50oDlbZrbTyxSQybRqdhF01MEAaIgLh/E2TGm
         oxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003523; x=1762608323;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da/X0BAO6IQgxLa90hj30nT8tKzSWhqU8L60WSbzH/k=;
        b=ARSrO0+5/toA/rqOuY7SfsJD93Uckx3t3AI/y6tZQDPGr+vlQRaxjotGx+JUMTMryh
         yCs5C6EhZNkLuHhaKojhhNnZ3oV2odiTbCmRfGfQEsYoCKbNb1GqqnymlC77QgXZ7n9E
         jigrzuL+C5MSl6eQf2QyEeg2B1dUcrUMLRlsPc2IDSE11/vYQX/TXvxKPOjI2FkS+Zgb
         5wcy8A8R8VA+gK4LKhRM2SnueAWut5+E/YWwAjw+akr22dJoYx5x0E8J+BFY92VTGPCA
         1/iv17QIcAaPpKmPoJN/vOBhsb0g2v6MTNaIOfl0YLSELi9IW8NvZxADL7m/x8DoS86A
         Nnog==
X-Forwarded-Encrypted: i=1; AJvYcCXHaG44VijqlIxi6IGLcuo1zUHCQA7jywfHgIvBAzA3jUHcM6EH+QmevfLcSQwKWTK3Q668jj4eHyTGtdMbh+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy2HoDRFVDbLu8U8vnsPgUzjkDW0WzvWNqWnfS5OnHztqsFsdO
	wyogN9L/JJKT1CCdd18C5jFdvrz5xSpqzJN7bYrYPPuYZ0DkJIgXELCkRYM1/GrhHIc=
X-Gm-Gg: ASbGncsUDeWVKch8tILyxX3Q24FVyUWlNOHX1p1d7AwbzXN8SakeF9D2IkZRLQiQyFP
	UqlS2HysO4EIABoZrxyXUlfGKu8HFpdc+P4Ekr6cWEyaqueuVyuy5OS0uhT4Ra4yj8XdbX73gWU
	Lds4Pxb+0SmKJPGl6HnpKlal3dnF2nDPyPguUs7+NMpa9ONa1bEAPsYYMTQN8Wx8efz4B3zOQ9S
	DHLF/hVFnnX/+Qh32rDVcKkdnKolAgfLq4nmGF2zxG1vUgjiqKn0NMvP0XB4YDUlVampA9GgnB8
	q2xWfEMSxN6Y7azv8E3PGYT+cCe1P5ZJhNOwNNJ8qglXPV7bgN2Kp4mMhSTFC+GqNqKsG/qCCYP
	nJ+foLgQRiiszgf4cN+KaqifGeZTj8fLSlL9dvw6yBP/609znekcALRclklzX6pQOUW1vSeLVN6
	J7BYJBYMWFgJcWcFka
X-Google-Smtp-Source: AGHT+IH55pTq1fGBGY/yaTd6Zj2Bh1mij01mMvvtUN4wVORgA5e25w597fEIJ18x5AR1pis3PFBXAA==
X-Received: by 2002:a05:6000:2910:b0:428:56ed:c68e with SMTP id ffacd0b85a97d-429b4c3809bmr8835430f8f.9.1762003522937;
        Sat, 01 Nov 2025 06:25:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4773c55dc6fsm47662015e9.14.2025.11.01.06.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:25:22 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:25:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] media: dvb-frontends: drx39xyj: clean up some sanity checking
Message-ID: <aQYKP330_-4LBa7E@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Delete the duplicate check on "demod->my_ext_attr == NULL" and delete
the unnecessary curly braces.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 428b31e60874..57bd5d53339a 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -11350,12 +11350,7 @@ static int drxj_open(struct drx_demod_instance *demod)
 	    (demod->my_common_attr == NULL) ||
 	    (demod->my_ext_attr == NULL) ||
 	    (demod->my_i2c_dev_addr == NULL) ||
-	    (demod->my_common_attr->is_opened)) {
-		return -EINVAL;
-	}
-
-	/* Check arguments */
-	if (demod->my_ext_attr == NULL)
+	    (demod->my_common_attr->is_opened))
 		return -EINVAL;
 
 	dev_addr = demod->my_i2c_dev_addr;
-- 
2.51.0

