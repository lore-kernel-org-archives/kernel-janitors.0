Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA48E748ED
	for <kernel-janitors@archiver.kernel.org>; Sun,  1 Oct 2023 06:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjJAGnw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 1 Oct 2023 02:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234366AbjJAGnv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 1 Oct 2023 02:43:51 -0400
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131039F
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Sep 2023 23:43:49 -0700 (PDT)
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
        by cmsmtp with ESMTP
        id mKShqzVLMnGhUmqBAqYrby; Sun, 01 Oct 2023 06:43:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id mqB9qu8YlXQGamqB9qtI48; Sun, 01 Oct 2023 06:43:48 +0000
X-Authority-Analysis: v=2.4 cv=DJGcXgBb c=1 sm=1 tr=0 ts=65191524
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=P7XfKmiOJ4/qXqHZrN7ymg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZuglWOHeRktdc1SI7fZMrBNHt7pae0GyCoYbfoLsddc=; b=GFdvOHVqx5Ih/kinRsGsl14I4H
        XwgD7x624J2I2bdWybbFp0blj7IipDqTb2ve8qeM1Zr6SStvdA1RDj4fLKTA+gu+Px53PQkTEfhPA
        F8Tdj5L0w+fk1NcqtKULEGRfDKe/H/V3lDCCDS81uwTDIVSeCIwuGj/Rr51EDxyHU4mQoTYnjRS7z
        Een0yBKUVeStFKGXsILzuV55OhL0zibUcfe4sRvsi54GMD5jthFMPrKwLdJY4gHBpPRkyP8SvuaFJ
        ZOO2FqckXRE0UWVQngqNNafYK6Jhr8b7I5R4gQhhYBNf/529jWdDw2iPKECUyLMULWp7JFPZM4X6r
        KLmBhQDg==;
Received: from [94.239.20.48] (port=48958 helo=[192.168.1.98])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qmqB8-001P7H-25;
        Sun, 01 Oct 2023 01:43:46 -0500
Message-ID: <935d0577-4a6a-eb84-6ae0-f1efa4352b5b@embeddedor.com>
Date:   Sun, 1 Oct 2023 08:43:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] comedi: Annotate struct comedi_lrange with __counted_by
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-hardening@vger.kernel.org, llvm@lists.linux.dev
References: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <5c3b7459b820e22e2ac6ce892d4aadcc119cc919.1696065263.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 94.239.20.48
X-Source-L: No
X-Exim-ID: 1qmqB8-001P7H-25
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.98]) [94.239.20.48]:48958
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 73
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJFV2cqjgMJD5PCiHUWDT7QqS3mzAXQhdKJNWPeXX3n1wf7bSBidWIRoTm1LT4UZPpu646MhNfCHoHhWX4hOJVZ+mK7EH3qfjrwen9ty/efWDi5AbVDZ
 Z4k5bwgU+SdGM7eMK9v45vzUU/bswXaOMJMStauzTry2F9+cYzpMJbKDoxwPP+T6lGCq6ZgBdTPG2r4zmrueaewWd9sYEA66lPsZmvPaQIqkf0bB3qScOBpd
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 9/30/23 11:14, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].
> 
> In this case, it is been spotted because of comedi_alloc_spriv().
> All other usages of struct comedi_lrange seem to be static definition of
> the structure that explicitly set the .length field.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>   include/linux/comedi/comedidev.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/comedi/comedidev.h b/include/linux/comedi/comedidev.h
> index 0a1150900ef3..c08416a7364b 100644
> --- a/include/linux/comedi/comedidev.h
> +++ b/include/linux/comedi/comedidev.h
> @@ -633,7 +633,7 @@ extern const struct comedi_lrange range_unknown;
>    */
>   struct comedi_lrange {
>   	int length;
> -	struct comedi_krange range[];
> +	struct comedi_krange range[] __counted_by(length);
>   };
>   
>   /**
