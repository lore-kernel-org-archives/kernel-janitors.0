Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB619E83C
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779578; cv=none; b=t4Sv51fByhTmMDBsarcj7oKzIBW8MKAr94NCO1dgwP9MAHUYrGACXm4Rn6GAA7yGlucj4JR/Cw6NiG735AL1xyFNbz2f2dpNj1dqunRFyLKWRtfD9zbEqSzv1e/2nwR60G3jVbMaZoP/bDA45fz4TA/6MGK7Hz7hyTY8XFKKjHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779578; c=relaxed/simple;
	bh=ocQ3d5j9vIq4dGBBuOr8WswQdXME9A/E4gyt+hUQqp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Edf/q1YlNBVG8p7mAZJcFrUkNWXVbAq8zYClw5VH1sUtV7qst6TdmdWILUlQDQYXwmIoHfkVEnprB+Dk0sApgbRft1sln2D37cEPNNGJGDGYYuf2LAmM6rZ+KFZTKQhtMUM622arVxlnDV7VvC2G84o2AWDf7NbNunBV09DgEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LlJCwPyH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LlJCwPyH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3bea24519c0so991982f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779574; x=1756384374; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MdIRAKr2cN8G91t8BLxjz7Gzji0/85KCNwhJJjiYkCg=;
        b=LlJCwPyH7wQd7hGdjBPPo9QpbeOqt6GOUinJqkXNvJrdyvYw+tzGITSaJy+a2cURXP
         OuXCCFUh9SXzjyjv3ky9IY/HFZlVj2tPyWQ4uuFZgCry/Al31k8WTAY/lAUPJO9W1Kvo
         tX/pgcycrK0qmi9bgAbjSwsWTMHZLF1VKuOA7NYh3GvzmPGe3yYhlLG7rKWdOdrkapLW
         aJaokVdsat/5G25fiZyfZHBPPBF5FL18tb7UGokIzj8hTbYQCD8cVlOR9cwkI4HBqV5U
         pqBn81D7s2PeU0W2GNBw9HC+YbQ+vZJza9IT5bq53I7FHeLSJa7+UghKqAC2lmZs2kqv
         EhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779574; x=1756384374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MdIRAKr2cN8G91t8BLxjz7Gzji0/85KCNwhJJjiYkCg=;
        b=uyEQHl+nCf4W2ehtJ5gNBO715T23jflnWrMqfp1FoKzE+oDBKYvbv2MJlI44/vqBG1
         HIgm+UPUaLrHXNq+9uzcuDBnRBiO29vbb8e5iQvWLx5Gga+ieKKfEguIFroJEoA7UMWU
         P8UyDQ0u3Ank/9j0VkNZAm5IY8y/v8qlqsJiVcsfpuWo702zTJj569ZeP3r8MdJ2iYc0
         X9kxVzeauL45uWi+o31W2ABbq8d3BIDxR2KnemLzAtU7ptCDg/g38hTM5FXmqIIWYqD7
         7c+Udxmtp3HlDPT74dVLekbn5l9+CACbsnmau5ufpWuMKvDs+CZCbKfu5LBVHD/giTlc
         Egaw==
X-Forwarded-Encrypted: i=1; AJvYcCUgSRsYXzXPlJwxFnkDLJZknHGhfPcvUpum6u4wm7RxbkWtNz9tS/O0F/il5/VEpkIQdaF6zb7n5ju6CF/5RW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygXA2KPeESuk3zy4fro2Nmj7PDqfkFNu9tTOpTlmham7k+xeN0
	iLQGCW1PbQlzXLEj5NERfyyqstEwQaEhKgn/I6yGpb5cz9cIIbLuksp4uCeqQKNP7D8=
X-Gm-Gg: ASbGncu3FqGlSIJdj7NuKp1z2UqRCnGMnp6rKWEZ1zyDS4r+hyIIUzzTNeACJqZsyzS
	+EQtR9xWVRQk7RSlcDDhMyvzrdfnzSTTzFRhRqsSZQBX6S+sGxrziU2IaUBxpIyhNoAtKnFE29G
	OO82L06IeMyUJVdzuc3pE/Oowri1+NcFCTiszARMegpJtl/GY4hQdiGyHDvg9QphWeqKCjfELFH
	+86fDcDs70ouL3Rn6oBrR3MiJ3nuzQQr4zJl7Am+mXsfh0C8OvQfeluklvHOGovVG7TPVG8QowF
	GjcEFGeoB1xAl+mY9O+q6+Gf+G+x4uBQJ98IymWfIUQ7XVGDYrdM24IdsQwIEi5g95BOzBRUH7Z
	wPQ22V46rdYfFFr/2RDZvD231SUEk2I97tbjpUg==
X-Google-Smtp-Source: AGHT+IGLOFZokM+L1YFBETmJ+c1HGUrKFAr5zBcd3i6pzbkvpmwIxEYCoRLXatleLwvbvzJVH4ODSg==
X-Received: by 2002:adf:9b97:0:b0:3b7:94ad:ef50 with SMTP id ffacd0b85a97d-3c4b4256c02mr1669280f8f.2.1755779573600;
        Thu, 21 Aug 2025 05:32:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c077788df7sm11530384f8f.48.2025.08.21.05.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:32:53 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:32:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricky Wu <ricky_wu@realtek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Avri Altman <avri.altman@sandisk.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mmc: rtsx_usb_sdmmc: Fix uninitialized variable issue
Message-ID: <aKcR8QD81TjVqIhl@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If rtsx_usb_get_card_status() fails then "val" isn't initialized.
Move the use of "val" until after the error checking.

Fixes: d2e6fb2c31a0 ("misc: rtsx: usb card reader: add OCP support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index e1ed39c657c3..70bd21084b97 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -785,13 +785,13 @@ static int sdmmc_get_cd(struct mmc_host *mmc)
 
 	mutex_unlock(&ucr->dev_mutex);
 
-	/* get OCP status */
-	host->ocp_stat = (val >> 4) & 0x03;
-
 	/* Treat failed detection as non-exist */
 	if (err)
 		goto no_card;
 
+	/* get OCP status */
+	host->ocp_stat = (val >> 4) & 0x03;
+
 	if (val & SD_CD) {
 		host->card_exist = true;
 		return 1;
-- 
2.47.2

