Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5A1C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Jul 2022 10:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234772AbiGVKaG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Jul 2022 06:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234144AbiGVKaA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Jul 2022 06:30:00 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F75BC80
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Jul 2022 03:29:58 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-31e623a4ff4so43006887b3.4
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Jul 2022 03:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0U7VPj46mlKKUG3XHLhP6jNqAPcz4SSnM1p3/zEY4U=;
        b=fzwwx2+D0/pWmJxaEPcPe36aE3VpSEp1d7PzHE970/W//P457tQvcGnG1uuhl1zN8R
         1xXk5+719QoGjj5SUNZFEa67CPFIRGESU7DY5eFeO4LmVaf+WBFAUG0VB0st5XNVG1iW
         xVFeR//oT66ftIajeHUhJCC2oLGPED9vA5LxQJfWQA82KQ8shGLMT9L6NZU9zKopW69A
         MZIhCpnqxrXl+qDYMiFrZsCtIS7UbPX30dTOq1U+tHKeHaTU8RJmLxFkhXK0VtFcnDaP
         IVydOmJrRHRa28+X/hyxm82Le6CCeUjm3muQhHIuQA1hRrEKWhXI+7JNNiMuy2wud1EK
         dPdw==
X-Gm-Message-State: AJIora8F+YbtqPaExqFke3nle2gjm6J92iwsi7Q8dDyMYeEWXa3/z6nL
        wWRZrYcOWQ52sIPpKzTMUwkWUFktSLOJQ1F3iYTV1qpf67NdsA==
X-Google-Smtp-Source: AGRyM1sJ3dpV6z8Dr0t73x8Blu8qylUiDhydnBVEuvugMFfxARNOkFyJntGnzDmX9k3lDYZXsxv/onAjMMwJRCe0/+I=
X-Received: by 2002:a81:a42:0:b0:31e:562a:eaab with SMTP id
 63-20020a810a42000000b0031e562aeaabmr2445150ywk.392.1658485797888; Fri, 22
 Jul 2022 03:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <Ytp2xv0jxwv7DBGU@kili>
In-Reply-To: <Ytp2xv0jxwv7DBGU@kili>
From:   Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Date:   Fri, 22 Jul 2022 19:29:46 +0900
Message-ID: <CAMZ6RqKQtm2nU2UZfDBUh_LbVBd=9TRH0oGRN-oRJOY3qYkQWg@mail.gmail.com>
Subject: Re: [bug report] can: pch_can: do not report txerr and rxerr during bus-off
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri. 22 Jul. 2022 at 19:07, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Hello Vincent Mailhol,
>
> The patch 3a5c7e4611dd: "can: pch_can: do not report txerr and rxerr
> during bus-off" from Jul 19, 2022, leads to the following Smatch
> static checker warning:
>
>         drivers/net/can/pch_can.c:501 pch_can_error()
>         error: uninitialized symbol 'errc'.

Hi Dan,

Thanks for the report, this bug has already been resolved in below
commit (already in net-next branch):
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=9950f1121133

Yours sincerely,
Vincent Mailhol
