Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5610EB8FAF
	for <kernel-janitors@archiver.kernel.org>; Wed,  6 Sep 2023 11:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238057AbjIFLzN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239622AbjIFLzN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 6 Sep 2023 07:55:13 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71F8CE6
        for <kernel-janitors@vger.kernel.org>; Wed,  6 Sep 2023 04:55:09 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so5408315e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Sep 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694001308; x=1694606108; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHxKnsaHJdFOeeTkkU07NHWn1kzZh2P+fBJSk79BwTo=;
        b=nvwartqNEP+NllqY0K/kH1YUYs8kfcqebcIZu2z0oRQxbmprvps0NEUVin46U7H7P1
         QW9q6olZfQkejiBotzi0Vg8D6kaI9REXp9L2+8je6T6CKuMQELJ7rg20l2ieU3iMELbQ
         vUCRWSf7RftwF2lNDsUrxlIjii+26AJdIf1IKdM378jpmchDTHE7huhRq0CRHSGkqTBx
         H+GDBDdgnkTzty0MGgovI70DJHAb+7OkHGhxNSBcWO/OUPY+UAwfqTFSCiHJz8FCaGfr
         T2wNrK9qUlyStptR5yH+mX3w7KVO++odNYcY+cNXj/XwWYCpr3zbYAAhmG1Mb8Ik0MwG
         VGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001308; x=1694606108;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHxKnsaHJdFOeeTkkU07NHWn1kzZh2P+fBJSk79BwTo=;
        b=lmTzfcdOYbQNMVJ/KMtfwMgPeLtkVK0/J99n1mzT1xHfDX09PVlaXhOS9/4vlqzJVa
         Bck1GwMgEqXz4z2cFreu9giD6OyF1+yR9vSpO5WuAmmwV/hG4dyzUX5F6UYrwTSNM6kf
         FBz9sjYG0wIO7G0X4Mbee7sh9uEb8Wos83u9gTOlJrMY6UN6/6YxBAnMh9lSW8wPLaCt
         5cBOS3BYBjJJvt7UXvubjbQeFVkl8aO6U7J9SZlfdn2H9MMXogLJgLbu04a0PQcqrGUd
         Uquo5jIHguBwss40r/4Ug2gQewCLrzkreYBPk/uNCjfECYY9GoTm2aCwFDtUGUIGu7sX
         e69Q==
X-Gm-Message-State: AOJu0YzOEoUdZjwQxIvtSs/2Exy0GuHFarKjXyd7RsHQYguJYdHEuns+
        V7gdspXFsIonLWjyVwMXZM+Qkg==
X-Google-Smtp-Source: AGHT+IHsaxywucP98ODzwH1cDi8QAwZ7S/FFEZsYD8xRDINKl7fjchPV5n4J9yM2EYkCsW5sRIUrCg==
X-Received: by 2002:adf:e786:0:b0:317:dd94:d38b with SMTP id n6-20020adfe786000000b00317dd94d38bmr2445294wrm.10.1694001308182;
        Wed, 06 Sep 2023 04:55:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c379200b003fee65091fdsm22947541wmr.40.2023.09.06.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 04:55:07 -0700 (PDT)
Date:   Wed, 6 Sep 2023 14:55:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     ecree.xilinx@gmail.com
Cc:     linux-net-drivers@amd.com, kernel-janitors@vger.kernel.org
Subject: [bug report] sfc: functions to register for conntrack zone offload
Message-ID: <ede55fab-c74d-4594-9c71-0165b9460d22@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Edward Cree,

The patch c3bb5c6acd4e: "sfc: functions to register for conntrack
zone offload" from Aug 7, 2023 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/ethernet/sfc/tc_conntrack.c:488 efx_tc_ct_register_zone()
	error: 'old' dereferencing possible ERR_PTR()

drivers/net/ethernet/sfc/tc_conntrack.c
    469 struct efx_tc_ct_zone *efx_tc_ct_register_zone(struct efx_nic *efx, u16 zone,
    470                                                struct nf_flowtable *ct_ft)
    471 {
    472         struct efx_tc_ct_zone *ct_zone, *old;
    473         int rc;
    474 
    475         ct_zone = kzalloc(sizeof(*ct_zone), GFP_USER);
    476         if (!ct_zone)
    477                 return ERR_PTR(-ENOMEM);
    478         ct_zone->zone = zone;
    479         old = rhashtable_lookup_get_insert_fast(&efx->tc->ct_zone_ht,
    480                                                 &ct_zone->linkage,
    481                                                 efx_tc_ct_zone_ht_params);
    482         if (old) {
    483                 /* don't need our new entry */
    484                 kfree(ct_zone);
    485                 if (!refcount_inc_not_zero(&old->ref))

rhashtable_lookup_get_insert_fast() can return NULL or error pointers.

    486                         return ERR_PTR(-EAGAIN);
    487                 /* existing entry found */
--> 488                 WARN_ON_ONCE(old->nf_ft != ct_ft);
    489                 netif_dbg(efx, drv, efx->net_dev,
    490                           "Found existing ct_zone for %u\n", zone);
    491                 return old;
    492         }
    493         ct_zone->nf_ft = ct_ft;
    494         ct_zone->efx = efx;
    495         INIT_LIST_HEAD(&ct_zone->cts);
    496         mutex_init(&ct_zone->mutex);
    497         rc = nf_flow_table_offload_add_cb(ct_ft, efx_tc_flow_block, ct_zone);
    498         netif_dbg(efx, drv, efx->net_dev, "Adding new ct_zone for %u, rc %d\n",
    499                   zone, rc);
    500         if (rc < 0)
    501                 goto fail;
    502         refcount_set(&ct_zone->ref, 1);
    503         return ct_zone;
    504 fail:
    505         rhashtable_remove_fast(&efx->tc->ct_zone_ht, &ct_zone->linkage,
    506                                efx_tc_ct_zone_ht_params);
    507         kfree(ct_zone);
    508         return ERR_PTR(rc);
    509 }

regards,
dan carpenter
