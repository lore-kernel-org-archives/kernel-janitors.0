Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DCDC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Mar 2022 07:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237314AbiCVHKO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237316AbiCVHKJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Mar 2022 03:10:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9D65F267
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Mar 2022 00:08:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F6AF614AD
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Mar 2022 07:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB504C340EC;
        Tue, 22 Mar 2022 07:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647932915;
        bh=+FgEoIvhuQEordaHiY1irhNbI0yOIe3sMrENzkGw/DI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LpLfD1aX10C60eWc6nloC7wwDhIf/Z3sPeUfQDoD91UTV3q30T3PGWw1PYIVItqAj
         EiNok7XNKi/vvSdjRtJvcWeucs0gVZ0hgpKj+T4YCVMHCQBD5GWr1dTvvR+QB4y5t+
         W5ROxC2fc1pF5R2m9wVS8Ne6I4kAr1CVW0N/ALXyyzoJFucfIYD3RTktZSzpWAIBlV
         DMExA4GRlrOt+tozaJr4HtRDNDxhUNoxswAg68LzulSIUu3oML/llINjaQaBAuWSr0
         0BcfHhrUCj79y/6wPZMaWQrKpLWJSo4tGT2hKL3k1rPT+acQ1ng/L1fP3emronIi53
         CSGx7/IHxkTtw==
Date:   Tue, 22 Mar 2022 16:08:32 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] fprobe: Add exit_handler support
Message-Id: <20220322160832.76c1fe0197ab4671086b368c@kernel.org>
In-Reply-To: <20220322064620.GA22331@kili>
References: <20220322064620.GA22331@kili>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On Tue, 22 Mar 2022 09:46:20 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Masami Hiramatsu,
> 
> The patch 5b0ab78998e3: "fprobe: Add exit_handler support" from Mar
> 15, 2022, leads to the following Smatch static checker warning:
> 
> 	kernel/trace/fprobe.c:155 fprobe_init_rethook()
> 	warn: struct type mismatch 'rethook_node vs fprobe_rethook_node'
> 
> kernel/trace/fprobe.c
>     134 static int fprobe_init_rethook(struct fprobe *fp, int num)
>     135 {
>     136         int i, size;
>     137 
>     138         if (num < 0)
>     139                 return -EINVAL;
>     140 
>     141         if (!fp->exit_handler) {
>     142                 fp->rethook = NULL;
>     143                 return 0;
>     144         }
>     145 
>     146         /* Initialize rethook if needed */
>     147         size = num * num_possible_cpus() * 2;
>     148         if (size < 0)
>     149                 return -E2BIG;
>     150 
>     151         fp->rethook = rethook_alloc((void *)fp, fprobe_exit_handler);
>     152         for (i = 0; i < size; i++) {
>     153                 struct rethook_node *node;
>     154 
> --> 155                 node = kzalloc(sizeof(struct fprobe_rethook_node), GFP_KERNEL);
> 
> It's hard to tell if we're deliberately allocating a larger struct or
> whether it's accidental.

Good catch! This does not cause any error, but it should be;

struct fprobe_rethook_node *node;

node = kzalloc(sizeof(*node), GFP_KERNEL);
...
rethook_add_node(fp->rethook, &node->node);

Thank you!

> 
>     156                 if (!node) {
>     157                         rethook_free(fp->rethook);
>     158                         fp->rethook = NULL;
>     159                         return -ENOMEM;
>     160                 }
>     161                 rethook_add_node(fp->rethook, node);
>     162         }
>     163         return 0;
>     164 }
> 
> regards,
> dan carpenter


-- 
Masami Hiramatsu <mhiramat@kernel.org>
