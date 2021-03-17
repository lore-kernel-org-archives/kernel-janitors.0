Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05F0C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 13:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4743E64F3C
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Mar 2021 13:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhCQNNb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Mar 2021 09:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhCQNNS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Mar 2021 09:13:18 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975B9C06174A
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Mar 2021 06:13:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id t18so1089776pjs.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Mar 2021 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=cNsdvHq1b8nnYWl1jQJMISH8r36cTd1AjyY9iWsIh7M=;
        b=rVR/SbzsbZLkPOiNlvhkw/TyDtp6IIYhBiEqWpVlDbN7c4OLdguwuMHtnBtgJaYXhi
         FDwl1aMAAndyYTAEZU/M7C4bs5ILYlxN5gcYRmS5GkxCwtjvmCUxvH2ouzOzATBhqUhl
         tY7lcYcmMhH68/hA0hhuFEkgXGKwEv3OClACGCt9rvlznwmb1jYHjZS0SzDGdFleLVvD
         xkshoEkysJobwXr+CEItFX0XYNwP9JCFg3IVyDTPeXiwOjOEeI7AkB6UZ9jInkOpCH/4
         htXHfv+rrSqLNNQC1tvZ+jycTzBrBKGf8U7fGEHMS8nn2r1XwJbR9nNVKt5qsRUEB601
         3e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=cNsdvHq1b8nnYWl1jQJMISH8r36cTd1AjyY9iWsIh7M=;
        b=t7G9GDDGuXtU534GV8pAOx/RbbohcL/QBbrRDaK6w89C+u2nxvWllGgwYIss/raUEG
         Bk5aUIXMg9Wqtv2HMsdW6biq+FaGlQp4sAXkedNH1Uc/1Lg1DI5SHAaOa1+xz6542TrS
         xLXmKhM/1xKkjcnCFyjTS+lBA9WEhWQ3pkpyHFAbTNLOwWIIS4JWXbRgFHhW+xqDNGXj
         8YlEDlIiMlbT73Gf/wFTvAK52AZCxv9/8rQQmyIPUE7WUr8UNh5kC/RXh1EUA22xQePC
         KJKw3UZhvQEbYBUk7j4ZLkF5BXaRp+HQV6vDnyiMf/xxaa40g4tkLlv1l9JxJGwyQFYQ
         F8Bg==
X-Gm-Message-State: AOAM531YCK5CeTxBDGFOOx3eSJ7TUA5yYPBxqRgD2HP8CU8LTZ6kvzX+
        Mt42m17LiNUS51CQxcb56xH1FmMxB3Y=
X-Google-Smtp-Source: ABdhPJz/Q1AWzRvSLSM8Zp/tbBJZs740TU7craO1Nu05EUC5oiPF6n6xme6L8SzKdXmqWytTrg7Zeg==
X-Received: by 2002:a17:902:f68c:b029:e5:ca30:8657 with SMTP id l12-20020a170902f68cb02900e5ca308657mr4536920plg.78.1615986797932;
        Wed, 17 Mar 2021 06:13:17 -0700 (PDT)
Received: from pop-os ([1.234.154.110])
        by smtp.gmail.com with ESMTPSA id v26sm19057450pff.195.2021.03.17.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 06:13:17 -0700 (PDT)
References: <87o8fl0yf4.fsf@gmail.com> <20210317083128.GZ2087@kadam>
User-agent: mu4e 1.5.7; emacs 28.0.50
From:   Junyeong Jeong <esrse.jeong@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: /sys/devices/system/cpu/possible can be changed during runtime?
Date:   Wed, 17 Mar 2021 22:02:34 +0900
In-reply-to: <20210317083128.GZ2087@kadam>
Message-ID: <87ft0t2aac.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Thank you Carpenter for answering my question.

Oops.. I did not know that kernel-janitors is not right place for asking
general kernel related esoteric topics. Then, what is proper mailing
list? Can you recommend me some places to ask this question?

You mentioned CPU hotplugging. That's a good point. But When I tested
hotplugging CPU using QMEU/KVM, I only observed that
/sys/devices/system/cpu/{online,offline} changed, while
/sys/devices/system/cpu/possible did not change.

regards,
    Junyeong Jeong

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Mon, Mar 15, 2021 at 02:35:06PM +0900, Junyeong Jeong wrote:
>> Hello everyone :D
>> 
>> I wonder that possible-CPU-mask(/sys/devices/system/cpu/possible) can be
>> changed during runtime. I read that it is fixed at boot time, but I am
>> not sure that it is really immutable even if some cgroup or
>> virtualization magic is used.
>> 
>> I am referring to /sys/devices/system/cpu/possible file to get to know
>> the number of per-cpu areas. In userspace, I call `bpf_lookup_elem()` to
>> get values at index from BPF array map of which type is
>> BPF_MAP_TYPE_PERCPU_ARRAY.  And the length of the gained values is the
>> same with the number of per-cpu areas and in turn it is the same with
>> the number of possible CPUs.
>> 
>> I am anxious that this varies from time to time under some
>> circumstances. So I checked some cgroup and virtualization use-cases
>> which did not affect the possible-CPU-mask.
>> 
>> $ docker run --cpuset-cpus=0-3 -it ubuntu:20.10 bash  # cgroup cpuset
>> $ virsh setvcpus --current ubuntu20.10 5  # hotplug cpu while guest os is running..
>> 
>> But while conducting this I realized that it's not possible to prove the
>> immutability of possible-CPU-mask using inductive method.
>> 
>> Can anyone explain that it will not happen that possible-CPU-mask
>> changes after boot-time even with cgroup magic or some tricks from
>> outside of hypervisors?
>> 
>> Thanks,
>
> Kernel janitors is mostly about fixing and updating kernel API, not
> discussing how the kernel works.
>
> You can't write to that sysfs file.
> -r--r--r-- 1 root root 4096 Mar 17 11:28 /sys/devices/system/cpu/possible
> But we do allow people to add and remove CPUs while the system is
> running (CPU hotplug).  The number of CPUs is not necessarily fixed at
> boot time.  It's not immutable.
>
> I'm not sure if this helps?
>
> regards,
> dan carpenter

