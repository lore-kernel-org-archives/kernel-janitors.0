Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2E54FB8
	for <kernel-janitors@vger.kernel.org>; Wed, 31 Jan 2024 07:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706686711; cv=none; b=MwUFAxLWQFhytU3W1Ec8vpnfujOgW5wprY0FbgQN4hmY4OwSCPdVP4Tfv9VB2vVRQvZKijPP0F+oDeA7V3A25mJBNtuk1+hVr4H7wMH4GwxQeUgj3vaSFo+HGIDGD+1G9/cDXfnFvSWaW6ZKQHMpEdc/RLfS/p22UWMm+jiGAxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706686711; c=relaxed/simple;
	bh=Oe/pC4I/GAA5FZkYwiTXdUmemMh2lYlbqeq33lyyZ0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnySULQd397uE+f7hQKZbvGG4CgisdIlBLfo5nPwkm19qrm3YnLeguOQ++nMKVckWqcMRadSAL45jyZTAyMoRl+nxkUE3sQVCm+QZn0OHiqO79vW78OPiKSrbLne/qzEWED8/UGKsGUo1A/0NtxXhYuwYdlxszZ2VGFWd8BvV3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tNmQkhr8; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tNmQkhr8"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b01484cd7so384932f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 30 Jan 2024 23:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706686707; x=1707291507; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0V7iosW1wVnxRFdauCwRgSPmfslIouLwnBCJOuKExVM=;
        b=tNmQkhr8pDFG6l6Rv5vgs8vs1zPHmXnHLJX3LJF33XulvjOfqrho9sFCCNKxxrgfKD
         +p5cgwfYJY60UvUNJ9QELaZ4OEC18PHRH48T+cXqzys2dCZpfkRhzJMeJQoZeyjo3gki
         rVoEdcw5QGtIUUOHMPiwQjb9ZkzCbUOaaPdFCDZ+BajMZWTiWpG1nsZ4us7Uq8DWBqSC
         a25F7dw1ljFa+U5qX4De0ZiPhcNtAIp7AGr8PCuqZDq4lkn6zQOexyYnsTV60pKOVENz
         tZTAIJ35CdlGRsRIdP7w7gzntJa0zmlzbgGv1BxkJqrl5RxH90hKk8fnZWqO4OaHm+d1
         +Pyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706686707; x=1707291507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0V7iosW1wVnxRFdauCwRgSPmfslIouLwnBCJOuKExVM=;
        b=KtEClEHfOjm4zhwcx9U7qM8dfS+dhK6tEEFMbVH3ylH4KHzZKq5wyk28mrLoDFLDi/
         j3vLbtZSeyjLaicCbnwoWdcDCnyeoxUODJ7pVlOhLg+rWAYMW0FaYUK18WFuTQw96dq9
         QRZ+ed/qYMTL0j8uh45iqTEylhDajXegOU4o5K20e7RLAJhfHdzRxwve/B620Ba3tDA/
         Jh/xHbaFYwcieQWA79Env/b5o57uwEMP5LIzK4vJG68giZHQxQ3CR4naMnNylB8xV7iK
         chujAUXXzvNaiyKj/Oq0PsrpQBEWEzXBzIOjY1VbGTzULF9YKcGO403LgjZvTsE0jB0I
         YHVA==
X-Gm-Message-State: AOJu0YwyIzriEBJf3ei6EUJR4belDiUmKOxfctghYfLyN++u45Oyvf3q
	PqIw9NJQV05fWLFDC7HtsC5+0ADjWSombBsNJHgpoYOnHBl4X8UKHVcR8mNlNQCiDmObH64ua9X
	h
X-Google-Smtp-Source: AGHT+IHoBx1Gp1C86N2HCqjGu0UcwSELukvML4nZhRy8WL+/u4pzGk92zUH17ZwMTHneTE1mEbKpFw==
X-Received: by 2002:a5d:47a2:0:b0:33a:f73b:a1b8 with SMTP id 2-20020a5d47a2000000b0033af73ba1b8mr707056wrb.48.1706686707005;
        Tue, 30 Jan 2024 23:38:27 -0800 (PST)
Received: from localhost ([102.140.226.10])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe790000000b0033afed6e9desm1892129wrm.98.2024.01.30.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 23:38:26 -0800 (PST)
Date: Wed, 31 Jan 2024 10:38:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: min.li.xe@renesas.com
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] ptp: add FemtoClock3 Wireless as ptp hardware clock
Message-ID: <a5bf71d8-5722-4830-8286-c36ce14c199f@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Min Li,

The patch 1ddfecafabf7: "ptp: add FemtoClock3 Wireless as ptp
hardware clock" from Jan 24, 2024 (linux-next), leads to the
following (unpublished) Smatch static checker warning:

	drivers/ptp/ptp_fc3.c:989 idtfc3_probe()
	warn: duplicate check 'err' (previous on line 981)

drivers/ptp/ptp_fc3.c
    947 static int idtfc3_probe(struct platform_device *pdev)
    948 {
    949         struct rsmu_ddata *ddata = dev_get_drvdata(pdev->dev.parent);
    950         struct idtfc3 *idtfc3;
    951         int err;
    952 
    953         idtfc3 = devm_kzalloc(&pdev->dev, sizeof(struct idtfc3), GFP_KERNEL);
    954 
    955         if (!idtfc3)
    956                 return -ENOMEM;
    957 
    958         idtfc3->dev = &pdev->dev;
    959         idtfc3->mfd = pdev->dev.parent;
    960         idtfc3->lock = &ddata->lock;
    961         idtfc3->regmap = ddata->regmap;
    962 
    963         mutex_lock(idtfc3->lock);
    964 
    965         err = idtfc3_check_device_compatibility(idtfc3);
    966         if (err) {
    967                 mutex_unlock(idtfc3->lock);
    968                 return err;
    969         }
    970 
    971         err = idtfc3_load_firmware(idtfc3);
    972         if (err) {
    973                 if (err == -ENOENT) {
    974                         mutex_unlock(idtfc3->lock);
    975                         return -EPROBE_DEFER;
    976                 }
    977                 dev_warn(idtfc3->dev, "loading firmware failed with %d", err);
    978         }
    979 
    980         err = idtfc3_enable_ptp(idtfc3);
    981         if (err) {
    982                 dev_err(idtfc3->dev, "idtfc3_enable_ptp failed with %d", err);
    983                 mutex_unlock(idtfc3->lock);
    984                 return err;
                        ^^^^^^^^^^^

    985         }
    986 
    987         mutex_unlock(idtfc3->lock);
    988 
--> 989         if (err) {

"err" is zero at this point.

    990                 ptp_clock_unregister(idtfc3->ptp_clock);
    991                 return err;
    992         }
    993 
    994         platform_set_drvdata(pdev, idtfc3);
    995 
    996         return 0;
    997 }

regards,
dan carpenter
