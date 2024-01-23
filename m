Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5372759B77
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 09:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706003752; cv=none; b=nXa1eYFSLagH8sPEWV4WlkoFp+7B9vrTEzhnSl3KzX8oKDtUbPt89guI9uAfQSJcL/wqKxGMzv/uWf+gth5HjSmIUVHg5JKAyj79mcTlxdpRgJelHjVHqKn4MQo2+sAOLkwJtnw8TqmNXvrrn9D7ZcqIxwQ/L+WPq1ErfYf+64Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706003752; c=relaxed/simple;
	bh=/r74GFz4NCn8ORI/7yeeQiiaGc1lvfRg8wAXKawzYW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBB3wT7P7VfH05FSO4vxijt5AO+JFpuP7fPkOnVVnD/RM9Mi+Q99SUCLb6s30XXDQooYHF6q2mz8e4ReGgNr4QiYAyeCpUD3JnSchOCIF2E6/nng/QIt5IZUUu62LHAW7ansKjBX57T/P6a8wEgLL0D1iGLlf6wQWg9a+5tVQpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OagKnhW3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OagKnhW3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so17428035e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Jan 2024 01:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706003749; x=1706608549; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MrKb28kSD74KPrxA+pJ36LK4A+l6+QTAduHZ07kAgY=;
        b=OagKnhW3GGr/ut0C0uh0y9jgAZh0PHBzWGoC69lS/jCA+Kst1sabPlJSli5pgMXdHW
         Z9SesJ5TC6FWdlEKw4rOcRqCctPVLIHFIYMTkdZzv803JuKmLntHTrWI3T9030IZMpqi
         IMDGc0E+UaMdmb7aWyGtDpJSU97wdrH5Pu/6Bdc9VGgFJ12X0K37WrIcvIKciDtYaypP
         4teuTIe4s/i2/sAHGyiosFWcogjGo/8XLFJnYtuX7Zu41eA3Tv5XFgNPEvuMrjEvijwS
         tKEo8jVr86dU28sYp097FDuRqN46+7ypHX4THE85M8DTao5EYGI8X0BZabjHXVciFjRr
         EhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706003749; x=1706608549;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MrKb28kSD74KPrxA+pJ36LK4A+l6+QTAduHZ07kAgY=;
        b=OhGj+6oT/iPQEIKYzksw/5ACCKiqatolNDmTBCaN+RJWlTAqaoNFA3f/dQWivjjboh
         +XjfKr/1HdqXKVW/mHOeak/rhDll2uOa59CnnGJXuqNl9R0U26gC3IXr3NKfgmEg/8CP
         ES8LLqtsTR5wlAWp1i4Qmlom/AyUmRo4yBLN3AibT74DNxUgruuvyZjxdIYignUHZMxM
         vg20A2bGfJiML8um1n6xEqurJSDd9r+scSzk2bjJZHy38spu26Uq00OsUV98O2rbjo/a
         H6Vg3/EFXrZW8uLGN9176L2mKrQinT55HElh86g1I+evge6wbjke3THA/4yG+/DHB+Ro
         Jk6w==
X-Gm-Message-State: AOJu0Yxq/kYLNogpH+CKktDl6wH0aoWJccwPzTH7GJA01dPA5BJi0GUl
	fqMm8nLpP5GWqBpVVE1vjQ/X0m8XI+gMWANKWvvnNin9qbgvi4mwl8eTmRtmX28=
X-Google-Smtp-Source: AGHT+IGqSgiPAKLruazT0v1ff664BwAxhwEo/Y9jRmN6XuyhJL2C+qSeB8nqtlNm+wI1EgrED57eTQ==
X-Received: by 2002:a05:600c:428a:b0:40e:555e:ebff with SMTP id v10-20020a05600c428a00b0040e555eebffmr446386wmc.150.1706003749656;
        Tue, 23 Jan 2024 01:55:49 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm42398155wmo.2.2024.01.23.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 01:55:49 -0800 (PST)
Date: Tue, 23 Jan 2024 12:55:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas.Lendacky@amd.com
Cc: kernel-janitors@vger.kernel.org, Raju Rangoju <Raju.Rangoju@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [bug report] amd-xgbe: Initial AMD 10GbE platform driver
Message-ID: <6ba0dcad-8c35-418f-a892-a8555d57e58a@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lendacky, Thomas,

The patch c5aa9e3b8156: "amd-xgbe: Initial AMD 10GbE platform driver"
from Jun 5, 2014 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/ethernet/amd/xgbe/xgbe-drv.c:1209 xgbe_powerdown()
	warn: sleeping in atomic context

drivers/net/ethernet/amd/xgbe/xgbe-drv.c
    1181 int xgbe_powerdown(struct net_device *netdev, unsigned int caller)
    1182 {
    1183         struct xgbe_prv_data *pdata = netdev_priv(netdev);
    1184         struct xgbe_hw_if *hw_if = &pdata->hw_if;
    1185         unsigned long flags;
    1186 
    1187         DBGPR("-->xgbe_powerdown\n");
    1188 
    1189         if (!netif_running(netdev) ||
    1190             (caller == XGMAC_IOCTL_CONTEXT && pdata->power_down)) {
    1191                 netdev_alert(netdev, "Device is already powered down\n");
    1192                 DBGPR("<--xgbe_powerdown\n");
    1193                 return -EINVAL;
    1194         }
    1195 
    1196         spin_lock_irqsave(&pdata->lock, flags);
                 ^^^^^^^^^^^^^^^^^
Preempt disabled.

    1197 
    1198         if (caller == XGMAC_DRIVER_CONTEXT)
    1199                 netif_device_detach(netdev);
    1200 
    1201         netif_tx_stop_all_queues(netdev);
    1202 
    1203         xgbe_stop_timers(pdata);
    1204         flush_workqueue(pdata->dev_workqueue);
    1205 
    1206         hw_if->powerdown_tx(pdata);
    1207         hw_if->powerdown_rx(pdata);
    1208 
--> 1209         xgbe_napi_disable(pdata, 0);

This warning is correct, but it only showed up because I messed up my
devel version of Smatch last night to make it assume that we almost
always enter into loops at least one time.

The napi_disable() function cannot be called while holding a spinlock.

You would need to enable DEBUG_ATOMIC_SLEEP to see these warnings at
runtime.

    1210 
    1211         pdata->power_down = 1;
    1212 
    1213         spin_unlock_irqrestore(&pdata->lock, flags);
    1214 
    1215         DBGPR("<--xgbe_powerdown\n");
    1216 
    1217         return 0;
    1218 }

regards,
dan carpenter
