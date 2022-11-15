Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7101FC4332F
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiKONEH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:04:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKONEF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:04:05 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0060EB1ED
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:04:04 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id h186-20020a1c21c3000000b003cfe48519a6so62728wmh.0
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YLBUM3TohAaXtg4FI0ID6a0tm45gCoe+RT5Kz0xpNw=;
        b=GJvhfvEjnNwc61ZPeeg+YcBqzPKundSAiMKPvJVcNBxqdOESkbZm69BnoUT6329kKg
         4JDEJjzgpXCXyOKzh1rbpTkC0AJRP0lENqKZZzGEoFdJa4i8ZzHuiIY7rIExGQlDNEXt
         oh1KJEUpGgRq73xlC2uTedkoFbGdhuHZyp1U3NMZc5mOZZpvauifv0HVn78m8jRQfZZF
         mnEbNmM72gUKJcIFCADAYWeHVpEF3IejrjmeRtRBKoJ5MUWG9d8oUgqEQiTRkY3YWayh
         gJfG7ZHPyttX47WAYPy/rUKh0IVek8fzCxHZLX5rV/dPt10B0YPJ2/60xLJxzloRHxdO
         QY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YLBUM3TohAaXtg4FI0ID6a0tm45gCoe+RT5Kz0xpNw=;
        b=mbwNA3qOe+wsqOFrWKzO0dzV1DdtgbUNt8fMi93Enct3ZC6aRRPLz5zM7AxB0wsk47
         A0qhcMSvET9aqlvyksDAo0tgWBKjEwNjQiRkm2NMZd3rJIruS0+m9sg8FKnUu3dQ+6eO
         Bo64asWItPxnDt7yVsgP6W1RE3hDiBSefwfHzG0RaBRB4kiXyOac1kVkhKnpKJU2T6f0
         rEgnHEkIfhx7KKNdLOcs0s/FQDcF61Kigbc3PlOsOhnLpBAybUZknuQF9ZlahsWoXqHO
         v5W16cEPGPTOuGnx8+AdECSEoW0Mg0WDcO99JFiLq3Olu26kDhfMwwPNTZUmxJhvYF8H
         y0fw==
X-Gm-Message-State: ANoB5pm+Wbig08bAnLDQtAHBCFwEJV9HiYDL1xQEQPuHFQW/lYiCNJu+
        fdszhVcUwibrodLXBT4b2lk=
X-Google-Smtp-Source: AA0mqf7LjniTff68vLGL9vfdNCIZjGWUnXi6RGVYhotiOgf6Yi8mRVOO7S095ii7SxN1qHKrWft7fw==
X-Received: by 2002:a05:600c:6007:b0:3cf:681a:43e1 with SMTP id az7-20020a05600c600700b003cf681a43e1mr1379052wmb.126.1668517443507;
        Tue, 15 Nov 2022 05:04:03 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d540b000000b0022cdeba3f83sm12256385wrv.84.2022.11.15.05.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:04:03 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:03:59 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     elder@linaro.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Message-ID: <Y3OOP9dXK6oEydkf@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Alex Elder,

This is a semi-automatic email about new static checker warnings.

The patch 5cb76899fb47: "net: ipa: reduce arguments to 
ipa_table_init_add()" from Nov 2, 2022, leads to the following Smatch 
complaint:

    drivers/net/ipa/ipa_table.c:423 ipa_table_init_add()
    error: we previously assumed 'hash_mem' could be null (see line 414)

drivers/net/ipa/ipa_table.c
   413			count = mem->size / sizeof(__le64);
   414			hash_count = hash_mem && hash_mem->size / sizeof(__le64);
                                     ^^^^^^^^
The patch adds checks for NULL.

   415		}
   416		size = count * sizeof(__le64);
   417		hash_size = hash_count * sizeof(__le64);
   418	
   419		addr = ipa_table_addr(ipa, filter, count);
   420		hash_addr = ipa_table_addr(ipa, filter, hash_count);
   421	
   422		ipa_cmd_table_init_add(trans, opcode, size, mem->offset, addr,
   423				       hash_size, hash_mem->offset, hash_addr);
                                                  ^^^^^^^^^^^^^^^^
Unchecked dereference.

   424		if (!filter)
   425			return;

regards,
dan carpenter
