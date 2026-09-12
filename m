Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F552BDC0E
	for <kernel-janitors@vger.kernel.org>; Sat, 12 Sep 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197710; cv=none; b=U25hK9ucM8NsS9DBzweWf+QEo5oYHyXG8T/v9SmcjrXkT05M9FjpBdsKLkgGh3ms8xH+VINIqIHlKGvf6YC8i9YXo6HxiAtRnRAm6pRLQJAXWH1jyEqT+X9CKSWvUbZn4QLTsfSpIRnoEY3N3DPICa72FNEFVfkkwvso+i/XD3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197710; c=relaxed/simple;
	bh=jW6DHewTV5Iuz02zyTooBDmtkJN0q02fQNJ9kMUp56U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjDnNZzJtxjFB76NStubAAMjCFO7goi0MPNsd4Zw97hK4MpVFfUhZxuG8v3dTlgSkBqEx2KLwiNZNylr9FGBjhnb4n5GBG+9aI4pvOenDWrovMcKM04pTexia94LEswMaNZvhCE++KXJD7Pq4IU6ucNhteEemda6VpbXOi83nME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYdCtGPz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYdCtGPz"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e6b280cadso7229155e9.1
        for <kernel-janitors@vger.kernel.org>; Sat, 12 Sep 2026 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197708; x=1789802508; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vQoExyqpI1OF/5KNZtaEOZhfxUGnySYAtcYjoRnUz0o=;
        b=ZYdCtGPzcnJSI91Z93tbVXZaX/0I820KyhUn8fVIQVPzE6dB5ybpm7qEFkqTF80EyH
         8jgN8Nxm6BN4stAlim/ykr2j05tBLKQ/txLkf6S5HlUE9KV2q2MoUuXWRjphooxXX3mS
         ah9BaEQLCGymwQavmv1FN77hSz4p1u884rPGtfv8EGz9k+3fp809sX3ghnAjMFNGrIc6
         ih7GgXHVTwzt5zP5BDmlA1cqDrzMx+Cv92vosMGsvdvrH5MmzFoA5KVhAwzUW1s6j7W/
         /Xjwhi+/m9MOQbQ6DIAmCv0UQzeBuqQl2/WgMcvaa7oZLT1DGWW0wa/Guub2H1N08p6D
         kppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197708; x=1789802508;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQoExyqpI1OF/5KNZtaEOZhfxUGnySYAtcYjoRnUz0o=;
        b=fQcJ0gVO8fyJ9VtBwnYnK0xzvUaxe92F6BljcOU6Pnj1bonb4flxmLdPMitaGoa8gm
         8mhyWcJgkBXuDQ2QQ4KCAl5J9F/gAs8yhedgF8hGL9ZJtEHCRQQYNaGUtzhi7OHSD3cR
         oOenI4Ps7rn0CzvzfY+RVBIXzhOPN/otlWKqnh6HXvHjyxgaqrIbDO0jEgl8TQFOghjl
         nXMvNFXg2q0t2WhIaSnEMSc7E5BzRjC4EKlAMeSVSfUm7Q4SeK09v4SmFPLREpMMVrfa
         02sfpEk7XxcuphHFiMxfOeXLY+oi3+Wd335uWPZr/lLyQG9DiAfG2U4LUoSCfdSfXI7Z
         TgwQ==
X-Forwarded-Encrypted: i=1; AKwUvByaxWQ4ZbszMKHrxyHQ5sbIEqAC7Vu5/HLNFTaYrtCkB6oxIeTeLuGRzz+uTG/IjiVdlI8D1kOuhtOZInFE+Go=@vger.kernel.org
X-Gm-Message-State: AFuF++kFVllppzkID7ZTAd0ordZbFfZh7aYjfYjA7xNqIB/bykbEHo5u
	Zb+AbeQ6y70aG204Bh1d0ANfizsY59vALwoiUUvbydF8XJ7WOxBytXdK
X-Gm-Gg: AYBFou12g5Fbb7GGbnnfFVi3cVZbF3lgFi/RwL/4bHhdI9HR28BHp83813PDq5hNjJC
	4G7yeTEBKoX5y9b6DZwD+1jNmxs6C7pwW8+hcEByHq0n+UagpVrOXpK+arHQekXSLwEbEJDVuyP
	8AsnSmPb8Ngl888wZAlOqxZOzszwU6yI3p+We5S/wARGzarCxTbg2jKEWInRBjwA46t/0LqnqaX
	CdEHQ9Uzmthkullt/TQ3AFOUZF33nIWkiBZLpRdPL8iatDy+kMXz4NkO1p0e9T1iuk6CefM/LmD
	6Zd1ALfnepI2sT38H64x8dYVoWIcV2/iAf+7vHHVI9XEz4sz7YTWNtRyBUk5dLgj6hXIHQvDs8R
	7DvNFUwzuFIFo1KoWWTA4hKXAeXIbQnuMvkRa2wOeeAHVWs47kVxzvUrU1AjwzHQFg6BwedaHCL
	NM46yjVCJ+rAtfk90/Gext31IcC0gSeAnKK43Bgg2h96LjObQXcaQ3BdZuHl3FXAKldvw=
