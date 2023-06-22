Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E46CEB64DB
	for <kernel-janitors@archiver.kernel.org>; Thu, 22 Jun 2023 11:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFVLyR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 22 Jun 2023 07:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjFVLyP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Jun 2023 07:54:15 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FC3171C
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 04:54:14 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-312863a983fso2176555f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Jun 2023 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687434852; x=1690026852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEDzw9W907hEJwOxTJsGWFRFwCq3nRuMhD+n/fKGN60=;
        b=tK0/+K+m7/3eGhBv23aqBH5Gs2tZsqkyup99w+atiRRAqfT1ZbcbNIfmNz2yyQgh0W
         Rsj7HCR9tf2kbkvLlN4JX6KsZw7zVPNuG+By3hvLRWsWjzCjl5h3sk091vuxmFZUXVRH
         puBRfu0R1iMZqK9fW6MEm+OOkQ/PvqbMtcztaw0yThqtd5NDJa7lWMo54P8E2RS6XY0N
         S/0d9bwhNU79TcNwR/+jdiHDVXpHmI+DSbfjdbf0Ixu3cK0vZnnI2atq3Wjh1eOSQw/5
         7iGMeI3lQD6lBXGVu99OAr5OV+HmAr4b6LGufZh1LrCdtLnOdob9Nk5Dz3SySVjiEHza
         I19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687434852; x=1690026852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEDzw9W907hEJwOxTJsGWFRFwCq3nRuMhD+n/fKGN60=;
        b=dvHW7IB1buLeFrYOFTJN8V+ZuLyGHNKRksEcjNnmxhxFc2B5i1qWTa/AgBW8wNy/uC
         fpJWZjjnam1iy4gr+PJOgh8FjqDgz3/ISFW5duuatmtE+k6IuLLyGxTh1Pu73+nO9jCX
         wcx1G7AGClF4bUpe7O03d8LB0WfRyplgZrKQjBcUsjHZLhmn8kbKVOik2fclWgw+Gtcr
         wJFS9g5qoDePHX/ZR0ikqz6Kryb6f/OVO3B7uw0oP2sKR7y9f5apWoLR6yY6+tjd64lh
         YgML0AnULv+GGgrY5iabryG5C3dADpzlSNn7W9TTD8rlU1CkuSHuWljZIBVF6xiiwew9
         k4Pg==
X-Gm-Message-State: AC+VfDyYfpU5QT40BMB7Mti2LNLrMUbVCy6pGOcBKy/XiT56biXhhQD1
        4sNWyykAgMKG857STb88kwqpYg==
X-Google-Smtp-Source: ACHHUZ70D+J1QTacDXVqJOA4np0FJzeoEIPAcFhEXdbIZuDpiUcntI3PDgpYZPBt69zEoGYZZ+6soQ==
X-Received: by 2002:a5d:5342:0:b0:30a:c2c4:7133 with SMTP id t2-20020a5d5342000000b0030ac2c47133mr13950349wrv.49.1687434852543;
        Thu, 22 Jun 2023 04:54:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x14-20020adfec0e000000b0030aee3da084sm6870368wrn.49.2023.06.22.04.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:54:10 -0700 (PDT)
Date:   Thu, 22 Jun 2023 14:54:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Cc:     Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Carl Vanderlip <quic_carlv@quicinc.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <1bf6a1b7-387c-4b39-a7b1-baa8eab7c1c2@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <95ed2c6b-df33-a252-8eba-3cb848c5c40b@quicinc.com>
 <225a7da6-f0fc-41d1-8bbc-6247a4733731@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <225a7da6-f0fc-41d1-8bbc-6247a4733731@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 22, 2023 at 02:43:57PM +0300, Dan Carpenter wrote:
> > > -	if (!user_msg->count) {
> > > +	if (!user_msg->count ||
> > > +	    user_msg->len < sizeof(*trans_hdr)) {
> > Can we have something like this here
> > user_msg->len < sizeof(*trans_hdr) * user_msg->count, no?
> 
> This check was just to ensure that we have space for one header so that
> the "user_msg->len - sizeof(*trans_hdr)" subtraction doesn't overflow.
> We're going to need to check that we have space for each header later
> anyway.  Can the multiply fail (on 32bit)?

s/fail/integer overflow/.  Obviously failure is not an option when it
comes to multiplies.

regards,
dan carpenter

