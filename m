Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2AFC47088
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Dec 2022 17:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbiLBRW0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Dec 2022 12:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234199AbiLBRWM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Dec 2022 12:22:12 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C8EEC812
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Dec 2022 09:22:03 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id f9so4894980pgf.7
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Dec 2022 09:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAc9Ui5FDUiek1r3Ck1fS7WTbV+aLgSqwss523muYTk=;
        b=Hesf4Q5brm36uJX3MEKcbGHrBL3g6VJA4t6P1O4r21kyQ+SXDRhZoqBvQAszLuC4az
         1AyHP6c6OrwskWd44Vpqp8dBDzowKxdJHuoV4a6EviwOXax84doqhj+TH6WQjMSNjDfJ
         4E0wk3E2LEXYUvYjnhKN9yHVCPd9TT3Bv6OkbES3PPIHEPhHD2GAR2Ituic7qtcNCPBv
         wAMaRX33IGTJSxTTc9sDJv/frwj7Y91TR1GyRMjhbFONoRofpSJDgnn/hIcmXntNOrx0
         w/N1FJlZ5tm9vbPmXYVg/u8o6iNfmatY+lN0LgpprUnqJpuQJkhUOtXICTGDU9dL1R7M
         Mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAc9Ui5FDUiek1r3Ck1fS7WTbV+aLgSqwss523muYTk=;
        b=u91gPPTOJuYP+l+xTphDmESVv+VqVrXyyRWpZ0uUAK+BiyGFU55a5B3FSxvPIYuIjC
         jo0FDKdfVe5EdJbvrCxn/nJ+M5Bm+jwNddYuPk5ZqzO/Dom4YKql5GAgK/+x3wmiAlJO
         yYrWHMj/6G7h4+eAJ3slM5g+iASeyBoypT5sfBSyLQkAazTvnzFQFz2bo+V5vHwiEdX8
         VOlFuYJzJCT6Cjm5ZtJben23pfr7VQmYdKsojuc1CFJcSyQePSz3kRhw+COs+v3hIKhu
         1aawcoayjThPpILBNOQXKtd/QApFQwVoItv5izYf4rGo9pQV/Ac4nVEbHrA4OAxmimWA
         3fcg==
X-Gm-Message-State: ANoB5pndBmHi7MgtRTLZ468I7Cc81rSk0xwV7ReX1V2VaJOdCI2MHqrb
        oTzyyFWCVPJ0Vx5asjc/wkfGEw==
X-Google-Smtp-Source: AA0mqf5m4zXkdiVg7X1oUF/in3uAi1adGUciP0lbBTNgQCH9BYJcAzGmMa6mLTtbviUw1JXWglFLJA==
X-Received: by 2002:a05:6a00:414e:b0:575:7968:f546 with SMTP id bv14-20020a056a00414e00b005757968f546mr18387843pfb.30.1670001723093;
        Fri, 02 Dec 2022 09:22:03 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090a384400b00212c27abcaesm6898955pjf.17.2022.12.02.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:22:02 -0800 (PST)
Date:   Fri, 2 Dec 2022 17:21:58 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake
 "probabalistic" -> "probabilistic"
Message-ID: <Y4o0Nq4SKGZgDOxi@google.com>
References: <20221201091354.1613652-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221201091354.1613652-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Dec 01, 2022, Colin Ian King wrote:
> There is a spelling mistake in some help text. Fix it.

I assume you have a script/tool of some form to do spell checking?  If so, can
you point me at it?  I'd love to incorporate something like that into my workflow.

Thanks!

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