X-Received: by 2002:a05:600c:1385:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49e619e86c6mr74779865e9.33.1789197707260;
        Sat, 12 Sep 2026 00:21:47 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm11844392f8f.12.2026.09.12.00.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:21:46 -0700 (PDT)
Date: Sat, 12 Sep 2026 10:21:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yevhen Orlov <yevhen.orlov@plvision.eu>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [bug report] net: marvell: prestera: Add router nexthops ABI
Message-ID: <aqT9h61WBcslE0gJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I don't know if anyone still is maintaining this driver.  Let me add
this as a KTODO in case someone wants to address it later.

KTODO: fix potential use after free in prestera_router_init()

Hello Yevhen Orlov,

Commit 0a23ae237171 ("net: marvell: prestera: Add router nexthops
ABI") from Oct 1, 2022 (linux-next), leads to the following Smatch
static checker warning:

	drivers/net/ethernet/marvell/prestera/prestera_router.c:1623 prestera_router_init()
	error: dereferencing freed memory 'sw->router->nexthop_group_ht.tbl' (line 1560)

drivers/net/ethernet/marvell/prestera/prestera_router.c
    1548 int prestera_router_init(struct prestera_switch *sw)
    1549 {
    1550         struct prestera_router *router;
    1551         int err, nhgrp_cache_bytes;
    1552 
    1553         router = kzalloc_obj(*sw->router);
    1554         if (!router)
    1555                 return -ENOMEM;
    1556 
    1557         sw->router = router;
    1558         router->sw = sw;
    1559 
    1560         err = prestera_router_hw_init(sw);
    1561         if (err)
    1562                 goto err_router_lib_init;

prestera_router_hw_init() calls rhashtable_destroy() on error but then
still returns success.

    1563 
    1564         err = rhashtable_init(&router->kern_fib_cache_ht,
    1565                               &__prestera_kern_fib_cache_ht_params);
    1566         if (err)
    1567                 goto err_kern_fib_cache_ht_init;
    1568 
    1569         err = rhashtable_init(&router->kern_neigh_cache_ht,
    1570                               &__prestera_kern_neigh_cache_ht_params);
    1571         if (err)
    1572                 goto err_kern_neigh_cache_ht_init;
    1573 
    1574         nhgrp_cache_bytes = sw->size_tbl_router_nexthop / 8 + 1;
    1575         router->nhgrp_hw_state_cache = kzalloc(nhgrp_cache_bytes, GFP_KERNEL);
    1576         if (!router->nhgrp_hw_state_cache) {
    1577                 err = -ENOMEM;
    1578                 goto err_nh_state_cache_alloc;
    1579         }
    1580 
    1581         err = prestera_neigh_work_init(sw);
    1582         if (err)
    1583                 goto err_neigh_work_init;
    1584 
    1585         router->inetaddr_valid_nb.notifier_call = __prestera_inetaddr_valid_cb;
    1586         err = register_inetaddr_validator_notifier(&router->inetaddr_valid_nb);
    1587         if (err)
    1588                 goto err_register_inetaddr_validator_notifier;
    1589 
    1590         router->inetaddr_nb.notifier_call = __prestera_inetaddr_cb;
    1591         err = register_inetaddr_notifier(&router->inetaddr_nb);
    1592         if (err)
    1593                 goto err_register_inetaddr_notifier;
    1594 
    1595         router->netevent_nb.notifier_call = prestera_router_netevent_event;
    1596         err = register_netevent_notifier(&router->netevent_nb);
    1597         if (err)
    1598                 goto err_register_netevent_notifier;
    1599 
    1600         router->fib_nb.notifier_call = __prestera_router_fib_event;
    1601         err = register_fib_notifier(&init_net, &router->fib_nb,
    1602                                     /* TODO: flush fib entries */ NULL, NULL);
    1603         if (err)
    1604                 goto err_register_fib_notifier;
    1605 
    1606         return 0;
    1607 
    1608 err_register_fib_notifier:
    1609         unregister_netevent_notifier(&router->netevent_nb);
    1610 err_register_netevent_notifier:
    1611         unregister_inetaddr_notifier(&router->inetaddr_nb);
    1612 err_register_inetaddr_notifier:
    1613         unregister_inetaddr_validator_notifier(&router->inetaddr_valid_nb);
    1614 err_register_inetaddr_validator_notifier:
    1615         prestera_neigh_work_fini(sw);
    1616 err_neigh_work_init:
    1617         kfree(router->nhgrp_hw_state_cache);
    1618 err_nh_state_cache_alloc:
    1619         rhashtable_destroy(&router->kern_neigh_cache_ht);
    1620 err_kern_neigh_cache_ht_init:
    1621         rhashtable_destroy(&router->kern_fib_cache_ht);
    1622 err_kern_fib_cache_ht_init:
--> 1623         prestera_router_hw_fini(sw);
    1624 err_router_lib_init:
    1625         kfree(sw->router);
    1626         return err;
    1627 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
