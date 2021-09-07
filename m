Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81ABC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 05:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56A5610A6
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 05:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhIGFKd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 01:10:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229456AbhIGFKd (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 01:10:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 669BA60ED8;
        Tue,  7 Sep 2021 05:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630991367;
        bh=mEugUUF482isrPkyfakL5zZXLLtBswRZY2wS26w4QIM=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=Odu3b0RZ50n6TSSMEyg4dTkqkOFtJ0juULU82TziQxF8d9VPRSShEHMaqVjim/qte
         IMR+4idTLde0LhOGMrSq3trRTsaRWAbilhY4nPccHqWuyjHQrLHSVDS9/7v9BW0Zdq
         yx6Sc8z/PVCL/6I1oir4E0fO1iCUpmA0WZttfisYCxqDX3lTV30/WDg0ZzTUFQW2uC
         snEO4e241FBTLKdnKrGrdf3rQiMvLMgb2N7X+60Qr0cfdSkyiWkYGMJZ1jMc3KHwxg
         WrEiy7bD7w7Op7FFftjv9bSpSfuRaeS3bVak6NTn7YyA2SJdK2urJPon/xD3SyOvOF
         6vOvdRVSPgg0A==
References: <20210906094221.GA10957@kili>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: r8a66597: fix a loop in set_feature()
Date:   Tue, 07 Sep 2021 08:09:12 +0300
In-reply-to: <20210906094221.GA10957@kili>
Message-ID: <871r61c6pn.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Dan Carpenter <dan.carpenter@oracle.com> writes:

> This loop is supposed to loop until if reads something other than
> CS_IDST or until it times out after 30,000 attempts.  But because of
> the || vs && bug, it will never time out and instead it will loop a
> minimum of 30,000 times.
>
> This bug is quite old but the code is only used in USB_DEVICE_TEST_MODE
> so it probably doesn't affect regular usage.
>
> Fixes: 96fe53ef5498 ("usb: gadget: r8a66597-udc: add support for TEST_MODE")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
