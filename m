Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605B5C6379F
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Feb 2023 16:21:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231715AbjBNQVX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Feb 2023 11:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjBNQVW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Feb 2023 11:21:22 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF0B26B6
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Feb 2023 08:21:20 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so12063979wms.0
        for <kernel-janitors@vger.kernel.org>; Tue, 14 Feb 2023 08:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOPXTSTnWEyhEixxdhEAiX1IzwmDS1kueI7usRMkHUw=;
        b=gDByGn1T5oBBVJ69WWoYHinhg01Cl2Gpj2wYx6ENHSR5fArlzitFIB0pQYdmsqlSkb
         P5oGcYodKRi0785Td/YzMABcNOhUodRE8gP6a/duSU7ikOL+ke40KP6idsuvcz9/CyJm
         W57ieosv9M8ep7Txwv1hECvOvJZ1NUVQqCGOnGgsfL8pkFEw6L7DVqEFXmsLjKP8pBeL
         cZB5o1/xJ3J4V9rVFMvClipB2hqY9Z2cVD5hpqGzHBfk+TAcfekbITtDrQLGa2NDSyC1
         uroc1PbDb+YN+5XkDuvM4QINv32pzspYOyV+tYdiz2TvhBXgak1H/qYINd4TUwAzCBKR
         nEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOPXTSTnWEyhEixxdhEAiX1IzwmDS1kueI7usRMkHUw=;
        b=Ej7ODAYsAbegKIkJZyBuuq4oaBqRvBJMT0PcgZ8h85glzjQ7HnfwLjkfxq3ADMyU/d
         hZJwQoGOChZ5rPfmY9HiLVscXWWoCGB4nj+sq5PiHGNTgBTCethe7aKg+p7pgbwkLgCm
         UZeSgMMsmosSGv/f09ystX6FTohos5D5+7FXDYryXnvtcoa6aFcxesBAUfHPLcca7+vS
         YLlhmvlabZtPUQG1rXuJ0x80km0HVEY+s4iIZ+UwTDx3puDPCAMSgnGvbFbR8uikZ/Es
         dk395Q5aQRc8ytPYQ9cux/xHe08tBdglQDhRf5qSXcniiEeQjF62TFlk0cte+7Excd4T
         ivgQ==
X-Gm-Message-State: AO0yUKUKMHcrF5TYMb8Owte00rqkWJJdpr4pTApR2Rt7dNTvB9SYaMS/
        NjRMQ+JMghOvpDFcd2bgvBzB+r9cEIHB0Q==
X-Google-Smtp-Source: AK7set+/RxPS/G1DYQeiUF58g3QJy+3JAq3UBWlubguQ4MV8aa1hlZxFADMkPl7Z9qfc06/TYhzS3Q==
X-Received: by 2002:a05:600c:4b1d:b0:3df:fbc7:5b10 with SMTP id i29-20020a05600c4b1d00b003dffbc75b10mr2576676wmp.0.1676391679495;
        Tue, 14 Feb 2023 08:21:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s12-20020a05600c45cc00b003dfe5190376sm18893303wmo.35.2023.02.14.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:21:18 -0800 (PST)
Date:   Tue, 14 Feb 2023 19:21:15 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     pctammela@mojatatu.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net/sched: tcindex: update imperfect hash filters
 respecting rcu
Message-ID: <Y+u0+9MYw6Y9WzNq@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Pedro Tammela,

This is a semi-automatic email about new static checker warnings.

The patch ee059170b1f7: "net/sched: tcindex: update imperfect hash 
filters respecting rcu" from Feb 9, 2023, leads to the following 
Smatch complaint:

    net/sched/cls_tcindex.c:509 tcindex_set_parms()
    error: we previously assumed 'cf' could be null (see line 504)

net/sched/cls_tcindex.c
   503			/* lookup the filter, guaranteed to exist */
   504			for (cf = rcu_dereference_bh_rtnl(*fp); cf;
                                                                ^^
This loops until "cf" is NULL

   505			     fp = &cf->next, cf = rcu_dereference_bh_rtnl(*fp))
   506				if (cf->key == handle)
   507					break;
   508	
   509			f->next = cf->next;
                                  ^^^^^^^^
Unchecked dereference

   510	
   511			cf = rcu_replace_pointer(*fp, f, 1);

regards,
dan carpenter
