Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A668C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 17:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiKORAy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 12:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiKORAy (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 12:00:54 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82B229352
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 09:00:52 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k8so25380366wrh.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 09:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPRgvt9AAXJ449dP5YtG8uP37gNv4qzjZNmNIh2JLQM=;
        b=yJyeutFR4YKujp9aKtmpnnCxOoMhxQK1X8Pja68n4uYtT9R93ZvBaKWGtG+KLIioVU
         cgldku4ljqU7cOPJTeWPGTYZeLanNnH6x8iuM4xKJKuUacLteH8ckb+mQcd1a6/9gVsn
         oIYDc/RcomCxIxbVlKTbjc5/fN4kS+avUUOZFpSEk01mwKHQS0zFjQqil29ylro0lb4G
         IdR+ncc03O8JGcB8vZbVSZb6Z8UyAWp1gCcKLqYYYDwe0YkmvO1VPoDtffnLUEmm5gF3
         Onul5XNyXsujUmTlx8q4Tklh9WXM1b8D8jLYZLZAJsyvfPshxQsxN1F22atXr0sm2AXu
         AfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPRgvt9AAXJ449dP5YtG8uP37gNv4qzjZNmNIh2JLQM=;
        b=AReVnlLVEMD0KZkHmhrbWWa/zIuspIMsSfhTv/i4iChxNZVjuhpCLi0nATQ4IeR8D+
         zEns/Y64eIyGVqV73JlGktBqt1O/uXRGtBVmzCpTMK+GuNWDSAKWRhNRZbCfI9tsffkE
         Qt1JzJi4uuBLp9T1waDBFLealFYs1s2ojbPisv/bRFgxUkWTOILeCc40CuxFgqUvdpFg
         IRjv0lAb85/HZMlNMHymdViIGb9Hd5pUtah/iVX3IA7IQ+KWJuTLOCshxrDclmzes6SZ
         +pBZasNKquQ62eY2MEfgAlOv7+/F7ULbTnJKd5KRArcymjzWn+5N6MV80FdaLJQf7LYp
         Mszw==
X-Gm-Message-State: ANoB5pkBz9vxuqaLAVJbsSOo2h7/89UnQB6+iYmWXMFGvC7OViB+QN6a
        zzJTmv+7FWfnuwO+6GdphJZ3Rg==
X-Google-Smtp-Source: AA0mqf7zP9fXrz7lXptSa0O4semop/KzRAf5HvBf7gwI8X3Epa0qQh1MOZc11W0XRPgEXXo3YfxMIw==
X-Received: by 2002:a5d:5409:0:b0:236:5ea4:68d2 with SMTP id g9-20020a5d5409000000b002365ea468d2mr12006912wrv.671.1668531651306;
        Tue, 15 Nov 2022 09:00:51 -0800 (PST)
Received: from [10.211.55.3] ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b003a3170a7af9sm17748376wms.4.2022.11.15.09.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 09:00:50 -0800 (PST)
Message-ID: <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org>
Date:   Tue, 15 Nov 2022 11:00:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
To:     Dan Carpenter <error27@gmail.com>, elder@linaro.org
Cc:     kernel-janitors@vger.kernel.org
References: <Y3OOP9dXK6oEydkf@kili>
Content-Language: en-US
From:   Alex Elder <alex.elder@linaro.org>
In-Reply-To: <Y3OOP9dXK6oEydkf@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/15/22 07:03, Dan Carpenter wrote:
> Hello Alex Elder,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 5cb76899fb47: "net: ipa: reduce arguments to
> ipa_table_init_add()" from Nov 2, 2022, leads to the following Smatch
> complaint:
> 
>      drivers/net/ipa/ipa_table.c:423 ipa_table_init_add()
>      error: we previously assumed 'hash_mem' could be null (see line 414)

This is a nice catch.  It turns out that the issue pointed out
is not a problem in practice.  The 8 possible memory regions
that could be used are (currently) always defined, so both mem
and hash_mem will be non-null.  Nevertheless Smatch identifies
a real problem with the code in this function, and I will fix
that.

IN ADDITION...  This report forced me to examine this patch once
more, and I now see a different bug from what was reported,
which I'll point out below.

I intend to fix both problems with one patch.

> 
> drivers/net/ipa/ipa_table.c
>     413			count = mem->size / sizeof(__le64);
>     414			hash_count = hash_mem && hash_mem->size / sizeof(__le64);

Line 414 is wrong.  It should be:
     hash_count = hash_mem ? hash_mem->size / sizeof(__le64) : 0;

As it is now, the count will be 1 or 0, and it should be the
number of entries that fit in the region (or 0 if hash_mem is
a null pointer).

I did test this during development and verified the counts were
correct, HOWEVER I must have tested this on a system that did
not support hashed tables (IPA v4.2).  I'm very happy for this
Smatch report.

					-Alex

>                                       ^^^^^^^^
> The patch adds checks for NULL.
> 
>     415		}
>     416		size = count * sizeof(__le64);
>     417		hash_size = hash_count * sizeof(__le64);
>     418	
>     419		addr = ipa_table_addr(ipa, filter, count);
>     420		hash_addr = ipa_table_addr(ipa, filter, hash_count);
>     421	
>     422		ipa_cmd_table_init_add(trans, opcode, size, mem->offset, addr,
>     423				       hash_size, hash_mem->offset, hash_addr);
>                                                    ^^^^^^^^^^^^^^^^
> Unchecked dereference.
> 
>     424		if (!filter)
>     425			return;
> 
> regards,
> dan carpenter

