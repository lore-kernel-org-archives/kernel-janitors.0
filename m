Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8036AC00144
	for <kernel-janitors@archiver.kernel.org>; Fri, 29 Jul 2022 21:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239291AbiG2VWm (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 29 Jul 2022 17:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239237AbiG2VWj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 Jul 2022 17:22:39 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A661C8BAAC
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Jul 2022 14:22:37 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so3028223wmo.0
        for <kernel-janitors@vger.kernel.org>; Fri, 29 Jul 2022 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VP1TFn4cwwlj9BdZS1E/aMX4RjtsTrqqclStcGSTbI8=;
        b=hCYpG7Q3yfGV2ediqENaecFLSxVExYXRliiGYnCBAkw+vs2/S/fUKRWV0h78XESZMJ
         wtO7qQE8KBd62LMKTL16iAd1/O2lAebBF0XgzboUHIHuPBteM04vCLil6QY/Y3N9MnVl
         5V3yqM1vEsy26DqRvHSwtmpjAiH/v+Owop29ln5j6RV9A2n+FiyUa3nY1bYVKosbrFQx
         ZSCvb82exohNwnyKBNuGtwQHj/jNo+9kz7pH3hO5S/tn3od7VKHSiH1FAGysNtsKjocF
         HsSeqEBMN9UlKPxZgYgVkPFpZnU7Bac8B3wHOIEcEFrpiyYGpKPqyGF03+tg6a7l4El1
         Y3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VP1TFn4cwwlj9BdZS1E/aMX4RjtsTrqqclStcGSTbI8=;
        b=Wm40xe83I/5YR/Yx0Zj9SvlBaBs8mSDPKE4IYJNiDEUh1IG8MTMJvjQJl1ql2a9/zf
         J6SWkIcD4tH0okJ+NiLCzc2JpgrQV0K0UGoq8EYdItea28YUqgjRK+wvceN/Z1JU+upO
         QUwqPrknRp60vv7SmXwc6XwDFPGeMGaSVjg54o4q66PIOydWgAm6sLGvMMi9ucZkzi/s
         WKBD0tciRLmaarC1w9n8kxJzE7n/x7xlLSuuOHcQYvf/uPnb+KW+ikZfmq63nMSzxQvU
         1+9frJ2+YH5VbwXQlrnjADsYN7T5ll8vRqy+6XgAUwZB6NbIfd8s+edy1UIwYvF6CJ1/
         n4cg==
X-Gm-Message-State: AJIora+0r8rqmAcF43bVKhcz5AyYxzhbHgkC87ddmUAQIH/kRew5a0s1
        9ZbAyag6M4E+IYUzHEjaPhzt6Y5fvA3uJ9ExHsd3
X-Google-Smtp-Source: AGRyM1sPMv7E6kpTFNndHLAAPSnoNRtu9GiEzuztQyDcYjPpdPdWbZkzmhdqMRRcKppTmEXbhZEdxBGr0TL6i3HW/OA=
X-Received: by 2002:a05:600c:3b07:b0:3a3:1433:10b5 with SMTP id
 m7-20020a05600c3b0700b003a3143310b5mr3732146wms.129.1659129755972; Fri, 29
 Jul 2022 14:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <a896e176f0f0b819f8ec5ab8935355d01a642506.1659126514.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a896e176f0f0b819f8ec5ab8935355d01a642506.1659126514.git.christophe.jaillet@wanadoo.fr>
From:   John Stultz <jstultz@google.com>
Date:   Fri, 29 Jul 2022 14:22:23 -0700
Message-ID: <CANDhNCrFtv+jdGTFGH5NSV_W591Z-Ut-3rt94zzCRtVbUoye9g@mail.gmail.com>
Subject: Re: [PATCH v2] timers: Optimize usleep_range()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 29, 2022 at 1:29 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Most of the time the 'min' and 'max' parameters of usleep_range() are
> constant. We can take advantage of it to pre-compute at compile time
> some values otherwise computer at run-time in usleep_range_state().
>
> Replace usleep_range_state() by a new __nsleep_range_delta_state() function
> that takes as parameters the pre-computed values.
>
> The main benefit is to save a few instructions, especially 2
> multiplications (x1000 when converting us to ns).
>
>
> Some hand simplified diff of the generated asm are given below. They were
> produced on a Intel(R) Core(TM) i7-3770, with gcc 11.2.0.
>
> drivers/clk/clk-si514.c (taken as an example)
> -----------------------
> In this driver we have:
>    usleep_range(10000, 12000);
>
> --- clk_before.asm      2022-07-29 21:49:05.702289425 +0200
> +++ clk_after.asm       2022-07-29 21:50:23.801548963 +0200
> @@ -972,8 +972,8 @@
>   ea0:  45 85 e4                test   %r12d,%r12d
>   ea3:  0f 88 f6 fc ff ff       js     b9f <si514_set_rate+0x9f>
>   ea9:  e8 00 00 00 00          call   eae <si514_set_rate+0x3ae>
> - eae:  be e0 2e 00 00          mov    $0x2ee0,%esi             ;     12.000
> - eb3:  bf 10 27 00 00          mov    $0x2710,%edi             ;     10.000
> + eae:  be 80 84 1e 00          mov    $0x1e8480,%esi           ;  2.000.000
> + eb3:  bf 80 96 98 00          mov    $0x989680,%edi           ; 10.000.000
>   eb8:  ba 02 00 00 00          mov    $0x2,%edx
>   ebd:  e8 00 00 00 00          call   ec2 <si514_set_rate+0x3c2>
>   ec2:  44 8b 74 24 30          mov    0x30(%rsp),%r14d
>
> The asm produced in the caller is mostly the same. Only constant values
> passed to usleep_range_state() or __nsleep_range_delta_state() are
> different. No other instructions or whatever is different.
>
>
> kernel/time/timer.c
> -------------------
> -0000000000000000 <usleep_range_state>:
> +0000000000000000 <__nsleep_range_delta_state>:
>   f3 0f 1e fa           endbr64
>   e8 00 00 00 00        call   ...
>   48 b8 00 00 00 00 00  movabs $0xdffffc0000000000,%rax
> @@ -10692,16 +10692,14 @@
>   41 56                 push   %r14
>   49 c7 c6 00 00 00 00  mov    $0x0,%r14
>   41 55                 push   %r13
> - 41 89 d5              mov    %edx,%r13d
> + 49 89 f5              mov    %rsi,%r13
>   41 54                 push   %r12
> - 49 89 f4              mov    %rsi,%r12
> + 41 89 d4              mov    %edx,%r12d
>   55                    push   %rbp
> - 44 89 ed              mov    %r13d,%ebp
> + 44 89 e5              mov    %r12d,%ebp
>   53                    push   %rbx
>   48 89 fb              mov    %rdi,%rbx
>   81 e5 cc 00 00 00     and    $0xcc,%ebp
> - 49 29 dc              sub    %rbx,%r12              ; (max - min)
> - 4d 69 e4 e8 03 00 00  imul   $0x3e8,%r12,%r12       ; us --> ns (x 1000)
>   48 83 ec 68           sub    $0x68,%rsp
>   48 c7 44 24 08 b3 8a  movq   $0x41b58ab3,0x8(%rsp)
>   b5 41
> @@ -10721,18 +10719,16 @@
>   31 c0                 xor    %eax,%eax
>   e8 00 00 00 00        call   ...
>   e8 00 00 00 00        call   ...
> - 49 89 c0              mov    %rax,%r8
> - 48 69 c3 e8 03 00 00  imul   $0x3e8,%rbx,%rax       ; us --> ns (x 1000)
> + 48 01 d8              add    %rbx,%rax
> + 48 89 44 24 28        mov    %rax,0x28(%rsp)
>   65 48 8b 1c 25 00 00  mov    %gs:0x0,%rbx
>   00 00
> - 4c 01 c0              add    %r8,%rax
> - 48 89 44 24 28        mov    %rax,0x28(%rsp)
>   e8 00 00 00 00        call   ...
>   31 ff                 xor    %edi,%edi
>   89 ee                 mov    %ebp,%esi
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> v1 -> v2
>   - Simplify and avoid use of __buildint_constant_p() [John Stultz <jstultz@google.com>]
>   - Also update usleep_idle_range()
>   - Axe usleep_range_state()  [John Stultz <jstultz@google.com>]
>   - Fix kerneldoc  [John Stultz <jstultz@google.com>]
>   - Update log message accordingly
> https://lore.kernel.org/all/d7fc85736adee02ce52ee88a54fa7477fbd18ed2.1653236802.git.christophe.jaillet@wanadoo.fr/
> ---

Thanks for taking the time to rework this! It looks much better to me!

The only nit I have is you still have a few checkpatch issues to resolve:

WARNING: 'convertion' may be misspelled - perhaps 'conversion'?
#154: FILE: include/linux/delay.h:68:
+        * convertion to ns will be optimized-out at compile time.
           ^^^^^^^^^^

ERROR: code indent should use tabs where possible
#198: FILE: kernel/time/timer.c:2124:
+^I^I^I^I        unsigned int state)$

CHECK: Alignment should match open parenthesis
#198: FILE: kernel/time/timer.c:2124:
+void __sched __nsleep_range_delta_state(u64 min, u64 delta,
+                                       unsigned int state)


(also the path lines in the commit message is confusing checkpatch a bit)

With those resolved, when you resubmit, you can add my:
  Acked-by: John Stultz <jstultz@google.com>

thanks
-john
