Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A794EB64DD
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 05:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbjF0Fcr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 01:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjF0Fcq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 01:32:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41115173B
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:32:44 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fa94ea1caaso16626065e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 22:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687843962; x=1690435962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooF2+9s/dYxk4t4QZ6dr9+cLdLfWELP5XjTCQq5ybIM=;
        b=iPNim+rvo2A1bn4dMUpbF1e0wz6EHmQxUGg3fxS/+RmnfHG3J5BVlUWPudJHtH2vP8
         YjqFyw/UGGt17s8u9TU6IQq+4HFYI8r7SpVepLLM6d6YG52UjNvRTbzcVS2qqSO/bvoO
         kIzZ7bdb6MFPTOU2pgG3yd7iuvPxsPb6+zzjYIpoRDyrASAGY+jKEVnnnOzw76GM0/ch
         Dtjy7JhZd8qqO/3fS5uJ3uDAxkmyI/nNc7aOg12onfRM6yluoX3USBNrkmwxUsGEaLxU
         b9/6zfoWKBsZMdvTrB3nXg8UNo7575e2HYb4IY2h9B47hfUhESpgAA6/DmUh/Ti7xu6Y
         rahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687843962; x=1690435962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooF2+9s/dYxk4t4QZ6dr9+cLdLfWELP5XjTCQq5ybIM=;
        b=VAH30hymhSFO9exVEhO5OtZs4fVMg+Vh4r5Wo5itsB2I2C87zoQyllkRFQr3u8HB4A
         WHw8R/0/fXb61PuzVfj4nsO4sQbsHzoYG4da2mZ+dOb1osYBrHmq8TdzHzXNNilYm1Ns
         3anq2CtZgkwq5BcugE1+uA2KMtZO3n9VZpMGIAg9KgU7lwaiIN0njEbpAGG7PHmG5Zin
         sc8KZbyv6NBzJgKD3nlcP5/t8KwpKjRXugoHW9xzelgQeFeE0fIMhBbiWr42y6iqchvZ
         J0Tch1B+yZkrsdg7IQCYdO6N1z5PVtifUhDm5wvin3NKisOj/Vs+Q2vE1+x/P+qXm4sT
         EuFQ==
X-Gm-Message-State: AC+VfDy8oggGmbziQnqku5BgtfxEyJwEU3qETmv2608vllXrt4ov241S
        Vz0edc6BrG/OEf0dXUaL0JI8CA==
X-Google-Smtp-Source: ACHHUZ7/KMGanhWpS4V6XigbARqv+ptaFhhnRebXUfv/XgANDJmcyk+nRrK/8gABHNSsbrCfv0MRJg==
X-Received: by 2002:a05:600c:3657:b0:3f6:8ba:6ea2 with SMTP id y23-20020a05600c365700b003f608ba6ea2mr28557361wmq.15.1687843962270;
        Mon, 26 Jun 2023 22:32:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x26-20020a1c7c1a000000b003fa740ef99esm9405573wmc.45.2023.06.26.22.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:32:39 -0700 (PDT)
Date:   Tue, 27 Jun 2023 08:32:36 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ian Rogers <irogers@google.com>
Cc:     Sasha Levin <sashal@kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        linux-perf-users@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Adrian Hunter <adrian.hunter@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Subject: Re: [PATCH v2] perf unwind: Fix map reference counts
Message-ID: <a9732501-3eff-4b94-a9b2-53e5e5e5be1d@kadam.mountain>
References: <20230623043107.4077510-1-irogers@google.com>
 <64741e8e-e81a-afb9-9ce3-9c2d6baab44a@web.de>
 <CAP-5=fVwhiGJEqTST2bfX8cUALpnTxELSHrvKtyJEPjqQjOacQ@mail.gmail.com>
 <35569055-0873-4d5d-8c9c-78c818e9aa26@moroto.mountain>
 <CAP-5=fWDnLDox3apMmvXmzVurFA=+sj7SEOOD7_2fam2VrGokA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fWDnLDox3apMmvXmzVurFA=+sj7SEOOD7_2fam2VrGokA@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ah, great.  Thanks, Ian.

The Reference Count Checking page is good information.  There is a bunch
of interest in doing better QC so this stuff is good to know.

So in this case, it's probably difficult to assign a Fixes tag and that's
fine.  Whatever.  But I'm not a huge fan of the "Leave off the Fixes tag"
approach to preventing backports.  There should be a better system for
that.  Maybe there should be a tag for that?  Or possibly that's too
complicated...  I'm not sure.

Anyway, let's leave it for now.  If it's really a problem then we'll run
into it again later and we can think about it at that point.

regards,
dan carpenter
