Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F89C4320A
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 16:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21A1E61057
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 16:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239720AbhHaQL1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Aug 2021 12:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhHaQLY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Aug 2021 12:11:24 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BE0C061575;
        Tue, 31 Aug 2021 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=zQVdS/bPVtOLSJ7nvRwyeu52RSAXmaasxW4lC9EU+TQ=; b=FWFasBWaDKijx9NOmKy4QvrvnS
        2E3TynMgBXcYkPJ31KQ2zag/ahOHmCTCfgc3qdKkAVBPkGlGwBPWCHk9iU+LrTny+Brf9K4xOL73j
        4eELHlj9WW2VDepfeR6oRAC4hkhi9R5TjkBhDa6K8q/L86ewiVJlbB+nMeFz2aJ7BtpgfoD5BRi9l
        3qRzSY2hgD9AaC8vPtNAXev9TyrKjK8yhi6mNwD11X/A8sT3ok/TRUOJntDqHXY4w/zfZtXd5CRNf
        quRoN5kQZsxgTr6zkCGGx9YuUtQKtLqZ7d26NEF5dwB2D1BlhcPamYRwsHfLc8p4yPJobyncInrCj
        lqkkDngg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mL6LE-002goe-OF; Tue, 31 Aug 2021 16:10:28 +0000
Subject: Re: [PATCH v4] Trivial comment fix for the CRC ITU-T polynom
To:     Roger Knecht <roger@norberthealth.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <trivial@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210831151125.2401-1-roger@norberthealth.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3f26402b-00fd-1da3-0717-e2a6fc254060@infradead.org>
Date:   Tue, 31 Aug 2021 09:10:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831151125.2401-1-roger@norberthealth.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 8/31/21 8:11 AM, Roger Knecht wrote:
> This patch fixes a small typo in the CRC ITU-T polynom documentation.
> 
> The code comment says that the polynom is x^16 + x^12 + x^15 + 1, but the
> correct polynom is x^16 + x^12 + x^5 + 1.
> 
> Quote from page 2 in the ITU-T V.41 specification:
>    "2 Encoding and checking process
> 
>    The service bits and information bits, taken in conjunction, correspond
>    to the coefficients of a message polynomial having terms from x^(n-1)
>    (n = total number of bits in a block or sequence) down to x^16. This
>    polynomial is divided, modulo 2, by the generating polynomial
>    x^16 + x^12 + x^5 + 1. [...]"
> 
> Source: https://www.itu.int/rec/T-REC-V.41-198811-I/en)
> 
> The hex polynom 0x1021 and CRC code implementation are correct.
> 
> Signed-off-by: Roger Knecht <roger@norberthealth.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
> Changes:
>    - Changed comment from /** to /* (the comment is not a kernel doc comment)

Roger, in future patches, you should do more like this under the --- line:

---
v4: <describe changes from v3 to v4>

v3: <describe changes from v2 to v3>

v2: <describe changes from v1 to v2>

I.e., keep a history of the version changes, not just the last change.

> 
>   include/linux/crc-itu-t.h | 2 +-
>   lib/crc-itu-t.c           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/crc-itu-t.h b/include/linux/crc-itu-t.h
> index a4367051e192..2f991a427ade 100644
> --- a/include/linux/crc-itu-t.h
> +++ b/include/linux/crc-itu-t.h
> @@ -4,7 +4,7 @@
>    *
>    * Implements the standard CRC ITU-T V.41:
>    *   Width 16
> - *   Poly  0x1021 (x^16 + x^12 + x^15 + 1)
> + *   Poly  0x1021 (x^16 + x^12 + x^5 + 1)
>    *   Init  0
>    */
>   
> diff --git a/lib/crc-itu-t.c b/lib/crc-itu-t.c
> index 1974b355c148..1d26a1647da5 100644
> --- a/lib/crc-itu-t.c
> +++ b/lib/crc-itu-t.c
> @@ -7,7 +7,7 @@
>   #include <linux/module.h>
>   #include <linux/crc-itu-t.h>
>   
> -/** CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^15 + 1) */
> +/* CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^5 + 1) */
>   const u16 crc_itu_t_table[256] = {
>   	0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
>   	0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
> 

thanks.
-- 
~Randy

