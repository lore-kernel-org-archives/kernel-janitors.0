Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB71C00528
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Aug 2023 07:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbjHBHft (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Aug 2023 03:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjHBHfq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Aug 2023 03:35:46 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63CF30F3
        for <kernel-janitors@vger.kernel.org>; Wed,  2 Aug 2023 00:35:15 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so9892352a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 02 Aug 2023 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690961714; x=1691566514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YLIJtvzsnV3Icq4athFEr+YRPJEXuTri6/XjwSKiKOk=;
        b=w9m2iyRqJcn0nX21XZO+fwO1aK+Kn1XKppF2foapzraaa3AVoJAECWbkG3DaB2Zagj
         aSCyG4DEw3zmhKzfRAAiS1XpzoNxAHBmyYtJmOi9iiQlqBTkZlHYRxD9M46921/1irK6
         fBFxFhNQqSnRRI4hTzRt9vGt04NAIPBPGVgSlc8EuZtkKKjnuILzk0J+gD1J1R/3vykP
         5YpjkxO+gAjE5IBWgD4uY5JNzUGbf+9NXJowzOI2HkmzmDNMUiilkgxWVUuZ98wtfHJg
         n+VwAmzZrqzotU3W2V1+ycCwyzh3+8OXJpQFnniSBpWmRrQtTxiJLId/goDKp3ipzlMp
         O0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690961714; x=1691566514;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YLIJtvzsnV3Icq4athFEr+YRPJEXuTri6/XjwSKiKOk=;
        b=K91YFqmVZhNXRe0fSii5tWJKjd2L7FBA5Vi1QHfLsNNO8yFs120LAd/bNOjCjDS6jP
         JTv3+T2hhDp3EMPJRk2qMcPgnEYENjfIbwiZ7BZiZwjAisR1cgv7k8tKLJpM0RQABxyf
         QlzzcoVJDr0cNpVwZv9kSP+7EZS312W5dh0YkugAF23PDG4sajwDUz0c+Vb8hVfyupbR
         yw75BGnHHaaeR/KR9Xoc/QxHRsYJvQIohwXDFiIA9C/KbLBDR6yc3hDnNj/zh8GID0Ys
         S5HssqU1WbLoFzaOd8WPK4LbUs7lWSGFmwKn6DP56P7HJPrqDtbf5rJD5TXMS1XHijsl
         GJug==
X-Gm-Message-State: ABy/qLZxPl6VDrvxRbtZPwWtLmSBsNKd0+xZgIKfjFYel3IiOG3v+Cjp
        1RRh3vcAU2+r7rhFuSoYlu+mZg==
X-Google-Smtp-Source: APBJJlFb3nY293gzEGU8CcpgezzrSGNm9ZluYgplqgz4vvKX3ZHNxz19Yb43DwCuPpn6F/ik1LG58w==
X-Received: by 2002:a05:6402:b26:b0:51d:9e0c:1396 with SMTP id bo6-20020a0564020b2600b0051d9e0c1396mr4162518edb.35.1690961714130;
        Wed, 02 Aug 2023 00:35:14 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d88b000000b0052229d203a4sm8205981edq.36.2023.08.02.00.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 00:35:13 -0700 (PDT)
Date:   Wed, 2 Aug 2023 10:35:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     boqun.feng@gmail.com
Cc:     Waiman Long <longman@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        kernel-janitors@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [bug report] lockdep/selftests: Use SBRM APIs for wait context tests
Message-ID: <c7b538a3-eb0b-4905-8ebf-8bda88e576fa@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Boqun Feng,

The patch f66c538098b6: "lockdep/selftests: Use SBRM APIs for wait
context tests" from Jul 15, 2023 (linux-next), leads to the following
Smatch static checker warning:

	lib/locking-selftest.c:2577 mutex_in_HARDIRQ()
	warn: sleeping in atomic context

lib/locking-selftest.c
    2567 GENERATE_2_CONTEXT_TESTCASE(RCU, , inner, inner_lock)                                \
    2568 GENERATE_2_CONTEXT_TESTCASE(RCU_BH, , inner, inner_lock)                        \
    2569 GENERATE_2_CONTEXT_TESTCASE(RCU_SCHED, , inner, inner_lock)                        \
    2570 GENERATE_2_CONTEXT_TESTCASE(raw_spinlock, &raw_lock_A, inner, inner_lock)        \
    2571 GENERATE_2_CONTEXT_TESTCASE(spinlock, &lock_A, inner, inner_lock)                \
    2572 GENERATE_2_CONTEXT_TESTCASE(mutex, &mutex_A, inner, inner_lock)
    2573 
    2574 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(RCU, )
    2575 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(raw_spinlock, &raw_lock_B)
    2576 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(spinlock, &lock_B)
--> 2577 GENERATE_2_CONTEXT_TESTCASE_FOR_ALL_OUTER(mutex, &mutex_B)

This takes a mutex from HARD IRQ context which is illegal because
HARDIRQ_ENTER() will disable preemption.  Enable CONFIG_DEBUG_ATOMIC_SLEEP=y
to see this bug at run time.

This is a testing file so it does a lot of crazy stuff.  It's a bit
hard to tell what is intentional and what isn't.

lib/locking-selftest.c:336 rlock_AA1() error: double locked '&rwlock_X1' (orig line 335)
lib/locking-selftest.c:348 rsem_AA1() error: double locked '&rwsem_X1' (orig line 347)
lib/locking-selftest.c:740 double_unlock_spin() error: double unlocked '&lock_A' (orig line 740)
lib/locking-selftest.c:742 double_unlock_wlock() error: double unlocked '&rwlock_A' (orig line 742)
lib/locking-selftest.c:744 double_unlock_rlock() error: double unlocked '&rwlock_A' (orig line 744)
lib/locking-selftest.c:746 double_unlock_mutex() error: double unlocked '&mutex_A' (orig line 746)
lib/locking-selftest.c:748 double_unlock_wsem() error: double unlocked '&rwsem_A' (orig line 748)
lib/locking-selftest.c:750 double_unlock_rsem() error: double unlocked '&rwsem_A' (orig line 750)
lib/locking-selftest.c:1678 ww_test_fail_acquire() warn: 'o.ctx' could be an error pointer
lib/locking-selftest.c:1683 ww_test_fail_acquire() error: double locked '&o' (orig line 1676)
lib/locking-selftest.c:1691 ww_test_fail_acquire() error: double locked '&o' (orig line 1683)
lib/locking-selftest.c:1695 ww_test_fail_acquire() error: double locked '&o.base' (orig line 1686)
lib/locking-selftest.c:1696 ww_test_fail_acquire() error: double unlocked '&o' (orig line 1693)
lib/locking-selftest.c:1699 ww_test_fail_acquire() warn: inconsistent returns '&o'.
lib/locking-selftest.c:1768 ww_test_normal() error: double locked '&o.base' (orig line 1767)
lib/locking-selftest.c:1776 ww_test_normal() error: double unlocked '&o.base' (orig line 1770)
lib/locking-selftest.c:1830 ww_test_object_unlock_twice() error: double unlocked '&o' (orig line 1829)
lib/locking-selftest.c:1872 ww_test_edeadlk_normal() error: double locked '&o2' (orig line 1864)
lib/locking-selftest.c:1898 ww_test_edeadlk_normal_slow() error: double locked '&o2' (orig line 1890)
lib/locking-selftest.c:1923 ww_test_edeadlk_no_unlock() error: double locked '&o2' (orig line 1916)
lib/locking-selftest.c:1948 ww_test_edeadlk_no_unlock_slow() error: double locked '&o2' (orig line 1941)
lib/locking-selftest.c:2066 ww_test_edeadlk_acquire_wrong() warn: XXX '&o2' both locked and unlocked.
lib/locking-selftest.c:2091 ww_test_edeadlk_acquire_wrong_slow() warn: XXX '&o2' both locked and unlocked.
lib/locking-selftest.c:2236 ww_test_spin_block() warn: sleeping in atomic context
lib/locking-selftest.c:2255 ww_test_spin_try() error: double locked '&o.base' (orig line 2248)
lib/locking-selftest.c:2257 ww_test_spin_try() error: double unlocked '&o' (orig line 2252)
lib/locking-selftest.c:2277 ww_test_spin_context() warn: sleeping in atomic context
lib/locking-selftest.c:2577 mutex_in_HARDIRQ() warn: sleeping in atomic context

regards,
dan carpenter
