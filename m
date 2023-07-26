Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E09C001DC
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 06:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231815AbjGZGDP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 02:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjGZGDM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 02:03:12 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8F5170D
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 23:03:10 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fd18b1d924so52072705e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Jul 2023 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690351388; x=1690956188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a7DlYDzASdtB1auF6MGXd712hY08PNEA8Sc8ogncFWE=;
        b=uygFj9vzXO/Dt/eBXzd/8ASkC2IBDZvl2C96A/iVjWASbQz3lN7c6SFRBX4d6B1Oj5
         qG0rT5uSzi+RC4e2bRHJWpwgJr8eCkqwF2+wJpvsYxvSvw1eGrKsO8q0XGBV/MD1T1Fl
         PKzpgOSdIeCmRQL9BWn+6DY28yr1r/t+xl2KvJZUjtbugk6RL8k2hClysps3vXTY3jOi
         chyh/qI/Z3/igWnNEKOnaBsUCSOU2XTqgglTkkGLUutf6H3t3NV7h3GD82kgryQM0/eN
         jCbwDkE8tIAdvUciXj2myf8t1FHMT8ym3m3fvotfMGHvr5vZdDXmcXYkg3jutSjJFTA/
         y9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690351388; x=1690956188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7DlYDzASdtB1auF6MGXd712hY08PNEA8Sc8ogncFWE=;
        b=MGMdRKHtvzrVeoFkoAAUDAHUUmoK4NxrLii1FbH/2+L2OyfNAvLmJ4TY0Io0ElsEKz
         Vq5aZuNg6N3qNFSwb4AI74PSzLzBsJuezW3X1OeNy+NVhyAv+PxmBeKS0yik+nKWmaPF
         OGlIwZ5X2wZsFgz7fHp5yfgh0qNEKX3c+JBcKlUVtoaCVUS7hCVVEZKUk+Yf3/vThbpH
         sNgGW6DJIHumlgon88fT8Jin7A4hpyt+X+fdgy1bNm1O2PXnvQBVbBPq5Q6qF1HqVt2n
         6wFkYQ9964pT92onJRDtq6XkiKNWvMz3F+Mgg5h8l+6/Hw12KsSrYHS04jRqKeBrBrJa
         MqrQ==
X-Gm-Message-State: ABy/qLaB49XvcvoojGql8tIcHoD75mJc1VHvb0MQMmElrKMmzEFVCgSB
        kkRG4F+5wimeAYWCr4LPHbvUhA==
X-Google-Smtp-Source: APBJJlFvo7VsS/C63g22gwEOfDJ6YOIq9GHt7yP68E/2suA/U58tj3MYmTlNyJew1cBo1cvwNpe5EQ==
X-Received: by 2002:a7b:c394:0:b0:3fb:a62d:1992 with SMTP id s20-20020a7bc394000000b003fba62d1992mr570581wmj.0.1690351388549;
        Tue, 25 Jul 2023 23:03:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c231100b003fc0062f0f8sm1031520wmo.9.2023.07.25.23.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 23:03:08 -0700 (PDT)
Date:   Wed, 26 Jul 2023 09:03:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Baoquan He <bhe@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Vivek Goyal <vgoyal@redhat.com>, akpm@linux-foundation.org,
        Dave Young <dyoung@redhat.com>, kexec@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] proc/vmcore: fix signedness bug in read_from_oldmem()
Message-ID: <c770613e-1f11-4bff-bc5f-9bc6f07a4da5@kadam.mountain>
References: <b55f7eed-1c65-4adc-95d1-6c7c65a54a6e@moroto.mountain>
 <ZMC1jU7ywPGt1QmO@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZMC1jU7ywPGt1QmO@MiWiFi-R3L-srv>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 26, 2023 at 01:56:29PM +0800, Baoquan He wrote:
> 
> Thanks for this fix. Just curious, this is found out by code exploring,
> or any breaking?

It's from static analysis, looking at when error codes are type promoted
to unsigned.  I pushed the Smatch check for this yesterday.

https://github.com/error27/smatch/commit/a2e6ca07e2ef83a72c9ffa3508af1398a6ecc7ed

regards,
dan carpenter

