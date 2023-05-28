Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551DEC77B7E
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 May 2023 16:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjE1Q4w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 May 2023 12:56:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjE1Q4v (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 May 2023 12:56:51 -0400
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4206ED8;
        Sun, 28 May 2023 09:56:48 -0700 (PDT)
Received: from in02.mta.xmission.com ([166.70.13.52]:46880)
        by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1q3JKa-00Ciru-2q; Sun, 28 May 2023 10:33:20 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:56530 helo=email.froward.int.ebiederm.org.xmission.com)
        by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1q3JKZ-005jqW-4W; Sun, 28 May 2023 10:33:19 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <53150beae5dc04dac513dba391a2e4ae8696a7f3.1685290790.git.christophe.jaillet@wanadoo.fr>
Date:   Sun, 28 May 2023 11:32:52 -0500
In-Reply-To: <53150beae5dc04dac513dba391a2e4ae8696a7f3.1685290790.git.christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 28 May 2023 18:20:24 +0200")
Message-ID: <871qj0l8ln.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1q3JKZ-005jqW-4W;;;mid=<871qj0l8ln.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+tXXgu/hTVpYUB13NneAVqnHHTh5F4BPI=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH 1/2] binfmt: Use struct_size()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> Use struct_size() instead of hand-writing it. It is less verbose, more
> robust and more informative.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
Obviously correct transform.

>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested on arm
> ---
>  fs/binfmt_elf_fdpic.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
> index d76ad3d4f676..237ce388d06d 100644
> --- a/fs/binfmt_elf_fdpic.c
> +++ b/fs/binfmt_elf_fdpic.c
> @@ -748,7 +748,6 @@ static int elf_fdpic_map_file(struct elf_fdpic_params *params,
>  	struct elf32_phdr *phdr;
>  	unsigned long load_addr, stop;
>  	unsigned nloads, tmp;
> -	size_t size;
>  	int loop, ret;
>  
>  	/* allocate a load map table */
> @@ -760,8 +759,7 @@ static int elf_fdpic_map_file(struct elf_fdpic_params *params,
>  	if (nloads == 0)
>  		return -ELIBBAD;
>  
> -	size = sizeof(*loadmap) + nloads * sizeof(*seg);
> -	loadmap = kzalloc(size, GFP_KERNEL);
> +	loadmap = kzalloc(struct_size(loadmap, segs, nloads), GFP_KERNEL);
>  	if (!loadmap)
>  		return -ENOMEM;
