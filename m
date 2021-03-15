Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3ACC28E88
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 05:39:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52CA864E1F
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 Mar 2021 05:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhCOFil (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 Mar 2021 01:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbhCOFiK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 Mar 2021 01:38:10 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FDC5C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 22:38:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id f8so1210827plg.10
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 22:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=user-agent:from:to:subject:date:message-id:mime-version;
        bh=6Ixs3cJqEL9ZhQcEDI908Q1nCbq86cR2Bx4Np0rfFkA=;
        b=mCVsLOZgK9g5dzxzkZA0RQM0t1lWvDtQzaSajfITXmJ7t8MvfzThTOcEWtILeCsWAr
         1Ejv0TKK9UTv7sCG7tSdIqQYrBWkI8PlNuEeYORbvTVBmAaBmfqphxacVT10xC8tAC0G
         baAPvEY/FMliSJydZG6Od2ze690ZK4m+o9WzEawlsCt//SL3K6VQCekFsO11QlF6FLGn
         C733VmrBTW1xtDtYpWadtUhIx3Y8AZm3ekJVGjpRVjWRXH1TQuuuFtIlxmWc2y4M+n7O
         IC/qHEA//UdbbK4tBa6/hbTluAUwlyFOXFS5pC03P8TTen9z5qCqa5v0ud3NVPcp1Tbt
         qe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:user-agent:from:to:subject:date:message-id
         :mime-version;
        bh=6Ixs3cJqEL9ZhQcEDI908Q1nCbq86cR2Bx4Np0rfFkA=;
        b=c9S8gohgZ/bJOgzQpEdzrKxM7G4TcIiwd08toJKcWz7iKUrQkFF1NxQ3iu6PEFCK6o
         xP1gHTgBUsG3DIAWd6aRxR8Od2gN1GjaIVO62muVO1KKtZWX+9xj0TfpZS12HAbO7/wc
         NIvJIDDX08PJ4mX3Fu0/q5PgA8/Oo+feg8NLG2L8AJoXJT2D3PjfGnCrWxsXRk+n7a96
         tXMbZLQW/ZisheWSVM+npPyruNNzeT1TETfTizt3vyyjKsJ43tHpZ39pxgjyfdaHXwIK
         qVveWoxlOW6SID4jmqiwOVkZ9kCwIvGLYBg66yq/A/j7MC8n6TbT4/Bh+hhbIIU4NnVo
         p6jg==
X-Gm-Message-State: AOAM532Cl1/BxyMe5S5BS+qbDd4mos7x2eWlImPDYe2jdqfxNVjfgNSK
        zExr8g7M/I0c8AiVLIPCMaHNMKsBq1k=
X-Google-Smtp-Source: ABdhPJwVE+TaWkN9yPah7TsXGbG/Z/BtY+7mpFj98cAoHgp8ek4Gsfq4yKewaYM0IyeOhfA4MTVzqg==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id q10mr11064559pjv.129.1615786689938;
        Sun, 14 Mar 2021 22:38:09 -0700 (PDT)
Received: from pop-os ([1.234.154.110])
        by smtp.gmail.com with ESMTPSA id j10sm9203808pjs.11.2021.03.14.22.38.08
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 22:38:09 -0700 (PDT)
User-agent: mu4e 1.5.7; emacs 28.0.50
From:   Junyeong Jeong <esrse.jeong@gmail.com>
To:     kernel-janitors@vger.kernel.org
Subject: /sys/devices/system/cpu/possible can be changed during runtime?
Date:   Mon, 15 Mar 2021 14:35:06 +0900
Message-ID: <87o8fl0yf4.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello everyone :D

I wonder that possible-CPU-mask(/sys/devices/system/cpu/possible) can be
changed during runtime. I read that it is fixed at boot time, but I am
not sure that it is really immutable even if some cgroup or
virtualization magic is used.

I am referring to /sys/devices/system/cpu/possible file to get to know
the number of per-cpu areas. In userspace, I call `bpf_lookup_elem()` to
get values at index from BPF array map of which type is
BPF_MAP_TYPE_PERCPU_ARRAY.  And the length of the gained values is the
same with the number of per-cpu areas and in turn it is the same with
the number of possible CPUs.

I am anxious that this varies from time to time under some
circumstances. So I checked some cgroup and virtualization use-cases
which did not affect the possible-CPU-mask.

$ docker run --cpuset-cpus=0-3 -it ubuntu:20.10 bash  # cgroup cpuset
$ virsh setvcpus --current ubuntu20.10 5  # hotplug cpu while guest os is running..

But while conducting this I realized that it's not possible to prove the
immutability of possible-CPU-mask using inductive method.

Can anyone explain that it will not happen that possible-CPU-mask
changes after boot-time even with cgroup magic or some tricks from
outside of hypervisors?

Thanks,
