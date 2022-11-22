Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4488FC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Nov 2022 08:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbiKVID6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Nov 2022 03:03:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232638AbiKVID4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Nov 2022 03:03:56 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577EA21E12
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 00:03:54 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id n3so6896998wrp.5
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Nov 2022 00:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kGi+yAsvJ2Bt3D68oe/oFub1RRmdfnsNP3WdwJexxgk=;
        b=OMGBNR+53FHnRxCjsa92FggLXTaYrdP1DxAo1pnqtURhP6vxAhHTWOUNPkRRTDnjnF
         n5EUzOnzhWE3dI4lgVYNJRL570O1qEhNpO9eDlHhn9i5SXPy1BBE5IauNoKh7R+8q1X7
         +0yiSZ4biOROSUIhR/yFyqBJ3wH1DCY0GHz7DCy0qD+oRC4jbx5LPEORiejiC94lFCod
         pg8vFPZ0Z5CThSQ4DScklnQ2iYIjZiNhHvX0Y39ik60BkDcWnv+0ZLTQh6TOZGbuBc4r
         DMNMB8xM0wLPtHRfm2Xb4FOvM95vxkolHw9dqh1tnArzydBv1eAaZRnmnjSo2/QPC3cD
         KUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kGi+yAsvJ2Bt3D68oe/oFub1RRmdfnsNP3WdwJexxgk=;
        b=2frvJ7Q7Fvxls0ihDA8BEVDuFFES6RuQITWA8dUsTMY8EMU/MvvlVVJv6s8QTGYgcu
         4+S/KrsvbAis1IpD+5DGb8UzDE/6pp3VJ9HP7jwG/owxrgNQ1IT9aylBZuzb+21SyaLe
         atgWsvv7bKackScANydz5j8ZPtegnX/8kCKXDCOLisrC3eUghHOJ3oub9XLouCLJLmVe
         6GSXeARNKfqAiulJVyTKJo98QTvujFO00d0GgxTcW/Yxj1fY1SZwMh5oTJDFKjaXml4S
         fqO3Ft4HHbKC+onzxPwbm+vummNJip2YgrZO/7xqOgpoNSW2PqmFSKV/v4+Tso4sNc/N
         wDjg==
X-Gm-Message-State: ANoB5pnxp5CRje/rXyZrnbUaLR0KmYaPyUbT4Bjcal70fTsPjKVajegP
        BRz3vz76YNy6BtAqdWlWFH8=
X-Google-Smtp-Source: AA0mqf6lM5ccSe+dVM1AZflD0NdV3k3fbHailrzQF+2gBWGrBfmQ7iPsTPU0l1Xey1qtawF+oMr74A==
X-Received: by 2002:a05:6000:16c6:b0:236:6e66:3447 with SMTP id h6-20020a05600016c600b002366e663447mr13412336wrf.24.1669104232909;
        Tue, 22 Nov 2022 00:03:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b003d01b84e9b2sm7573873wmq.27.2022.11.22.00.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:03:52 -0800 (PST)
Date:   Tue, 22 Nov 2022 11:03:49 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     thomas.jarosch@intra2net.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] xfrm: Fix oops in __xfrm_state_delete()
Message-ID: <Y3yCZRzW4Vz3dOE4@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Thomas Jarosch,

The patch c39f95aaf6d1: "xfrm: Fix oops in __xfrm_state_delete()"
from Nov 2, 2022, leads to the following Smatch static checker
warning:

	net/xfrm/xfrm_policy.c:2139 xfrm_policy_lookup_bytype()
	error: potential NULL/IS_ERR bug 'ret'

net/xfrm/xfrm_policy.c
    2076 static struct xfrm_policy *xfrm_policy_lookup_bytype(struct net *net, u8 type,
    2077                                                      const struct flowi *fl,
    2078                                                      u16 family, u8 dir,
    2079                                                      u32 if_id)
    2080 {
    2081         struct xfrm_pol_inexact_candidates cand;
    2082         const xfrm_address_t *daddr, *saddr;
    2083         struct xfrm_pol_inexact_bin *bin;
    2084         struct xfrm_policy *pol, *ret;
    2085         struct hlist_head *chain;
    2086         unsigned int sequence;
    2087         int err;
    2088 
    2089         daddr = xfrm_flowi_daddr(fl, family);
    2090         saddr = xfrm_flowi_saddr(fl, family);
    2091         if (unlikely(!daddr || !saddr))
    2092                 return NULL;
    2093 
    2094         rcu_read_lock();
    2095  retry:
    2096         do {
    2097                 sequence = read_seqcount_begin(&net->xfrm.xfrm_policy_hash_generation);
    2098                 chain = policy_hash_direct(net, daddr, saddr, family, dir);
    2099         } while (read_seqcount_retry(&net->xfrm.xfrm_policy_hash_generation, sequence));
    2100 
    2101         ret = NULL;

ret starts as NULL.

    2102         hlist_for_each_entry_rcu(pol, chain, bydst) {
    2103                 err = xfrm_policy_match(pol, fl, type, family, if_id);
    2104                 if (err) {
    2105                         if (err == -ESRCH)
    2106                                 continue;

I guess it could end as NULL if every err == -ESRCH.

    2107                         else {
    2108                                 ret = ERR_PTR(err);
    2109                                 goto fail;
    2110                         }
    2111                 } else {
    2112                         ret = pol;
    2113                         break;
    2114                 }
    2115         }
    2116         bin = xfrm_policy_inexact_lookup_rcu(net, type, family, dir, if_id);
    2117         if (!bin || !xfrm_policy_find_inexact_candidates(&cand, bin, saddr,
    2118                                                          daddr))
    2119                 goto skip_inexact;
    2120 
    2121         pol = xfrm_policy_eval_candidates(&cand, ret, fl, type,
    2122                                           family, if_id);
    2123         if (pol) {
    2124                 ret = pol;
    2125                 if (IS_ERR(pol))
    2126                         goto fail;
    2127         }
    2128 
    2129 skip_inexact:
    2130         if (read_seqcount_retry(&net->xfrm.xfrm_policy_hash_generation, sequence))
    2131                 goto retry;
    2132 
    2133         if (ret && !xfrm_pol_hold_rcu(ret))
                     ^^^
This code says it can be NULL.

    2134                 goto retry;
    2135 fail:
    2136         rcu_read_unlock();
    2137 
    2138         if (!IS_ERR(ret))
                             ^^^
So this should be if (!IS_ERR_OR_NULL(ret))

--> 2139                 printk("xfrm_policy_lookup_bytype: policy if_id %d, wanted if_id  %d\n", ret->if_id, if_id);
                                                                                                  ^^^^^
Unchecked dereference.

    2140 
    2141         return ret;
    2142 }

regards,
dan carpenter
