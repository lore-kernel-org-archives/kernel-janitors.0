Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B71C77B7C
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 May 2023 16:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjE1QeZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 May 2023 12:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjE1QeY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 May 2023 12:34:24 -0400
X-Greylist: delayed 61 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 28 May 2023 09:34:23 PDT
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332D9A7;
        Sun, 28 May 2023 09:34:23 -0700 (PDT)
Received: from in01.mta.xmission.com ([166.70.13.51]:34506)
        by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1q3JLa-00E8Di-5G; Sun, 28 May 2023 10:34:22 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:52152 helo=email.froward.int.ebiederm.org.xmission.com)
        by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <ebiederm@xmission.com>)
        id 1q3JLZ-005nnu-6C; Sun, 28 May 2023 10:34:21 -0600
From:   "Eric W. Biederman" <ebiederm@xmission.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <53150beae5dc04dac513dba391a2e4ae8696a7f3.1685290790.git.christophe.jaillet@wanadoo.fr>
        <4f5e4096ad7f17716e924b5bd080e5709fc0b84b.1685290790.git.christophe.jaillet@wanadoo.fr>
Date:   Sun, 28 May 2023 11:34:13 -0500
In-Reply-To: <4f5e4096ad7f17716e924b5bd080e5709fc0b84b.1685290790.git.christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 28 May 2023 18:20:25 +0200")
Message-ID: <87sfbgjtyy.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1q3JLZ-005nnu-6C;;;mid=<87sfbgjtyy.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=68.110.29.46;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+GhCjQTZvVqIa8i7A4q9b4QSSH7bhe+Nk=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH 2/2] binfmt: Slightly simplify elf_fdpic_map_file()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

> There is no point in initializing 'load_addr' and 'seg' here, they are both
> re-written just before being used below.
>
> Doing so, 'load_addr' can be moved in the #ifdef CONFIG_MMU section.
>

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Kees do you maybe want to pick these trivial fixes up?

> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested on arm, with and without CONFIG_MMU
> ---
>  fs/binfmt_elf_fdpic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/binfmt_elf_fdpic.c b/fs/binfmt_elf_fdpic.c
> index 237ce388d06d..1c6c5832af86 100644
> --- a/fs/binfmt_elf_fdpic.c
> +++ b/fs/binfmt_elf_fdpic.c
> @@ -743,11 +743,12 @@ static int elf_fdpic_map_file(struct elf_fdpic_params *params,
>  	struct elf32_fdpic_loadmap *loadmap;
>  #ifdef CONFIG_MMU
>  	struct elf32_fdpic_loadseg *mseg;
> +	unsigned long load_addr;
>  #endif
>  	struct elf32_fdpic_loadseg *seg;
>  	struct elf32_phdr *phdr;
> -	unsigned long load_addr, stop;
>  	unsigned nloads, tmp;
> +	unsigned long stop;
>  	int loop, ret;
>  
>  	/* allocate a load map table */
> @@ -768,9 +769,6 @@ static int elf_fdpic_map_file(struct elf_fdpic_params *params,
>  	loadmap->version = ELF32_FDPIC_LOADMAP_VERSION;
>  	loadmap->nsegs = nloads;
>  
> -	load_addr = params->load_addr;
> -	seg = loadmap->segs;
> -
>  	/* map the requested LOADs into the memory space */
>  	switch (params->flags & ELF_FDPIC_FLAG_ARRANGEMENT) {
>  	case ELF_FDPIC_FLAG_CONSTDISP:
