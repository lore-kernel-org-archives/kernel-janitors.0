Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EE8C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 28 Apr 2022 17:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350443AbiD1REu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 28 Apr 2022 13:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244321AbiD1REu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 28 Apr 2022 13:04:50 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC011AAE20
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 10:01:35 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id d23-20020a17090a115700b001d2bde6c234so6183907pje.1
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Apr 2022 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gd/K8krvAPWi+okSoX/WeDwibwWuKSE8ydN/JkjTURI=;
        b=OvTWc97Vl2/X989/qmHj1LCifD5rUP4LJjqZBVrRuI1AsqYhkhlEB1geozCpRCm6Gw
         QxTe5QKRM9vKVDOi011Bqgn6dOPIvat6fgumHTXCf7HePnbq2IPRqALDc7IXr5vW8g4Q
         DCN6yuVdckjPOXyayazIP5kD/p3j5V/gz2CLs7CUJM0rwkWKYkTspbFD5wh3NzmAAIrL
         6ZXfGV1s04MCGjfGyxSGIEL0HYWdbtymTeb1Vm4eXe5GMJFVBwOVYXInZgbcDszkgNkm
         APR/MsD6QSDepyYDVcnFhh70Syz1s4Ax5xoNWlhvFHY4U/+Vsyzt3XV8JEzLo1fOf1hY
         l/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gd/K8krvAPWi+okSoX/WeDwibwWuKSE8ydN/JkjTURI=;
        b=A96dFiwFFI379Y5dcZJStp/CPZJvvlCLTqvit2I70QfuQNglp69nGYKAw/DPL6wTs2
         bRIRaNvzuUhblIy65DvNipz9jWgNlzjmRFSbTORk3whBqrxhXiNcN2Zqooay3+D4BiQa
         8eUi9InvEJ4Z4PeZZY6DoJvGanupRMOzNKQB3sm8AP3cQDIGVu9v/ylu3rxgO2aHK+UV
         JYEaa/NVHxd1Wk1UVBaqUgwdmzFWHHNYKAX2Ckgni+Yl2A5jEq09ZpnmSGj2oYTk9fuw
         FksGVwwixdtt66LswHZko1+ZEOVQio8UzY4vg4oX7g+7w20MJEnQU6Cfh/YeFX1lv5Kv
         pxEQ==
X-Gm-Message-State: AOAM533H6i07jNmnl+5AX6cXFk2eo5FAMZwsKgMIRM6WxfTYrXxCCp/Q
        B4BKnwJcnNsTMmWDsDQS7rXVL4+b+1UcMBO+WMLUEQ==
X-Google-Smtp-Source: ABdhPJxt1svQqZ32Cf8qWatX7K19f42NNGX4e8sgGGqAaq5SDAYTQxtJLoUkESIYZI7fZnFmEnstvucVm6i91gziJZo=
X-Received: by 2002:a17:90b:4b01:b0:1d2:abf5:c83f with SMTP id
 lx1-20020a17090b4b0100b001d2abf5c83fmr39123940pjb.93.1651165295046; Thu, 28
 Apr 2022 10:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <YmpgkbbQ1Yxu36uO@kili>
In-Reply-To: <YmpgkbbQ1Yxu36uO@kili>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 28 Apr 2022 10:01:24 -0700
Message-ID: <CAPcyv4h6JNM9cnkdTK-kax-3agWgziN+AEAU7mqZ+=SEWzHjMQ@mail.gmail.com>
Subject: Re: [PATCH] cxl/mbox: fix logical vs bitwise typo
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alison Schofield <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Ben Widawsky <ben.widawsky@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Davidlohr Bueso <dave@stgolabs.net>, linux-cxl@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 28, 2022 at 2:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This should be bitwise & instead of &&.
>
> Fixes: 6179045ccc0c ("cxl/mbox: Block immediate mode in SET_PARTITION_INFO command")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, good find.
