Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C687CC3DA79
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Dec 2022 11:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiLZLmE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Dec 2022 06:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiLZLmD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Dec 2022 06:42:03 -0500
X-Greylist: delayed 66 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 26 Dec 2022 03:42:02 PST
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA016276;
        Mon, 26 Dec 2022 03:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1672054920; bh=YWnNo6ULzV1M3coilbPGzg/xiPj1C8aTcjvcQnHxCIA=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
        b=Gln8HDyj/aABbMvICwfdfe53atZENaGnl1/kSmfAamcnnFoKAxfaA4HuDIKd+PUvT
         p3t6gBEAwVA6hmNG+yo4CobK73BBjCw5BLWBE863vjOli5kaYfctnUiUL8pZ0KirRf
         5jxy1dCRqwefEtwu3xZXzcfMtLawOvJL/zmC3FTc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Mon, 26 Dec 2022 12:41:59 +0100 (CET)
X-EA-Auth: a6woBLnrOkV+3lXWrM5ZM9eYHe/lZWHP4yEvyptewATXyNr4NtmplLjB1RruF9rHBzT1ijIMI8MvzZSAvTqwZZuhdMqT2dJb
Date:   Mon, 26 Dec 2022 17:11:52 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Saurabh Singh Sengar <ssengar@microsoft.com>,
        Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: Re: [cocci] [PATCH] coccinelle: api/atomic_as_refcounter: include
 message type in output
Message-ID: <Y6mIgLpxzr4KmbAz@qemulion>
References: <Y6hnpcLiHmJaQbeE@qemulion>
 <a31e9df0-1d15-9727-0a98-6c0cb2acdf84@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a31e9df0-1d15-9727-0a98-6c0cb2acdf84@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 26, 2022 at 11:30:09AM +0100, Markus Elfring wrote:
>
> > … So, include the test "WARNING: " in the report output …
>
>
> How do you think about to use the word “text” instead of “test” in
> the change description?

Hi Markus,
Thank you for catching that. Just sent v2 with the correction.

./drv

>
> Regards,
> Markus
>


