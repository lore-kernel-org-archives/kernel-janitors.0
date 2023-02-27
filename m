Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B48C64ED6
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Feb 2023 13:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjB0Nyf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjB0Nye (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 08:54:34 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C100136D7
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 05:54:34 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id bw19so6272103wrb.13
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 05:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YB8gZKgLvJtsDiGBnoAIkQeWhirkutyg9pUCHs+ovXc=;
        b=NUKvWx2Ut9IYXzGvXjCjzEzwxMKoElStUabhgiNNgeMgl4Enc14+H5pmw5YJW1J5DT
         D3rKxIBrGAIf0q2wxcUxFFCDL2qAPNdr/qzUnYZjma+F3QECiCx8UX+aFA7AstHrB9rZ
         VhcZODuKXuQb3jBCDxoYW1kFvl6vgB5AHCDDZrPvOHDHs3rqU+fcQVUUumOZOn2ko8Cy
         BHaKA+T1e4AHL7qL3wRiS4ZNXXfW0b4QQO+JaVgtPZezADMATtBpB83aktQB9hZv/1i8
         08JjSWqDJpOjmQ0LDUBG2k7N3tmaY5PInhcU8vI7uw7J00famrxf7BPpBadPKtoOJ9t2
         VsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YB8gZKgLvJtsDiGBnoAIkQeWhirkutyg9pUCHs+ovXc=;
        b=0dBmaq8ZrUp1A0TcDnGP/ClNpYUhoHUII7L6KQDQgjHvGgKqq0Ubk+G+iRTep9pDI4
         tvhLjPuS7pNFtTlBwxqaxetKpnjV8wgHk52Sd9B5Aiy7UVKC4bI/0fv2hCiIYXe+y6y1
         cC8Mjc2vZLJgW+TfQzoFbb8F3tR5GZJnllw/PlrsVztC2V18t0biLWkpIxyNx/eFW1h6
         B8uf+JUBX2hyMcfLW8J6RuVa2aOI9Wu4NT7CvwfhcZtEwLldfBTNB/OdF3HYzudgmMIC
         s8dmqoEdaBtgw2adyFAwOEsSO7UC13YpeeLx8h67CWI6M83q3RvA/YCNxc5pvoXaM+ng
         JAew==
X-Gm-Message-State: AO0yUKWxsr033ChpXtZgE6IqIqd/cRF7aEbCGIJ0ssEEoCFRQ/bhY8cc
        a4364V8xN4+/84mwtFRrU3A=
X-Google-Smtp-Source: AK7set/fxi/9ue67rBJwOlnSw8IHoLVYZY2TDSG4b5qcTpJjNDvn5ZYsNL4Kg8JmZ/a2FAgQjHybvQ==
X-Received: by 2002:a5d:47a1:0:b0:2c5:519f:307a with SMTP id 1-20020a5d47a1000000b002c5519f307amr6813041wrb.30.1677506072425;
        Mon, 27 Feb 2023 05:54:32 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b6-20020a5d4b86000000b002c5691f13eesm7124367wrt.50.2023.02.27.05.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 05:54:31 -0800 (PST)
Date:   Mon, 27 Feb 2023 16:54:22 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     paulb@nvidia.com
Cc:     Matthew Wilcox <willy@infradead.org>,
        kernel-janitors@vger.kernel.org
Subject: [bug report] net/sched: cls_api: Support hardware miss to tc action
Message-ID: <Y/y2DhV37BDxSwFc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Paul Blakey,

The patch 80cd22c35c90: "net/sched: cls_api: Support hardware miss to
tc action" from Feb 18, 2023, leads to the following Smatch static
checker warning:

	net/sched/cls_api.c:102 tcf_exts_miss_cookie_base_alloc()
	warn: xa_alloc_cyclic() also returns 1 on success

net/sched/cls_api.c
    92 
    93         n->chain_index = tp->chain->index;
    94         n->chain = tp->chain;
    95         n->tp_prio = tp->prio;
    96         n->tp = tp;
    97         n->exts = exts;
    98         n->handle = handle;
    99 
    100         err = xa_alloc_cyclic(&tcf_exts_miss_cookies_xa, &n->miss_cookie_base,
    101                               n, xa_limit_32b, &next, GFP_KERNEL);
--> 102         if (err)

xa_alloc_cyclic() returns 1 if it succeeds after wrapping.  I don't
know if that applies here, but I feel like this check would be better as
"if (err < 0)".

    103                 goto err_xa_alloc;
    104 
    105         exts->miss_cookie_node = n;
    106         return 0;
    107 
    108 err_xa_alloc:
    109         kfree(n);
    110         return err;
    111 }

regards,
dan carpenter
