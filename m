Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73BEC0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbjGKGWk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231403AbjGKGWh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:22:37 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4FCE73
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:22:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso38171775e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689056552; x=1691648552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zU1H95+JdGa0jLKaOOBSIowzO/e5Eobe9bWmmv0ie58=;
        b=mCwwQh58+I6Vg1tWHZXgWb1BDWqLVOuhY7rprGezPQXcAgvpFycJaGnvK3NGUWCDoQ
         ytVTghV/qznmFMwVx/3zgIC4ZtTlEWb5AiKLLYfsGCFtw/uVArS8+KwWxEO9LzB0Jd4d
         1xOYUT6To1Iji9qHRike1ZnsHJEKWSbFeJtektcZm+KopE0l5cn3Uw6MaXkaKoTlJ3v0
         LQFN6V8PKLvhM4hXioTtZKXyvFdGzEPmqutoSPSoL7Ka47h+LhowR1+E/NI80O/zcYSA
         9hBvHtgT+ekDu22Zgpc0LYkr7w2KrJThweBfgsLRRbDZkc3xZmFAwFnQxyCNqHHoZxiC
         oUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056552; x=1691648552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zU1H95+JdGa0jLKaOOBSIowzO/e5Eobe9bWmmv0ie58=;
        b=G0Ld1AE/mC4WfKY857eI2SSrZdaT71IEB/Fd1U4F38C9BsXN/bemV/8Kf+mUghz1qM
         SCqPGNgcHgnlV9BhGhnfiwIgc9gFsl0yoa5FzUgU18xnAwZ25qfBWnl3SwdLpqzovM0F
         SfLEpCxZvjKrv3SKlhsfTckI23VQYfFmAZSNZ7uKlPxdpYU3ZkVaQKjycI9JZ2PEPCTr
         pKLpSRwF5HzYFD88bkquvLdFR79suo4YX5y34Fh0XuP42Es4sCpJlAEvSiYTQ2Hzm2vC
         pzobS8rLocEX1r7o4zd7YO4DCwnij7CVBLrErU/77TgJ+gwnp7TyIT6Ian/YmMb0rwuL
         2O9A==
X-Gm-Message-State: ABy/qLbn87f3TCh4v//xQ//jsEj89c4ohJlHLT7Fy3r0EuvMIYf2zwuP
        D0Pm6W9N2pLd4mq8QtY1hkeMJw==
X-Google-Smtp-Source: APBJJlGHAqGinu5QiM0MBt8JJ7Qkz0GLqDgkZt5uCZPsLKj+wgA2Y0+e1RzUBir6Dr0MAbYmFbvaBw==
X-Received: by 2002:a1c:770b:0:b0:3f7:c92:57a0 with SMTP id t11-20020a1c770b000000b003f70c9257a0mr13580551wmi.14.1689056552667;
        Mon, 10 Jul 2023 23:22:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s21-20020a7bc395000000b003fbc89af035sm1566982wmj.17.2023.07.10.23.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:22:31 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:20:17 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5 v3] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <a40baccf-2b9f-4a20-a353-8e470fc5b45c@kadam.mountain>
References: <ZKzx5nA6Z/0yhBJj@moroto>
 <ZKzyXx0z1gWDDJII@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzyXx0z1gWDDJII@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

NAK.

Wow.  I really screwed this up.  I didn't mean to send this patch.  I
have a correct patch still sitting in my postponed messages.

I will send v4 in twenty minutes.

regards,
dan carpenter

