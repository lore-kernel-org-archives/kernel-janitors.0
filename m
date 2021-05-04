Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E88C43461
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 May 2021 00:06:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 326CF610E6
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 May 2021 00:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhEDAGz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 May 2021 20:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhEDAGx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 May 2021 20:06:53 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC0AC061574
        for <kernel-janitors@vger.kernel.org>; Mon,  3 May 2021 17:05:58 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id k19so2675748pfu.5
        for <kernel-janitors@vger.kernel.org>; Mon, 03 May 2021 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jlwag/uSXI11ILOIN89++20RL6/tXX3LDSgQBRBdBOU=;
        b=ZQm8gFiW96TZMryAmLMnN0xnS/oS/3U8vLNnaJWFPJmfVBsGpLfYb8L0+IUNhSNr3+
         ADT08NYza76P++MU6x3/ETruXrriu4w82WIVNRjqN0KqB+aLcRoFwcmdV5Luvxnpf0sq
         bAT97oaVJ+cig/8tht9DwnLaDN+R8NGSEAcajrTBzwwNGB3v5mExK/xtHKPyED4S+/qf
         GLqufTBW8lMhq2xNoFvK4gaM0nf1Y3m/9jawWdlrxvLAl2zN2BBTl6JpBmwJb8g0xLyk
         wkQKh7RPkmiQ126PUUn55ZAmG0o6pje7F2BwAwTj6eNfipHUUomPiCmgZu2BG5bPGTdz
         oDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jlwag/uSXI11ILOIN89++20RL6/tXX3LDSgQBRBdBOU=;
        b=IhsQ1+JzkEk3aozVDCvQxDc1rJ6RIH+8KOda0ChSFHXcPOQvSBcnTe7gQdquMLjEzG
         hHsftLQCSNIwoQPU9NdrFDDTjXeD0870x/KgsbP0WoQWQ7Ea/VCwEs4KQyHWTmeUz4kD
         wD9c0ZlxtxTL5rjj22V7avhUGf4p2Mz6aG+PmDCwVPqBDTCHwE+4+/llX7AZdhvZYCAA
         1E8w+zTE2K/uuaGUjY4sTb80HlVimXrSVp58KnWXAfmZ4xkZ7u/6x7p92Pi3OvD+OK4C
         6k4WHy63cJK6J+ScKu9VXzQQ73ya3WT9xxxIeFezfy21bSFg4aPkM414VRyQXNsc+i5Q
         8YbA==
X-Gm-Message-State: AOAM530+bOUBFcc8xe4wWlTgt2mDPr4QzYo88gaYQ7g8oBvay8CDfluz
        6q+xtoR/oEotWEbq0dBzmWTxEQ==
X-Google-Smtp-Source: ABdhPJwZ+dFy8uvseVcLfYrjvph2vOhgI+bPnckBb9XnFgLOdOCwxUBjA0t+PHSHMR6Hn+tVwrQhPA==
X-Received: by 2002:a63:4648:: with SMTP id v8mr12263361pgk.34.1620086758143;
        Mon, 03 May 2021 17:05:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id f201sm10222879pfa.133.2021.05.03.17.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 17:05:57 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Qiheng Lin <linqiheng@huawei.com>
Cc:     Hulk Robot <hulkci@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()
Date:   Mon,  3 May 2021 17:05:54 -0700
Message-Id: <162008674673.40672.9817801757275466869.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210409110243.41-1-linqiheng@huawei.com>
References: <20210409110243.41-1-linqiheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Apr 2021 19:02:43 +0800, Qiheng Lin wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied, thanks!

[1/1] soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()
      commit: 4f2f0162a389196fb4092aee93ef4a89f96390be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
