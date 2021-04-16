Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B515C43461
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 16:11:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48A716113D
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 16:11:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240164AbhDPQMS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 12:12:18 -0400
Received: from smtprelay0071.hostedemail.com ([216.40.44.71]:46968 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239949AbhDPQMR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 12:12:17 -0400
Received: from omf18.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id BBB9A180018DF;
        Fri, 16 Apr 2021 16:11:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id A24442EBF98;
        Fri, 16 Apr 2021 16:11:50 +0000 (UTC)
Message-ID: <decdb749f0192bd886faa7e8470795fb2644e4f8.camel@perches.com>
Subject: Re: [PATCH] checkpatch: Improve ALLOC_ARRAY_ARGS test
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        apw@canonical.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Fri, 16 Apr 2021 09:11:49 -0700
In-Reply-To: <a1ac975aaabc9f71397b75254f833920428411e0.1618588673.git.christophe.jaillet@wanadoo.fr>
References: <a1ac975aaabc9f71397b75254f833920428411e0.1618588673.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout02
X-Stat-Signature: p3mzayeefbt44sf8bdnq7wru9a7yw45t
X-Rspamd-Queue-Id: A24442EBF98
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18Vt669FdflVPUqqlaDZzRsRQelMpUEMCw=
X-HE-Tag: 1618589510-381955
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2021-04-16 at 17:58 +0200, Christophe JAILLET wrote:
> The devm_ variant of 'kcalloc()' and 'kmalloc_array()' are not tested
> Add the corresponding check.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -7006,9 +7006,9 @@ sub process {
>  		}
>  
> 
>  # check for alloc argument mismatch
> -		if ($line =~ /\b(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
> +		if ($line =~ /\b(devm_|)(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {

Perhaps nicer using

		if ($line =~ /\b((?:devm_)?(?:kcalloc|kmalloc_array))\s*\*\s*sizeof\b/) {

>  			WARN("ALLOC_ARRAY_ARGS",
> -			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
> +			     "$1$2 uses number as first arg, sizeof is generally wrong\n" . $herecurr);

So there's only one capture group and this line doesn't need to be changed.


