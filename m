Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7C932126B
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626470; cv=none; b=jQEUpP0s0Wqssj1I8W8bWU2aVTamXh3Wvoet2O8Fd3jCzcsMEtLAfncIF5zThumeLe8PObtpH4niyPGM3nf+QFAobNFglFcFoUg/wc4Is0V+VE/1Md1sPUPmqMg64BlA58cm7uUBjpnoDcugerb/l6VJQt1j5nzX+VjWwA7vo4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626470; c=relaxed/simple;
	bh=w/XZDoPBK/WJVL84VUcz2NTNsXiZHgQcwFyJj+vwmJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d3BP8xmXdsplyk5b/KL/HTzkPi+XgY3wg0Ht19SyKvSOcyOWSVAgLmxrYG0rZli31kZhgG6gCSvuRXry79++sqsLQ98YVD3wnDfAHo0WDOLkEIVbHPAm7ym4YG+Dx5Pr4CjUpjW2UMW/dAdNeHIzz/gBljue8yT/KK2UKWvLDgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oBUb3EWD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oBUb3EWD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso37187775e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626467; x=1759231267; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAteOi/paOFIQc5xvzYk2U4H8LEUr7AKXD9kXKLmCWI=;
        b=oBUb3EWDC/Xa9onmEa4Q0hqw/xaB77SoIVHS/AHD/t6/ABOXDQRXx66m6iFlMKyOrx
         o/STE/a+ohzetbnJNl947azbWxQP0sAWXuU77LLuRbwFPX55M15f1gzXXcimWjYg7H7T
         86LPN/yQnUqYRu93WtdM/BDb9xW8uEZsGeo1dlM0mwnKGBOu2sGbLE5Se7IhveCAM5uO
         wLoYWPJjQofwXZVFjbqm7nssjGWwb7GVTfrWknObeorokajdwevufakyeuNms3Hvp24g
         J8Ar6z4FvADaZhJR8CmqXOoSuBfuUHj5J1pq9GCBtzRNHxbBOissHoAilFMrS03Zc9VO
         Junw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626467; x=1759231267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mAteOi/paOFIQc5xvzYk2U4H8LEUr7AKXD9kXKLmCWI=;
        b=GLOZkJuEw7FBnEbLD82zXwxCVqd7fW0dYvFdfAxw4P9y2gTvzL0Rf+H/b5hoPlAN5p
         OIDAPII2bzDDfKJqsmh2kYbr0t+TGBjQXbyxUva68EN9s7YPSN3mvbTCzu19b+Hbf0S5
         E+7/qQu1P/iVZ7L/6aOZxS4BqG7ZP1xR28X/60+aQa0Wxh0bsOYNrmCKQJoolLezsqfS
         ELK96Muw3KTvaePnh8PVaiLjTJRrfps2vBQVnCiH3gLQKvN8PP1hqNBhLgmGeONUxXKv
         0l29b2yMJ+Br6YyHe+UWJc1Yl9TeR43NRZ3TtlMLMG2xxIBT3o35pQc1O2qJ1QhoOSdJ
         3aJw==
X-Gm-Message-State: AOJu0YxX0IEkG4m0fAYxyOHxEvvCKn769nUc9X3APXgny95+NjnZ2WGd
	i+6j6URwOpol9hwoIxEIfwnfqsvECu8cdiFNANZWPfBmS6/y1LiPBfZk2XGyj71vYVVJ1W0wcEH
	qrq1J
X-Gm-Gg: ASbGncuU8j/zHNtuNZSItiyCxQk+5tI9uFfr9O4zwwbfe5hNEXr7rSQ9BOOMq0NdKb+
	PxgAYnQdJ91wkrnKiaMRn5cx+GgTtlvwkinneZclwxUL+J6FKsMokLQMDYNoYvWPy7oD9Ju2Nqd
	YcwNPZnqXEwKrxUC/mJAThkElZfmLBdm7KFVOapi+BGHFkQbsD+gj9dohHsSm/GwACjd2o/Kw6N
	GFFsn44TJgz5Utp9M0m20zoge018NiCgWeCBxjJKAbnCKIRTDoLcrxUHCzp5U+zBinSmlhxXw+S
	gfJApHp2AwtDbKBiCcR5Nwr6ysJc+ipBMcEARY42sdkupxmTx4DfUOVhQCjdbTTs2Tujsu8Mvvu
	8kdhonIusHdLz69bOpWHrUsJ6cWqE
X-Google-Smtp-Source: AGHT+IFAV6FQ8Ec7WJCLOFuqPKoPf6jZjuoVsKsiedM28XmPGyPGZAXaa2DVPPXseTg5MzHwVkFeBw==
X-Received: by 2002:a05:600c:3b26:b0:46e:1e31:8d1d with SMTP id 5b1f17b1804b1-46e1e318de7mr24000935e9.17.1758626466733;
        Tue, 23 Sep 2025 04:21:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e23adce1bsm11252245e9.24.2025.09.23.04.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:21:06 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:21:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: pse-pd: Avoid setting max_uA in regulator
 constraints
Message-ID: <aNKCn90htSbZHVsn@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kory Maincent,

Commit 675d0e3cacc3 ("net: pse-pd: Avoid setting max_uA in regulator
constraints") from Jan 10, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/pse-pd/pse_core.c:810 pse_pi_set_current_limit()
	warn: AAA no lower bound on 'max_uA' rl='s32min-(-1),1-1920000'

drivers/net/pse-pd/pse_core.c
    783 static int pse_pi_set_current_limit(struct regulator_dev *rdev, int min_uA,
    784                                     int max_uA)
    785 {
    786         struct pse_controller_dev *pcdev = rdev_get_drvdata(rdev);
    787         const struct pse_controller_ops *ops;
    788         int id, mW, ret;
    789         s64 tmp_64;
    790 
    791         ops = pcdev->ops;
    792         if (!ops->pi_set_pw_limit || !ops->pi_get_voltage)
    793                 return -EOPNOTSUPP;
    794 
    795         if (max_uA > MAX_PI_CURRENT)

Do we need this?  Shouldn't it be checked in regulator_check_current_limit()
instead?  max_uA is an int.  Do we need to check for negatives?

    796                 return -ERANGE;
    797 
    798         id = rdev_get_id(rdev);
    799         mutex_lock(&pcdev->lock);
    800         ret = _pse_pi_get_voltage(rdev);
    801         if (!ret) {
    802                 dev_err(pcdev->dev, "Voltage null\n");
    803                 ret = -ERANGE;
    804                 goto out;
    805         }
    806         if (ret < 0)
    807                 goto out;
    808 
    809         tmp_64 = ret;
--> 810         tmp_64 *= max_uA;
    811         /* mW = uA * uV / 1000000000 */
    812         mW = DIV_ROUND_CLOSEST_ULL(tmp_64, 1000000000);
    813         ret = ops->pi_set_pw_limit(pcdev, id, mW);
    814 out:
    815         mutex_unlock(&pcdev->lock);
    816 
    817         return ret;
    818 }

regards,
dan carpenter
