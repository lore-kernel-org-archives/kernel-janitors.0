Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E819DC07545
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Oct 2023 12:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbjJXMLB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Oct 2023 08:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233892AbjJXMLA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Oct 2023 08:11:00 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEBF10C0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 05:10:56 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso30952785e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Oct 2023 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698149454; x=1698754254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0RWXQ0JSSHfw7ZxzgnmVrVbqR4LpPWoOYLUETidht14=;
        b=DXU1X5lQdJ0ZDhWmgePKdJTies3c5DI6VB4pkbWQMvqdbTlfPsKr9nq1kcj+K/hKgk
         L8MCfHBbiMFJ63cbpP6Dfm9xoV42Jhv0j+mfRQh+p2SZWxHJloqeJq66M2zvyD2RjGnS
         kWEOEJWVIqqyOu+/g5pgoj6oRmZYv40MMnmtD6JSt+Trsm8ykKQ4pGuhxaM//w+aXWyV
         9ZOR3DUF+pg9LPopuEO1PgoZNO5dEOGw8YWYUgqV7KPEl1ueeboD0pkevQz6+VhOO89W
         qHxxTOSwtN9rnBZ5sog+ndZ8bHTWHTv4XyB2y9OrBuq/ZcWZg/pU807jtjFmfOMv5+tR
         Yeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149454; x=1698754254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RWXQ0JSSHfw7ZxzgnmVrVbqR4LpPWoOYLUETidht14=;
        b=Sx/0QjOjbaK8nqJJcTmRE23icpnT9lTmRieiYYrdurHbaGFnAsuZKBubiTbRxhOC6T
         UQ2hBQelySzWwNbiO7Pa+pQh5JKpAHIPw8jKf46dC0zj9qYgaKPBiU+K0mFssfdGBpay
         /N2oHy8VO1kiBm/1AWJunTcqBOm5wsogtvheG3PSYvCGPvmNcLKg1bFJmaENJv0OF3y1
         zAG0tmjiE+kOz1p5WbjfN/IRQmeYg2m926Dbw500A7zyhM8xRATqaJtDjcFBpMhQWzI8
         9iq04+X45euWamTMyEvy9DQq7xeqGVkoRIqOJ77dg0Kbh7OYwzoMpTzEGPwg5KqJmhcG
         vA7A==
X-Gm-Message-State: AOJu0Yw9VC67DNdShVBXBW/gvpPnBacqWgbrb7Dkp9ry1gky96ZjS0Ft
        93kBiFLY+uPdO35Nfmvxm/qLPg==
X-Google-Smtp-Source: AGHT+IEZMo/ryAx2uGDjLwwW/S0iX9cqin8tD2S+ics6BazIuqX+KkId8mzq4IlvaqTZer+WelDNEQ==
X-Received: by 2002:a05:600c:4f94:b0:408:3e7a:82d8 with SMTP id n20-20020a05600c4f9400b004083e7a82d8mr11572709wmq.19.1698149454612;
        Tue, 24 Oct 2023 05:10:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c358c00b00401b242e2e6sm16766305wmq.47.2023.10.24.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 05:10:54 -0700 (PDT)
Date:   Tue, 24 Oct 2023 15:10:50 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dchickles@marvell.com, sburla@marvell.com, fmanlunas@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        veerasenareddy.burru@cavium.com, felix.manlunas@cavium.com,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net 2/2] liquidio: Simplify octeon_download_firmware()
Message-ID: <9a6d37de-14a4-483a-a515-ac30dbea4d4c@kadam.mountain>
References: <cover.1698007858.git.christophe.jaillet@wanadoo.fr>
 <0278c7dfbc23f78a2d85060369132782f8466090.1698007858.git.christophe.jaillet@wanadoo.fr>
 <f44e4fd716729f1f35ef58895b1acde53adb9b35.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f44e4fd716729f1f35ef58895b1acde53adb9b35.camel@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2023 at 01:11:13PM +0200, Paolo Abeni wrote:
> On Sun, 2023-10-22 at 22:59 +0200, Christophe JAILLET wrote:
> > In order to remove the usage of strncat(), write directly at the rigth
> > place in the 'h->bootcmd' array and check if the output is truncated.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > The goal is to potentially remove the strncat() function from the kernel.
> > Their are only few users and most of them use it wrongly.
> > 
> > This patch is compile tested only.
> 
> Then just switch to strlcat, would be less invasive.

Linus was just complaining about strl* functions.

https://lore.kernel.org/all/CAHk-=wj4BZei4JTiX9qsAwk8PEKnPrvkG5FU0i_HNkcDpy7NGQ@mail.gmail.com/

strlcat() does a strlen(src) so it's BROKEN BY DESIGN as Linus puts it.
The advantage of strlcat() is that it always puts a NUL terminator in
the dest buffer, but the disadvantage is that it introduces a read
overflow.

I would probably have written it like this:

diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_console.c b/drivers/net/ethernet/cavium/liquidio/octeon_console.c
index 67c3570f875f..ebe9f7694d8b 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_console.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_console.c
@@ -899,13 +899,16 @@ int octeon_download_firmware(struct octeon_device *oct, const u8 *data,
 	ret = snprintf(boottime, MAX_BOOTTIME_SIZE,
 		       " time_sec=%lld time_nsec=%ld",
 		       (s64)ts.tv_sec, ts.tv_nsec);
-	if ((sizeof(h->bootcmd) - strnlen(h->bootcmd, sizeof(h->bootcmd))) <
-		ret) {
+
+	len = strnlen(h->bootcmd, sizeof(h->bootcmd));
+	len += snprintf(h->bootcmd + len, sizeof(h->bootcmd) - len,
+		       " time_sec=%lld time_nsec=%ld",
+		       (s64)ts.tv_sec, ts.tv_nsec);
+	if (len >= sizeof(h->bootcmd)) {
+		h->bootcmd[orig] = '\0';
 		dev_err(&oct->pci_dev->dev, "Boot command buffer too small\n");
 		return -EINVAL;
 	}
-	strncat(h->bootcmd, boottime,
-		sizeof(h->bootcmd) - strnlen(h->bootcmd, sizeof(h->bootcmd)));
 
 	dev_info(&oct->pci_dev->dev, "Writing boot command: %s\n",
 		 h->bootcmd);

Don't involve the "ret" variable.  Just len +=.

In the original code, if there wasn't enough space they truncated it
before the " time_sec=%lld time_nsec=%ld" but keeping that behavior
seems needlessly complicated.  They already created one bug by
complicating stuff.

regards,
dan carpenter

