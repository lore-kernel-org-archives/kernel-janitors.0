Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D5FCCA479
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Jul 2022 09:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232759AbiGUJGE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 21 Jul 2022 05:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232762AbiGUJGC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Jul 2022 05:06:02 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668D8DD4;
        Thu, 21 Jul 2022 02:06:02 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f3-20020a17090ac28300b001f22d62bfbcso1074689pjt.0;
        Thu, 21 Jul 2022 02:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=/gjSO1P0+ypi+dAbHumtfu+l4RNRaKCVMSATA+gVtK0=;
        b=p3T08RLMhPYVLW4E0XZ0cpdFZboxHeaywSyKmXZO8funVvxaKNLqzivPCLWnViWlV/
         XpJHcgjb06ZnXKcktJF2IJ1T7oMSkQUyNGJj4i0JJ7KTf26KGdjS86+zONdShRfa6Fk9
         ydRw3SVPSoe8c6Yd28Wt+jJDTO5B8+tN2mMihjvW061DB6fSygWBkMb2K6QKbgXiEppF
         laI+pJ/BCZ6t6/VRO4i6Vga2w8DkZtTmu9+7xlReXNHJ9U3A/oeeCdlPtM2inFtI5XiN
         NO/cTSRTGSLCQ1QW8JzhN6e8NQa8CxH4h8IzTm+iUHpOZm7W+mel9gUfmdZcvtDj/nLK
         +wQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/gjSO1P0+ypi+dAbHumtfu+l4RNRaKCVMSATA+gVtK0=;
        b=iqJk+EVmm7iXWND+7AHfXC+bfgLCB/tZeFRLT5LP7Ui80kRde9l2rrRSN6k3XVM1AA
         vN/QEM1fQd77w83wp9YZEHMumV1yE4hCLnwEwGtmKXy8LZp28M+WRE10453MU3PuF32B
         CyxiPe7eav/eDfczBZujbN/xgkR8+N2xytQBorYzuC9eSj3CU79DEvFUQyk/Cd5SNj/5
         g0qrEBzXnnbLWnbb0nUYWnwh01w8oBCbGe/lYrNpHVcC/r563V3Ib6P2bbt89AOsKrp3
         y9zfDURmFFWSDnz3nYQjIXoB3hnpCirMWkIEuiWTF3KtzuiLq86+4wLAsh0AOIZOg+p2
         lQuA==
X-Gm-Message-State: AJIora9eLQPxV+RM3/nJvF4uIRJMe8MD/GRLrqQCLo+ikuceQU1/A4J3
        CieY+EaDwnlIS88Mt6MTKpM=
X-Google-Smtp-Source: AGRyM1uY2mE4ZUL4hLTTBA9l8mbeq/De6KlYim4wzHUxD7RfB9QqSwZO426EgW207atAwNPjl6L4Ig==
X-Received: by 2002:a17:903:2301:b0:16c:58a3:639f with SMTP id d1-20020a170903230100b0016c58a3639fmr43121429plh.122.1658394361834;
        Thu, 21 Jul 2022 02:06:01 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-19.three.co.id. [180.214.233.19])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b0016c33dc879esm1115591pln.113.2022.07.21.02.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 02:06:01 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id C1604103976; Thu, 21 Jul 2022 16:05:57 +0700 (WIB)
Date:   Thu, 21 Jul 2022 16:05:57 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        kernel-janitors@vger.kernel.org
Subject: MAINTAINERS improv suggestion
Message-ID: <YtkW9awXT3nWyvts@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Lukas and everyone in linux-doc ML,

Thanks for your work on doc cleanup. However, there's still one thing left:
MAINTAINERS. The patch submitters tips, IMO, need some work.

Here's my notes:

* Nowadays most drivers (especially on embedded architectures like Arm) were
  initially developed out-of-tree, then follows mainline inclusion process
  But the second item read "Try to release a few ALPHA test versions to the
  net. Announce them onto the kernel channel and await results". These
  drivers were submitted not as ALPHA-grade, but near-production grade.

* The fifth item mentioned using `diff -u` to generate patches, however
  since 9f364b605f34e1 ("submitting-patches.rst: presume git will be used"),
  the documentation elsewhere assumed git would be used.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
