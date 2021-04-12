Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F3CC43462
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 08:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D367761353
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 08:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbhDLI6D (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 04:58:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:48830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238602AbhDLI4c (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 04:56:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A51E61353;
        Mon, 12 Apr 2021 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618217774;
        bh=KtsLSlOp8y/qn6vUbROhT+wR61yVeLcKbgFjA96VCA8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U0zHhsjZwQSolmLpaEwQRqWUKVNjcc4kNYg1s6zF4nEZ9oLQMOSdC2nOVeLFP4XKu
         ERlqHnCvM91rRh0PP4p/OtIuyj28wkQ+2mF4igOzi6HEdLsdimZ7o6wxQw0Z6nTp4b
         uJwOW0GWxVi3tbvw/Amv0seVYpb4JQ7T0rpFjErNIMf+h4XPd7fcEhpSqpPkfe/t9g
         WqG1d6UX5HelQpzscnPuXzl7xG10hIWrkZGxzlzHPSNKZ8OYG3HrIReCZzDOd/B8/I
         l47MG1MzPsIqSDwSTk+UOtITPE0Ebe4FsI7hZt3t4GF8EqtYaPKN5i1Y2eQ/QR20EL
         fZO9zh9O+J5Mg==
Date:   Mon, 12 Apr 2021 17:56:11 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     rostedt@goodmis.org, mingo@redhat.com, zanussi@kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] tracing/dynevent: Fix a memory leak in an error
 handling path
Message-Id: <20210412175611.86cd00c819ad8344502d8d95@kernel.org>
In-Reply-To: <21e3594ccd7fc88c5c162c98450409190f304327.1618136448.git.christophe.jaillet@wanadoo.fr>
References: <21e3594ccd7fc88c5c162c98450409190f304327.1618136448.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, 11 Apr 2021 12:21:54 +0200
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> We must free 'argv' before returning, as already done in all the other
> paths of this function.

OOps, thanks for finding the bug!

> 
> Fixes: d262271d0483 ("tracing/dynevent: Delegate parsing to create function")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you,

> ---
>  kernel/trace/trace_dynevent.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace_dynevent.c b/kernel/trace/trace_dynevent.c
> index dc971a68dda4..e57cc0870892 100644
> --- a/kernel/trace/trace_dynevent.c
> +++ b/kernel/trace/trace_dynevent.c
> @@ -63,8 +63,10 @@ int dyn_event_release(const char *raw_command, struct dyn_event_operations *type
>  		event = p + 1;
>  		*p = '\0';
>  	}
> -	if (event[0] == '\0')
> -		return -EINVAL;
> +	if (event[0] == '\0') {
> +		ret = -EINVAL;
> +		goto out;
> +	}
>  
>  	mutex_lock(&event_mutex);
>  	for_each_dyn_event_safe(pos, n) {
> -- 
> 2.27.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
