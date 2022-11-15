Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45534C4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:07:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbiKONHw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:07:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiKONHu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:07:50 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E841312AED
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:07:49 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p16so9614000wmc.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbJTa5pyh9Ba1B+OlYlWnAWW0GhBX2I+HniHphUAYQM=;
        b=bkblXbHKXWha6hCxomP521PDePshKL46EfYGimkDkQcffrjxOgdlnzURUD9s7qea8t
         1lf6PIl1VZKvc80FFqF6jxTFDyVJQ64n90qhH1p7mN87N8QhqOoruPeyNSgUSmPH/0Gy
         KB802+Sx1jJZmSo1dEo4se7nVXV21BhTkQTXy+bv2IMxSeAJiMSo5yVfArg01VuxqPbw
         rfJ8TR4Mkuq2qvZg9ijkuZlmlKWhQrSCoGXm9OClT0Xy0a3G0ZXfnzZxuYapSnyzw/U8
         YeLM45I/5/HO767iOa3ZNvjmGAJwg84bJIHRRSd0mfwWrp7YHXJ1+9OIdSmWlPAd20h2
         4SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbJTa5pyh9Ba1B+OlYlWnAWW0GhBX2I+HniHphUAYQM=;
        b=sv6Du05DMZZZQcLBFzxaw4J0ZLK4LE5Ff+UQnjwdE1LhTzvnFagVCW0wGMU7bnNLSp
         JOMueuDHsa92cZTXvu3UqVaCbZqG/OvRGuEI0f7Syf/4hZXZL9TaoPGEZH84Uy0FMMB5
         5DoUmUeGg3msehOhAay9kK/Z5pT/Uw9dam6Gl7spSMfo1rh1Y9Bd9UqwotikdANZffp+
         0y/ILbJYk72rflQ9l9qiuM7cA+vFW0bLdVIjkBSmhZMfBDjn+QEcUCzd2NpxOAX+yC/k
         4lL97MP/e99TjPguUA03LkKuKkSNFhu69YfpKeWaycYEhxOOYIs2W7KqSMBpNvpOKVZz
         91RA==
X-Gm-Message-State: ANoB5pmZLSSFaf0yn0boSwkM0nz41Ml90ghnvUZ1SzVr8PbYkkflMpYQ
        dQ4qi6yxnWmMDB1fT3urgCn2uID7QpustQ==
X-Google-Smtp-Source: AA0mqf48fRvauCxnjiOsSEW9RuZKYN9FYQ7x+sYKFeGvHvc8fHMHhy6qWSZmKZDbib/THfm8XXd+qQ==
X-Received: by 2002:a1c:7501:0:b0:3b3:3084:5ddb with SMTP id o1-20020a1c7501000000b003b330845ddbmr319440wmc.108.1668517668434;
        Tue, 15 Nov 2022 05:07:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm12391299wro.69.2022.11.15.05.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:07:48 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:07:33 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     mhiramat@kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] rethook: Add a generic return hook
Message-ID: <Y3OPFTlqLyov9zkB@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Masami Hiramatsu,

The patch 54ecbe6f1ed5: "rethook: Add a generic return hook" from Mar
15, 2022, leads to the following Smatch static checker warning:

	kernel/trace/rethook.c:92 rethook_alloc()
	warn: use 'gfp' here instead of GFP_XXX?

kernel/trace/rethook.c
    89 struct rethook *rethook_alloc(void *data, rethook_handler_t handler, gfp_t gfp,
    90                               int size, int max)
    91 {
--> 92         struct rethook *rh = kzalloc(sizeof(struct rethook), GFP_KERNEL);

"gfp" is always GFP_KERNEL so this doesn't affect runtime.

    93 
    94         if (!rh || !handler)
    95                 return NULL;
    96 
    97         rh->data = data;
    98         rh->handler = handler;
    99 
    100         /* initialize the objpool for rethook nodes */
    101         if (objpool_init(&rh->pool, max, max, size, gfp, rh, rethook_init_node,
    102                         NULL)) {
    103                 kfree(rh);
    104                 return NULL;
    105         }
    106         refcount_set(&rh->ref, max + 1);
    107         return rh;
    108 }

regards,
dan carpenter
