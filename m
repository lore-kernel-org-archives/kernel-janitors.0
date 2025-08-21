Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA71388
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779583; cv=none; b=N7+XZQ2ZcA9cmwxCXS43vR/FTmgvL+iJ1Ophgn4lkNqivRG9g7q1Am1h2k0nAjCKJSZ1BNQTYUF0Ix/2MM6uDzs6hPtuKCgaPtw7PfwMW5u+ggTeFlueEJdTZ+iGJHgqzwvZLJXU6KNvhFgnYD1Gi5tkrn8+JlYFLkiENVMrEAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779583; c=relaxed/simple;
	bh=NP2Nml6v1e0gigvUeR7R7L4PnqsRBteMPmJz1jaKJxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btn9uOPsBALjkxJX6fheKDCYTNN+GLmixUOsHONjFHBhE6CCRyy8EaZz55+bpzW7GdciJKsg6htHKJ5kDNkHesY9g98rZ5Qu8TEXrLZ8Cv51NWIV9yhL4sOfDZqZ84D8W3Pe9p5QHDWpPCfLvNefQUaqpivKZOrrfuckwJ3RaNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q8eKkbRs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q8eKkbRs"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso5432855e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779580; x=1756384380; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2aRrxebLiwXVgiP0MlFCSVZWWZ5gMXVWnBBmRw7pvQ=;
        b=q8eKkbRsmsEoCgyJ65XVp5n2j8n7oCGqsxemj3e8f/noPQkXYnqEBsF2Sfn6ECoN+7
         2kEsljmBBe3lqkMcu+KcBt0cc2sL8/W0YwQiGk+q8/FoOXxbzGN2gpHXMpxqjNlR/t0c
         X2N0p5wJzcZDOWmEYttc034AH+UGnHa0NkKXoS5YRVgVTDg0dP+9gpNkb6BK7tn5CZcB
         6sRSTKz3uOA2DmohjffsatQr14BpOi/gdVquXdXsHAX1hZBhDYdRVmbBcwZvljKI8tV1
         Qs6NEB1iEce8ziqiDwe+LlT8wO4TjWx4Qq6aM9R1MENCVBi59ZfvsiwcCw77PM8GlrAZ
         D8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779580; x=1756384380;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2aRrxebLiwXVgiP0MlFCSVZWWZ5gMXVWnBBmRw7pvQ=;
        b=siTgYXEgf+cG0Q/p8oCRMwGMuDrrGmaE/8xxTZZkEdTqKA0zv8U7VpDCT1MT+lrQqC
         glQ6C01j8T2plP1t2PeExC81eboXj9Z4zaCmHC7pwsx0r7o3Tmnp1OKhYsFiyts4L4R6
         RnnquYqdf98Y9bw/0tLwOOnhDR/u4YydfLuaTlSQIgYL0jQ1mvqaXhaCGbBN5efYEMqP
         gR87s3dG1X0NjWS/ChNCH6ecPbKJXv25VQ5qqh0L3XbcVxwQsbMegaoD4wIAFOGhphBj
         ecLuYB0vNeTXu6+L2s76I9y5sEflto3Euo2PLieItMnro/EKRlu6iKAhTLDAP/Eh0mvD
         Z1aw==
X-Gm-Message-State: AOJu0Yyu3uwzcL36IVI/vkHtRIJ33yhgOZoCQj0gkw/puBE5LKhRciLB
	tHd7x3PFkucOzp+DKaqiL2SAuiRBwHZD743YWuJ7NMB/d+kC+8zfZcepoHOWanPHhEA=
X-Gm-Gg: ASbGncsTsPZmFzdISfMBOok2HW04rjhCNcltmXv7pyNX6W/gz88e6kxFlJJTIAkKywV
	lLL4Xt6zYCHHZ8qozHn5edneCNi/eglIecDm67csu4C9Gdxp1QXtLT8NdeyGVkwZYpYdlHXAUwB
	ejy/GMInkw4cSzpuQG42ZoP+WyOntepcZJMk2fqm1fRSUKyNemHgCbcfRe4EPnNxHLEe2u+qAzf
	2i4rrnWBncbccELk3sKdeRAXwjWV8LMYkxWTAofs0QYGak4xalgAOIEXl0HawsBq7vAGSOMiO39
	5yg60wJ1naP4HHLxT5z9GXqYk4tgItPyXA1oZGluEme+aUcpDy0MX0+UiD1+1C3CtvRAimGK8KK
	ZUNe69Eb7vuTxh1gV7/3pMH7wQC4=
X-Google-Smtp-Source: AGHT+IHKsGPc9c2FzsHittVTgmYdBhLuPUKgDJpaCKV1seKoZy+olZCCifVPzUZtDMtMgRubMU13xw==
X-Received: by 2002:a05:600c:4591:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-45b4d7fb8e3mr26903055e9.16.1755779580164;
        Thu, 21 Aug 2025 05:33:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db2ab4asm26884805e9.8.2025.08.21.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:32:59 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:32:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vineeth Karumanchi <vineeth.karumanchi@amd.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] net: macb: Add TAPRIO traffic scheduling support
Message-ID: <aKcR-LiAmoAv7Bzj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Vineeth Karumanchi,

Commit 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling
support") from Aug 14, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/ethernet/cadence/macb_main.c:4107 macb_taprio_setup_replace()
	warn: unsigned 'start_time' is never less than zero.

drivers/net/ethernet/cadence/macb_main.c
    4088 static int macb_taprio_setup_replace(struct net_device *ndev,
    4089                                      struct tc_taprio_qopt_offload *conf)
    4090 {
    4091         u64 total_on_time = 0, start_time_sec = 0, start_time = conf->base_time;
                 ^^^                                        ^^^^^^^^^^
start_time is unsigned

    4092         u32 configured_queues = 0, speed = 0, start_time_nsec;
    4093         struct macb_queue_enst_config *enst_queue;
    4094         struct tc_taprio_sched_entry *entry;
    4095         struct macb *bp = netdev_priv(ndev);
    4096         struct ethtool_link_ksettings kset;
    4097         struct macb_queue *queue;
    4098         size_t i;
    4099         int err;
    4100 
    4101         if (conf->num_entries > bp->num_queues) {
    4102                 netdev_err(ndev, "Too many TAPRIO entries: %zu > %d queues\n",
    4103                            conf->num_entries, bp->num_queues);
    4104                 return -EINVAL;
    4105         }
    4106 
--> 4107         if (start_time < 0) {
                     ^^^^^^^^^^^^^^
Delete this impossible check?

    4108                 netdev_err(ndev, "Invalid base_time: must be 0 or positive, got %lld\n",
    4109                            conf->base_time);
    4110                 return -ERANGE;
    4111         }
    4112 
    4113         /* Get the current link speed */

regards,
dan carpenter
