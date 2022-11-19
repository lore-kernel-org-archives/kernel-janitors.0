Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D50C433FE
	for <kernel-janitors@archiver.kernel.org>; Sat, 19 Nov 2022 10:48:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbiKSKsY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 19 Nov 2022 05:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSKsX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 19 Nov 2022 05:48:23 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA376A2897
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 02:48:21 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id l14so13099489wrw.2
        for <kernel-janitors@vger.kernel.org>; Sat, 19 Nov 2022 02:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GCRUwlyQfPtRwkFPWHCmxbBbaV/FCTS3vd9UhDpRJw=;
        b=U5cf2cAWfyoVdpYvQqZFOUFkFknLu6FxywFHo5JoJIw6eu++LZmvU9bP/scgSCD+ya
         m6jgpQjS1wElrcA2pvTpi5Vdp/HQeTnM4wEUAKEwPb/XCiwCdBExoTtI3oP8a/EF0IHc
         5PaX1ZE0tsCSwsfS/taaGwYrJsdOXWwnHOi1p4ay2YdfJcxv8yT/YPGaTzYVNubHu1Kc
         F/l3ArFCpe/M+P92RPKKqj3ZhiA6F2sCC0ll/M/pVeQm8nOcJ1kf1UX5IR3TNb+97+Ab
         Yfil7Jnc0GGu9VRe4FZQeWmm0aQY2VqK+vTegpIPnyAULXkiPw0GQdwJZ2jQM/4pUFj7
         H22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GCRUwlyQfPtRwkFPWHCmxbBbaV/FCTS3vd9UhDpRJw=;
        b=zNDh2e+EcENrj5Lg1C0frcQiJaXdSk85AQRK31OY509fw8v6BVKLUcF47+ut9q8TJw
         JZZkniefgHarA4XGdo4dcPYd3b5DjGIBJfHEKhb6e5/g8YiexT5n7/FFSMxvtRb0Yc8N
         uf8n9HAd4AkYzQKjdjBJd81DY6f+BBXA3eCO5d2LzR/uzVz1Ca5fEUQGEy+zz5T/AxOF
         a/AGQH96UbyYfH/ytsWt7oBFVU0yR1xMLWVeQH/3YE+hYQXXwOsZF8OVRhsOP2kggCVy
         fAnyldE6JHu67m6B+OFA1Se5ZVAaz0Rt+UdT2LWdaPCobhsKCSq8kPwYaEqaQk7D+4EC
         75AA==
X-Gm-Message-State: ANoB5pk6VtNG5liktgl652V7Z2r/0I/FZ7S+XyMntDv1exfL7EQx0XTF
        NQDZ7rqQWn+/1AyFeMAyx+796hD9RR/GCQ==
X-Google-Smtp-Source: AA0mqf55zXKuDov4dsgk8NTy8TSxzzMQyRmqjoSjUq8Rt0ngHAlvEDMpnWINLcnyEnV5bjr/20Z5yg==
X-Received: by 2002:a5d:4dc7:0:b0:236:5726:f1b with SMTP id f7-20020a5d4dc7000000b0023657260f1bmr6390924wru.231.1668854900098;
        Sat, 19 Nov 2022 02:48:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l16-20020a1c7910000000b003b47ff307e1sm7119223wme.31.2022.11.19.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 02:48:19 -0800 (PST)
Date:   Sat, 19 Nov 2022 13:48:17 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Alex Elder <alex.elder@linaro.org>
Cc:     elder@linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Message-ID: <Y3i0cUmRbxikVRwS@kadam>
References: <Y3OOP9dXK6oEydkf@kili>
 <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org>
 <Y3W83708rvg1Krvy@kadam>
 <Y3dVcNt32yPgP3EC@kadam>
 <8d3eba21-7950-7179-91f1-75a2529117e0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d3eba21-7950-7179-91f1-75a2529117e0@linaro.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Nov 19, 2022 at 03:21:48AM -0600, Alex Elder wrote:
> On 11/18/22 03:50, Dan Carpenter wrote:
> > On Thu, Nov 17, 2022 at 07:47:27AM +0300, Dan Carpenter wrote:
> > > Heh.  It really feels like this line should have generated a checker
> > > warning as well.  I've created two versions.  The first complains when
> > > ever there is a divide used as a condition:
> > > 
> > > 	if (a / b) {
> > > 
> > > The other complains when it's part of a logical && or ||.
> > > 
> > > 	if (a && a / b) {
> > > 
> > > drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
> > > drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition (logical): 'hash_mem->size / 8'
> > > 
> > > I'll test them out tonight and see if either gives useful results.
> > 
> > I modified the test to ignore macros.  Otherwise we get warnings where
> > macros are trying to avoid divide by zero bugs.  There was no advantage
> > in treating logicals as special so I dropped that.
> > 
> > The results are kind of mind bending.  I think maybe people sometimes
> > accidentally write "if (a / b) {" meaning does it divide cleanly?  When
> > that should be written as: "if ((a % b) == 0) {".
> 
> Interesting.  I looked at the first few.  I think the nvdimm ones
> might be using "if (cleared / 512)" to mean "if (cleared >= 512",
> and in that case, the >= might actually be more efficient than the
> divide.  On the real-time clock one it looked like a similar usage.
> Regardless, it's not a typical idiom so I don't think it's
> straightforward to understand.

Yeah.  I'm going to publish the check and the new warning message will
be:

drivers/nvdimm/claim.c:287 nsio_rw_bytes() warn: replace divide condition 'cleared / 512' with 'cleared >= 512'

regards,
dan carpenter

