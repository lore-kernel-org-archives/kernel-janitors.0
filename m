Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83427C77B61
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Apr 2023 06:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjDJG0H (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Apr 2023 02:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjDJG0H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Apr 2023 02:26:07 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA5840E0
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Apr 2023 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zRxGJ68ailP9udrbMv4uuqBQRz4OvGbSVTRqItSo33U=;
  b=MAx8Sy+qZvJVEjxr5HVHUP/nb7gupE2E1vONifzeSb5/uOE0x2Nb/4jm
   oyiPSxMPnAA2XP1cdMZcNkb1WnK0s4OnwB7LELwvmMPNE8KYvTZLKR8cc
   Fkce2Tm6XEUMl2HuXH19dnrvpbGbZ9wExSznkfdgQuAUwOL7aEvyWhpwy
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.98,332,1673910000"; 
   d="scan'208";a="102249005"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 08:25:53 +0200
Date:   Mon, 10 Apr 2023 08:25:53 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: [cocci] Reconsidering pointer dereferences before null pointer
 checks (with SmPL)
In-Reply-To: <95caa4c1-2455-2733-ef4b-3ab07783c725@web.de>
Message-ID: <alpine.DEB.2.22.394.2304100824510.3387@hadrien>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de> <alpine.DEB.2.22.394.2304092044020.3028@hadrien> <95caa4c1-2455-2733-ef4b-3ab07783c725@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1380549962-1681107953=:3387"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1380549962-1681107953=:3387
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 10 Apr 2023, Markus Elfring wrote:

> > Setting var to &input->member does not cause any immediate problem.
>
> Undefined behaviour would be involved if the expression variable “input”
> will actually be resolved to a null pointer, wouldn't it?

No.  &input->member adds an offset to the address of input.

julia
--8323329-1380549962-1681107953=:3387--
