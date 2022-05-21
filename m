Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A381C433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 May 2022 12:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241248AbiEUMGV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 21 May 2022 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243700AbiEUMGS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 May 2022 08:06:18 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B421CB36
        for <kernel-janitors@vger.kernel.org>; Sat, 21 May 2022 05:06:17 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id j21so9616572pga.13
        for <kernel-janitors@vger.kernel.org>; Sat, 21 May 2022 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=173FUsw6tLIJBxwMxWbaXPAVuBn6Pqyry82161LO+5o=;
        b=t7th7/O7T+GQeFuDwYpInw+m79Nf9NcWcLo49bsR0eUYI8sBkzCFs80bwuythG6L+m
         hQTVY4+XcWPk7VQFLj7yw0tVrwwWpMqrYKZkR+THOIt2o7DKmHxJc/7v0FFYKhr5IK6Z
         HpVMl4PKViTGMhoMGXsfsFuz5U4HH8WsRPpuMmZwJz6xBB+OJNWEsIv8YDwSoo7corb5
         kb5iMIwEjtsTUxWvkd7pEmZUB7R48721v+yddyIbXui2D/s6jsKSDXyOtt/1zYBqgMxX
         5brk/nFW9snvzOfQQ++A8s/7bvmweeB101z1qlPM4mpddYGwKeMNu5tV4Jxn4LWWsR1p
         Y3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=173FUsw6tLIJBxwMxWbaXPAVuBn6Pqyry82161LO+5o=;
        b=bX/HQvxHbWQK9mDFY5gbW7CNdeHK/BBT8RQAN4Tz4xSxiFR9jx4Ly4CDQ0+u2VKf8b
         w9sAbrUEmwu7HBgrUi9xCe0jimJ81b0Er5N1hHUsFZ5DeKQZgG0fbtg6JjD0REmML4uT
         q90hj38FiAGOU8SWOnoARHu5qEhOoQE9LfYmeq6mtoo4JZw3L6yCPLBwE4SaRsrqnD0T
         rt3qeLFycv2eFterPkY33yXKVzcsLVe0TxZivk+n6bWk5vfv7/Z/f+v9jGKrmrMKdNvL
         88fdWLWC9XoC/IIsNksrOh/AbF0uv8g9llSOm6yn07Ef06aHdDm2slmH2eb+pRtuuseN
         6E0Q==
X-Gm-Message-State: AOAM531siFs7Z0BLfn8ZqQKYXOI4S/yiH+idbsTVyrRr0izdjMsWI304
        hQ6ISxCqV2Xib1B5fK+hU8LroQ==
X-Google-Smtp-Source: ABdhPJxKSfGRT8m0D3bvpo8J9qYc7ZkBmclnsMk5PYLCp1cn0OI4MWpkCsZWpL6K+oJOckoMolhItg==
X-Received: by 2002:a63:202:0:b0:3f2:75a7:cd28 with SMTP id 2-20020a630202000000b003f275a7cd28mr12480723pgc.537.1653134776979;
        Sat, 21 May 2022 05:06:16 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id m4-20020a655304000000b003f9eacd0684sm1264323pgq.3.2022.05.21.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 05:06:16 -0700 (PDT)
Date:   Sat, 21 May 2022 20:06:13 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel-janitors@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ksm: fix typo in comment
Message-ID: <YojVtbCiQ47+Aoq1@FVFYT0MHHV2J.usts.net>
References: <20220521111145.81697-94-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220521111145.81697-94-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 21, 2022 at 01:11:44PM +0200, Julia Lawall wrote:
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>
 
