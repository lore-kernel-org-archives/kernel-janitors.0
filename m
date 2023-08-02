Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F344FC001DF
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Aug 2023 16:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjHBQ6g (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Aug 2023 12:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjHBQ6f (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Aug 2023 12:58:35 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E6C271C
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Aug 2023 09:58:31 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31765aee31bso25291f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Aug 2023 09:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690995510; x=1691600310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF7ncbVFPQRUGWBMilwqWXSWdbdCMHch/7Ppjxwfoag=;
        b=cTI946eFvl9Cpc+nZA5NiHAznUMtGLnLtJAYTBePBqSqEELNTYi6lnBVIfRP4s6Zl/
         t1MPAcz+NEFkydmSCTn7VSjgux5WcsD1Wu50CaWOGop1M7vwbdFiDptl/c5t+wND317T
         M72qGfI5b6dYrm6vV2QD87cDKVLKvClXDdBSFiXnjzV5ov9D1NnfTr1WrnoMT+wx5Tf3
         FmFKEoPjgP9ohoT7HtKOYuUnqcyRDMSLakFfTX4tgkl7IrVLw1+5ns+LbOsjg5K8CQm3
         Bk1NYXGzxhr02IqpmGrQ74612rqlMT7j1n805fTj718xqpfzBcUBGyBYTjh6G/DKchg/
         kQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690995510; x=1691600310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF7ncbVFPQRUGWBMilwqWXSWdbdCMHch/7Ppjxwfoag=;
        b=EdKwqlLBUPWqMWnQytA6XhudkfOahfdPMYb7XBx/D/PXeYyWM57w6A1ylqLJN0vKyO
         VpTf27l8N+hBJnnywXN16CX6/LaslZo+dJw9NTaQAAWiX5v9+xd7kxL8HGsDLf/cj8cw
         xyh/+g2fzRdu/oEuCCYC/ZfUWBt4ngtoz1o9yQqSyuEpCVIramM/j3DjeAI7PDuq4kzR
         Td3Cz8nP6ECMHewM+4R/+bB4sEWlbxybrolc5XpSiO1Zf4FYn0tPcqLwg/TAL7oSO289
         uSBrnejlhpcpwF8cii/hefFu/PMibalM9Ur222Q47hfRrvuQQ9+bs9jaVx0CmchdKnpB
         Q9dQ==
X-Gm-Message-State: ABy/qLYlcKjj/C+B8LPgtmj0Joj8Ysr/PG2Ebd3TNkyy9dy+VrtsMeTL
        aumUhauwb6cCg3S6EgeLQO4=
X-Google-Smtp-Source: APBJJlGqtTksYe/KUeMv+/6921HwRFoGKk38e0E81n8r5Jtn9kD8Vt2sIlEQQo7R4hVocZOkY8++Bw==
X-Received: by 2002:a5d:5589:0:b0:317:70cb:4f58 with SMTP id i9-20020a5d5589000000b0031770cb4f58mr5232028wrv.63.1690995509568;
        Wed, 02 Aug 2023 09:58:29 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id m17-20020aa7d351000000b005224c6b2183sm8825968edr.39.2023.08.02.09.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 09:58:29 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailauth.nyi.internal (Postfix) with ESMTP id 99B2227C0054;
        Wed,  2 Aug 2023 12:58:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 02 Aug 2023 12:58:27 -0400
X-ME-Sender: <xms:MovKZIu6eO51L6JU7Cn3mXaF2NZxXyDVSN8cRMqCDgGb7tM8SNSR7g>
    <xme:MovKZFdrGstePY60A345fby3x49W74K19nrNcaEBymE0XiIM3-TUvpqDw1R8FG1kQ
    7RYgD3PoC6FczMwvw>
X-ME-Received: <xmr:MovKZDw2RJTY1UTXh9qD-rhGkMiyYkaf6Ze-kWGfX0cYlIFzSgMKicxznpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkedtgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepiedtfeevhfetkeelgfethfegleekfeffledvvefhheeukedtvefhtedtvdet
    vedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
    hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
    qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
    hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:MovKZLNr-LWFtZPM1yJWiMsGZmALzl4a3pJVojO_4oPVSeIbfqnVmw>
    <xmx:MovKZI9x0GoKKNeu9dNUn_Fu8X1RKMwRG234Tzoz6h8Z1KETiuhWsA>
    <xmx:MovKZDVwgfOUt2GEIkL0QQhKfgrGsNB8IN-pOtr2SI3oMp6i1KjlLA>
    <xmx:M4vKZMaQQaLgWAtSOBKInXeHDPtaATKUqnJYyYP9ISQJivtB4AGmPQ>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Aug 2023 12:58:26 -0400 (EDT)
Date:   Wed, 2 Aug 2023 09:57:37 -0700
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kernel-janitors@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [bug report] lockdep/selftests: Use SBRM APIs for wait context
 tests
Message-ID: <ZMqLAUyMuiTKdLfS@boqun-archlinux>
References: <c7b538a3-eb0b-4905-8ebf-8bda88e576fa@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7b538a3-eb0b-4905-8ebf-8bda88e576fa@moroto.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Aug 02, 2023 at 10:35:09AM +0300, Dan Carpenter wrote:
> Hello Boqun Feng,
> 

Hi Dan,

> The patch f66c538098b6: "lockdep/selftests: Use SBRM APIs for wait
> context tests" from Jul 15, 2023 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	lib/locking-selftest.c:2577 mutex_in_HARDIRQ()
> 	warn: sleeping in atomic context
> 
> lib/locking-selftest.c
>     2567 GENERATE_2_CONTEXT_TESTCASE(RCU, , inner, inner_lock)                                \
>     2568 GENERATE_2_CONTEXT_TESTCASE(RCU_BH, , inner, inner_lock)                        \
>     2569 GENERATE_2_CONTEXT_TESTCASE(RCU_SCHED, , inner, inner_lock)                        \
>     2570 GENERATE_2_CONTEXT_TESTCASE(raw_spinlock, &raw_lock_A, inner, inner_lock)        \
>     2571 GENERATE_2_CONTEXT_TESTCASE(spinlock, &lock_A, inner, inner_lock)                \
>     2572 GENERATE_2_CONTEXT_TESTCASE(mutex, &mutex_A, inner, inner_lock)
>     2573 
>     2574 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(RCU, )
>     2575 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(raw_spinlock, &raw_lock_B)
>     2576 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(spinlock, &lock_B)
> --> 2577 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(mutex, &mutex_B)
> 
> This takes a mutex from HARD IRQ context which is illegal because
> HARDIRQ_ENTER() will disable preemption.  Enable CONFIG_DEBUG_ATOMIC_SLEEP=y
> to see this bug at run time.
> 
> This is a testing file so it does a lot of crazy stuff.  It's a bit
> hard to tell what is intentional and what isn't.

Thanks for reporting this. However the "bug" is by design,
locking-selftest.c contains tests that trigger incorrect lock usages and
see if lockdep can catch them, so it's supposed to work in that way.

Out of curiosity, could Smatch detect the same issue without the patch?
The patch is simply a cleanup, so no functional change, in theory, the
"bug" can be detected without that patch.

Regards,
Boqun

> 
> lib/locking-selftest.c:336 rlock_AA1() error: double locked '&rwlock_X1' (orig line 335)
> lib/locking-selftest.c:348 rsem_AA1() error: double locked '&rwsem_X1' (orig line 347)
> lib/locking-selftest.c:740 double_unlock_spin() error: double unlocked '&lock_A' (orig line 740)
> lib/locking-selftest.c:742 double_unlock_wlock() error: double unlocked '&rwlock_A' (orig line 742)
> lib/locking-selftest.c:744 double_unlock_rlock() error: double unlocked '&rwlock_A' (orig line 744)
> lib/locking-selftest.c:746 double_unlock_mutex() error: double unlocked '&mutex_A' (orig line 746)
> lib/locking-selftest.c:748 double_unlock_wsem() error: double unlocked '&rwsem_A' (orig line 748)
> lib/locking-selftest.c:750 double_unlock_rsem() error: double unlocked '&rwsem_A' (orig line 750)
> lib/locking-selftest.c:1678 ww_test_fail_acquire() warn: 'o.ctx' could be an error pointer
> lib/locking-selftest.c:1683 ww_test_fail_acquire() error: double locked '&o' (orig line 1676)
> lib/locking-selftest.c:1691 ww_test_fail_acquire() error: double locked '&o' (orig line 1683)
> lib/locking-selftest.c:1695 ww_test_fail_acquire() error: double locked '&o.base' (orig line 1686)
> lib/locking-selftest.c:1696 ww_test_fail_acquire() error: double unlocked '&o' (orig line 1693)
> lib/locking-selftest.c:1699 ww_test_fail_acquire() warn: inconsistent returns '&o'.
> lib/locking-selftest.c:1768 ww_test_normal() error: double locked '&o.base' (orig line 1767)
> lib/locking-selftest.c:1776 ww_test_normal() error: double unlocked '&o.base' (orig line 1770)
> lib/locking-selftest.c:1830 ww_test_object_unlock_twice() error: double unlocked '&o' (orig line 1829)
> lib/locking-selftest.c:1872 ww_test_edeadlk_normal() error: double locked '&o2' (orig line 1864)
> lib/locking-selftest.c:1898 ww_test_edeadlk_normal_slow() error: double locked '&o2' (orig line 1890)
> lib/locking-selftest.c:1923 ww_test_edeadlk_no_unlock() error: double locked '&o2' (orig line 1916)
> lib/locking-selftest.c:1948 ww_test_edeadlk_no_unlock_slow() error: double locked '&o2' (orig line 1941)
> lib/locking-selftest.c:2066 ww_test_edeadlk_acquire_wrong() warn: XXX '&o2' both locked and unlocked.
> lib/locking-selftest.c:2091 ww_test_edeadlk_acquire_wrong_slow() warn: XXX '&o2' both locked and unlocked.
> lib/locking-selftest.c:2236 ww_test_spin_block() warn: sleeping in atomic context
> lib/locking-selftest.c:2255 ww_test_spin_try() error: double locked '&o.base' (orig line 2248)
> lib/locking-selftest.c:2257 ww_test_spin_try() error: double unlocked '&o' (orig line 2252)
> lib/locking-selftest.c:2277 ww_test_spin_context() warn: sleeping in atomic context
> lib/locking-selftest.c:2577 mutex_in_HARDIRQ() warn: sleeping in atomic context
> 
> regards,
> dan carpenter
