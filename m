Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6B6C3DA7A
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Jan 2023 14:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjAFOk5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Jan 2023 09:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAFOkz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Jan 2023 09:40:55 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB9B5E651
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Jan 2023 06:40:54 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bn26so1473671wrb.0
        for <kernel-janitors@vger.kernel.org>; Fri, 06 Jan 2023 06:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNh7Xnr1aZ49VJhjIO5kSP0Ad0tSgajzTzeLPqX79g8=;
        b=JsfKZWgbJMAu3tVztmrCK1WlGIUF0OlOGgAHQxB4YpxDXftOppHlMsAX2gc0b2Ota4
         RcpYJj16lPoT4HyPfH1t0SP05q9zqfLgCa6ab5NdgoNoY1VhuUltFCEuNPb2R/gsbkF5
         bTV9hhYFDCTa/29v9bqzA7Po8ElgJor6VXWc4U3AFxsXSYJjmLcLjNqbG67LeCjPadje
         JoO2h/JsZ0fbxflIHtUSN2Wbf9Nan3b6y+hpIy37hIyoN74ozzfm1Oo1Dmbsy5Y0PhTb
         gw7NPVpb/CfBDaHVHsngJVDG88Qj1ngQ32OyvE4wAdb/BNqk4rbFpM+zCHZRfujFXem7
         MtXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNh7Xnr1aZ49VJhjIO5kSP0Ad0tSgajzTzeLPqX79g8=;
        b=Z3HxxUeN9kC0spc/3QuvX+Eg9P4+XeR2QT+e196jRLfuzxB/MarJFkQMe3WkD42225
         LkgC3WwhLWzveXhB+9R0BtN5FXQVZu89AJuURtuFS+DKFYL4GsTVoyOEx4LZH6pyn+W3
         SF/oDPC2BMj/XcJI8Wy0jnVrH1AP3CjohKJTRCxptaLedAdVJNWBq6OWI4Pv/CQWqPKS
         MsCby6JS6oaOwVkSrDKzXTL0Cl7fvFE0lpXEw0+LFNYpDWyYBGtDStd/k6y5sqt4FgyE
         l43VhH4/w+MJwabcWu2CbOYaCTYJCF+QY9blc1wv+tMaecf1+DwmvUQFimbejXKo+FWO
         mhgg==
X-Gm-Message-State: AFqh2kqwwT80ANMVWdM17AAWYM8p1lX6rC5DGF2mAiO1AREyTlfi84Mu
        CQdr8f9wPBmtK2BiVt/A8P8xeGBDHtVBCw==
X-Google-Smtp-Source: AMrXdXuvCcKK7S+Cs+psqiUeYJ1NLLQqe12zGFgub/ymWH/4ndPsgG9WmF/dFp2rbA4XaKzFsACEgQ==
X-Received: by 2002:adf:e5c7:0:b0:270:de92:7962 with SMTP id a7-20020adfe5c7000000b00270de927962mr33788812wrn.60.1673016052993;
        Fri, 06 Jan 2023 06:40:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b1-20020adf9b01000000b0028e55b44a99sm1296755wrc.17.2023.01.06.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 06:40:52 -0800 (PST)
Date:   Fri, 6 Jan 2023 17:40:42 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     gakula@marvell.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-pf: Fix lmtst ID used in aura free
Message-ID: <Y7gy6qQsFg8GD1x1@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Geetha sowjanya,

The patch 4af1b64f80fb: "octeontx2-pf: Fix lmtst ID used in aura
free" from Jan 3, 2023, leads to the following Smatch static checker
warning:

	drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c:1381 otx2_sq_aura_pool_init()
	warn: sleeping in atomic context

drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
    1368         /* Flush accumulated messages */
    1369         err = otx2_sync_mbox_msg(&pfvf->mbox);
    1370         if (err)
    1371                 goto fail;
    1372 
    1373         get_cpu();
                 ^^^^^^^^^
This new get_cpu() disables preemption.


    1374         /* Allocate pointers and free them to aura/pool */
    1375         for (qidx = 0; qidx < hw->tot_tx_queues; qidx++) {
    1376                 pool_id = otx2_get_pool_idx(pfvf, AURA_NIX_SQ, qidx);
    1377                 pool = &pfvf->qset.pool[pool_id];
    1378 
    1379                 sq = &qset->sq[qidx];
    1380                 sq->sqb_count = 0;
--> 1381                 sq->sqb_ptrs = kcalloc(num_sqbs, sizeof(*sq->sqb_ptrs), GFP_KERNEL);
                                                                                 ^^^^^^^^^^
Change this to GFP_ATOMIC?

    1382                 if (!sq->sqb_ptrs) {
    1383                         err = -ENOMEM;
    1384                         goto err_mem;
    1385                 }
    1386 
    1387                 for (ptr = 0; ptr < num_sqbs; ptr++) {
    1388                         err = otx2_alloc_rbuf(pfvf, pool, &bufptr);
    1389                         if (err)
    1390                                 goto err_mem;
    1391                         pfvf->hw_ops->aura_freeptr(pfvf, pool_id, bufptr);
    1392                         sq->sqb_ptrs[sq->sqb_count++] = (u64)bufptr;
    1393                 }
    1394         }
    1395 
    1396 err_mem:
    1397         put_cpu();
    1398         return err ? -ENOMEM : 0;
    1399 
    1400 fail:
    1401         otx2_mbox_reset(&pfvf->mbox.mbox, 0);
    1402         otx2_aura_pool_free(pfvf);
    1403         return err;
    1404 }

regards,
dan carpenter
