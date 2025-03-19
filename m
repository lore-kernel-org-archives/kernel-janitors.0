Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789720FAB1
	for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 07:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367955; cv=none; b=FtwxupdioDYVfxc/T2ZJdy1735zhBXBQCs7tMfWEcjGb1WRZvn0PvzaSecD1xm/kbHt/v4X/O8F/YQLtjS3w8lpUGzQvyChRJ8GnfD8X5WUK0gE3Dca0AX7liKFJXjBivj2UUDVbMcpNMoEcSdX8tcQ9U5E19aa0euB5NS4vsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367955; c=relaxed/simple;
	bh=NHmVxf51ccPygdho6qBOtOezUpa9NGhtd7AYhIOwcjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJX/AIeqq3UwowEALH44Y+nvnuwQROwBG9R3lv3NA5J9pGetxN7D0i/W777e4EM0wTxdYHXwgcx0g7v/gmN6zgb0hLTpi21mnDgM1nj+UHZ5spiRu5ynpACg0HzwFYLDbGUlVkuhlVToFQcmlAfMirEuPu0AvDknRY7kC9wtrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6JEIqll; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6JEIqll"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso43215885e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Mar 2025 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742367952; x=1742972752; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=A6JEIqllxDnqhkdDdhnqnJ+zjkzBHlqwhgKtSbeo3D7e/DO9CscKEgUYoJ3tRoSHTv
         sWnKfVNZjH9a4YsFKxSabRuwzLNUXsXb3eDEAHj5JQT1Nk7cP65B8RL5Mg4SvteG5V2c
         PouK4Q8uncax/OXIiI4LUtwty6htzmy8SJdgEjJkJ9HB3NQUZ/3DO5/5WzsmsZuwe2qM
         NIlMpL+SRMKQMAeoLIZnKdbEWh5BtGIG9oZz1RqitcNxIB4YFTvv2NFS4nMd7DIU/QO8
         MIZCF8eK+RyctZvInXcrUQxHiDrgDGSlaA3Uau6FQygnhH81HDLC8sR/1KWwbhMjjLBp
         BfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742367952; x=1742972752;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcdnlxlz3RiOr5CYldhEXdBAGdjzbvGPeO0bYglxBw=;
        b=AKExaBuV+ujjhY7mRCARQBh1nx5y7KRMcGHw3UwGMXP0nFmAWl98YUKHdI883GLZKk
         AP8Royuh3L0PQXs76MDJ38DWJkOAhnzglgk903/RSl2IWFqQx5+n4FW3jrPnt2InfiTY
         kn6hDraaL443zdaPiTMOG1Q1+ehRuly6kk3qc0Gi94JXCMYwOZTP/WGcF628IFLXTi9g
         ib43sajFZF+tv0k0ItwxEcyusXHMPAMEgBGi8R26Vz+9hYChOHLIAOk5q8OlHW7DeSLV
         ZgDTxGx6aYldJC+B0l5g3/Gw+E4ipXRvdoPpsb8lW0fv13zFiYb8xCE6gUk0a1L3FImd
         idGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcdy0MhKMGNbtvMl1gETbWx0g/kYnOX3QCz7xMTJ66nU0OH4p2kVDfQmTk5/8q7iFRLAGnBv/4nz/cRFLLFq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwllfYX2Ju+7e2P4Day7GE1odhRjSmsm66JiQaz+z76r7K0VPZH
	u2Pd5JxjzP5MJy4JpCViKl41kAiguYKHibJk+FYkYwlADvan2yrSQZHDd+Md7W0=
X-Gm-Gg: ASbGncsNym8gFEi+sQlRDss8j4hE/a1n2rIf0sn/+peEWa73uM/1qUONdYqVF/IwXjv
	PknpuHEqlLhbA2cuEp8P7Ucl3O5z+jk0MVtdMzXpcAxjC/SVc3yHOh4iqZf3yF7J7jog/4Eelj3
	fpWnHpA2uGVWFDQp6FsiXBXJTB9HtFbWWrOgbyWmkeusO3AIerXDvR6vv/7SmJOi/E4r1yqxUr9
	609g75SB1+wEczsIPlXx2HsQ+noOzcRtp3HTzXyPoeKwWSmGMOPcHnMenb8/5CvHFgY3pfyLvtt
	AFN0I7A8ym1SJVQDZEU3kyAj93SAjJdpBVgIkH8y1uGMTOgDl/gByergncml
X-Google-Smtp-Source: AGHT+IGk01nY8D5vZYwPJQciTgqBS35i2lX2QwN2d+aG31PMswpzNbfMSH2RxcqCh5zyBjomgO3hGA==
X-Received: by 2002:a05:600c:1389:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-43d43869a32mr8416005e9.31.1742367951811;
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f331dasm9816055e9.8.2025.03.19.00.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 00:05:51 -0700 (PDT)
Date: Wed, 19 Mar 2025 10:05:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Peng Fan <peng.fan@nxp.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: tegra: Fix off by one in
 tegra_pinctrl_get_group()
Message-ID: <82b40d9d-b437-42a9-9eb3-2328aa6877ac@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This should be >= pmx->soc->ngroups instead of > to avoid an out of
bounds access.  The pmx->soc->groups[] array is allocated in
tegra_pinctrl_probe().

Fixes: c12bfa0fee65 ("pinctrl-tegra: Restore SFSEL bit when freeing pins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 0246acba7703..11ecbd6a9b2a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -306,7 +306,7 @@ static const struct tegra_pingroup *tegra_pinctrl_get_group(struct pinctrl_dev *
 {
 	struct tegra_pmx *pmx = pinctrl_dev_get_drvdata(pctldev);
 
-	if (group_index < 0 || group_index > pmx->soc->ngroups)
+	if (group_index < 0 || group_index >= pmx->soc->ngroups)
 		return NULL;
 
 	return &pmx->soc->groups[group_index];
-- 
2.47.2

