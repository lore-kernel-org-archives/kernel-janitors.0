Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ECCC432BE
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Aug 2021 14:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27EBF60F14
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Aug 2021 14:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbhHDOCs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Aug 2021 10:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:51212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238491AbhHDOCo (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Aug 2021 10:02:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E0F2A6109E;
        Wed,  4 Aug 2021 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628085752;
        bh=9UZLV0Kq8F+CSYFloLyn3KWe9256CMwCDienEmR4DTE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=iJpVJTdc6NnwK2g81brDUD1XvU24HLV3NpvVLk8Fqde3Zr32B3dIwzCGN5efC7S9R
         W0jO//6n6WL76icpkDwPRcxJ6MzokEHQjFf9h5ogaRCQDLnG5E+egPR3Dv56a/djyg
         0JQZ2OaVlpfoQ5oj9jwBV5XfEs+jsb0DJaHHzOr4SwdhjDyE2gddtKRGVu6C6CgCXE
         SO1eNiDx0ObfeWKwHYz9m5sfC7XS6IEL4voe6qRBVxgc6GKHiWA2mIM8PvTo4KAVr0
         k/3Yyg/jI7XZTdPEWTHOWQfAci16NlVXHOr2M0U2ERZ20sjBay6INCOKW6rJEahWgj
         tyLP8PiSbwYDA==
References: <20210804125907.111654-1-colin.king@canonical.com>
User-agent: mu4e 1.6.1; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] usb: gadget: f_uac2: remove redundant assignments
 to pointer i_feature
Date:   Wed, 04 Aug 2021 17:02:11 +0300
In-reply-to: <20210804125907.111654-1-colin.king@canonical.com>
Message-ID: <87o8ad5mvf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Pointer i_feature is being initialized with a value and then immediately
> re-assigned a new value in the next statement. Fix this by replacing the
> the redundant initialization with the following assigned value.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
