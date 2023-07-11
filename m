Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C81C0015E
	for <kernel-janitors@archiver.kernel.org>; Tue, 11 Jul 2023 06:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjGKGIM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 11 Jul 2023 02:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231384AbjGKGII (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 11 Jul 2023 02:08:08 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 629D71BC
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:08:03 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso66394835e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 23:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689055681; x=1691647681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
        b=FsgY1ZT2rRl+7zR2oyCxnQKtF8FkyOuc3KiCGv+HxNmd9b8YJvv2nR3YdABt+GQXDm
         D6fkbZrTxLjPduhuM8/J10pt74OBHR29awp2zygJtnpWbjRWKq9NbsEunWfEKTxqO/vl
         0CH1DVov289fSxjVCsqS2fCo9srbIGc08/f3lmE9uEmew89VBl0SRqspVYa3/Uj69l9S
         yUC7TX/sb2K11xvQMgXWutueqg1OAtvgZGhifykhwgaqoDfnH+AHMPxDsKNXn8Tl60K9
         L5ZGe7+P2n/sHO9J749RASjwdD5FVzlEfWb6cPbAjv/zxg8bmUn5nvoZXYVO0DFJl4PZ
         sEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689055681; x=1691647681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylMkhP5iApXqUlg2Qp54MKEXiwYX+p46Gaz2A+cIsD0=;
        b=Z4SUqCmozGysaYWlvSja0UmOf2sGvngNZzBxYQSZhwpJPoIKTZ5kVjIAye7w6CgwbX
         32dDIads2TaF1RsjmOMi54epK+PBD4xNxd6lsXb6BQtdW2K66X5QW5wl7in8C8jdK15R
         5OHIPuwc85ZWAlVSXVln8LAE9l3oCoZlJL1KOarwkf7rFMIAY4++DIr1NMjeGdpmVpW6
         S0u87QxMEEtouod7F7KgNICN1BOxcbU6gQpoMuKNvUX2FMffXUtLtIYU1xxw8cFXN5PR
         6RddEm8S4JIzjBsJH94Cp9bvjfvYQrehsNeOiVbMhMnal7Xd/ufXfRYJOnFpcJktLk4U
         +hHA==
X-Gm-Message-State: ABy/qLYFpscnwFS+CFqXV3da6iH594Psf2z83Rkut0+r1aj9h4gTaiZd
        kTFy1XdSDOdqoicrEEcGalTXOQ==
X-Google-Smtp-Source: APBJJlEu3vGunYmloCnFe4G0ic4Cf6SKC/3Yc++PBYxfbIesl5w5Avpv1N3JTMG4cUKE8qkhSw6F+g==
X-Received: by 2002:a1c:6a04:0:b0:3fb:b9b7:fb0c with SMTP id f4-20020a1c6a04000000b003fbb9b7fb0cmr18270975wmc.31.1689055681338;
        Mon, 10 Jul 2023 23:08:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u9-20020a7bc049000000b003fbc681c8d1sm12043925wmc.36.2023.07.10.23.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 23:07:58 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:07:56 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     Carl Vanderlip <quic_carlv@quicinc.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <627f10fc-6f09-44ab-9c2e-f5615a86f080@kadam.mountain>
References: <ZKzxP8iX8Op0lYvh@moroto>
 <ZKzxXhtwqYvoat8B@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKzxXhtwqYvoat8B@moroto>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Oops.  Left the v2 out of the subject.

Let me start this whole thread over...

regards,
dan carpenter

