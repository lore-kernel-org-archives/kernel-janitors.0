Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9769CC433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Sep 2021 11:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69A5360F45
	for <kernel-janitors@archiver.kernel.org>; Sun, 26 Sep 2021 11:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhIZLyD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 26 Sep 2021 07:54:03 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:35460
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230200AbhIZLyD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Sep 2021 07:54:03 -0400
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net [80.193.200.194])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 3826341303;
        Sun, 26 Sep 2021 11:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632657145;
        bh=IMS6p4w3HfwwfUyNxMcrk3j+8VMR0AkFPHuC20oOeFU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=kEpgFoYDcpUsOMQPw2nct9Bzso2RY2yB9XFghuWvdxTwd2MPB9pvVmEkioR1a0UNz
         GApzRIuqTe0CjJCaqH7K5E28Dfebn8bcFC/C18cwGrElZ48RElbXdqCnXLbqgGaE6y
         2WOCPYQxDoFPAAKXNGi2XdUNF6CvvER5wpEi6VfjhRYMkDWVDBfaeQB5IKXLHwzhYE
         Ph2JCVva6l0O5v/rbzRcRYdS2p+VdWfMcU+bISgMnsIN1c+W3cgSt/oNdQI38hLlNu
         zp2Cg+ottFZSLe9WIzMvmTV+NGUJPIJJaIpMKLgLlywO3S3vDydkXl32EeTTbFOy6b
         s7Sj1GkkfC2zA==
Subject: Re: scripts/spelling.txt: Fix "mistake" version of "synchronization"
To:     Sven Eckelmann <sven@narfation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210926065529.6880-1-sven@narfation.org>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <a2639281-e8ec-92eb-13af-02a1925c25cd@canonical.com>
Date:   Sun, 26 Sep 2021 12:52:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210926065529.6880-1-sven@narfation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 26/09/2021 07:55, Sven Eckelmann wrote:
> If both "mistake" version and "correction" version are the same, a warning
> message is created by checkpatch which is impossible to fix. But it was
> noticed that Colan Ian King created a commit e6c0a0889b80 ("ALSA: aloop:
> Fix spelling mistake "synchronization" -> "synchronization"") which
> suggests that this spelling mistake was fixed by replacing the word
> "synchronization" with itself. But the actual diff shows that the mistake
> in the code was "sychronization". It is rather likely that the "mistake"
> in spelling.txt should have been the latter.
> 
> Fixes: 2e74c9433ba8 ("scripts/spelling.txt: add more spellings to spelling.txt")
> Signed-off-by: Sven Eckelmann <sven@narfation.org>

Good catch. My bad.

Reviewed-by: Colin Ian King <colin.king@canonical.com>

> ---
> This was already reported last week in https://lore.kernel.org/all/1930750.yhyOXdeGKK@sven-l14/
> 
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index fd8f07317b8e1c572e1e0f6bb4f9e01dff96c17c..acf6ea71129921ad77a201d13761382ee032483e 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -1450,7 +1450,7 @@ syfs||sysfs
>  symetric||symmetric
>  synax||syntax
>  synchonized||synchronized
> -synchronization||synchronization
> +sychronization||synchronization
>  synchronuously||synchronously
>  syncronize||synchronize
>  syncronized||synchronized
> 

