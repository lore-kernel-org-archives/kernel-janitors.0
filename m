Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD86CDB465
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 17:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346257AbjJSRez (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 13:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345199AbjJSRey (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 13:34:54 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D266112
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 10:34:52 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso6607715e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697736891; x=1698341691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JLCxd63nCOoQDWmzUIR4g0SFuc5MG7HB5mEucEhNs6I=;
        b=gipdwcy3TN6fqDE+CnBdJ2hTs9e2FRTzdN+zkbvZpqr3TeO4M4zP5GbljpJIphM5o9
         Ctfy42PeK8TvKaFfZoa9qSBJISLpAzurj75HFqdPpj1t0reuw46y/a9BYrBAjl7VnaBJ
         IfqfSaN8PYOb25DAC3UdNgHyjgYRdCvWuE1tvvq3iJV1/dWQPYalAOZV2oU0zVbImeSw
         1RlS304s09KU3PTnDQkOClqZjtCebnq/EFJwZNSMInD1PHwmDpFFxWGYqf5ZvIC28bA3
         sjXLv6i8FW2rn+Jmk4NygyYy3dMSej3ygUurjsxYqs66N1oXohJ77Q3AJSR7xt0AtMJM
         5a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697736891; x=1698341691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLCxd63nCOoQDWmzUIR4g0SFuc5MG7HB5mEucEhNs6I=;
        b=ubKIHdBi4S57UyuUl1buPjVqWi0a4cck39ujKAq2lrdJBOvjS+EI1hVKLsBmEy+wYb
         A7Yhx+V19XZVrlVBts+tFRy7Eba7C+QnPC30ij7Zkn7rdh666GDzOPaZ+Un0rKZxyRiH
         9C9+DezZGQ22syDTBmYaHvH29jnSr5DNmHCRVhiiPIdhRf1VMKzcbAleTabExTrr/0MG
         UOPOE2hBkUKokhZ88JubfHqJM/c8/hPaTxyYX/Gah2CWSivHdzPnokMAZFFD+/5c0Yr3
         j8blbR+lb+X3YybsnXPBrzUD61q6/qyjZ1WntPyyhrfgdGrFETKh9dr/U2M0p4Plqzdv
         wYdw==
X-Gm-Message-State: AOJu0YwdK5l84ymcw9WAEYfd/k0oQby9Bv53FxHffNrhnL2VILQhHskq
        QEgkvpVpzW0BeI0Z2auveMVbag==
X-Google-Smtp-Source: AGHT+IEtCHGtsgPtZryuWJgCnIKvYEEuVuPw+MYPqy/qvDB4IAGICpg4n4wvIqvZY80GOywc2Mt/jQ==
X-Received: by 2002:a05:600c:5101:b0:403:aced:f7f4 with SMTP id o1-20020a05600c510100b00403acedf7f4mr2625799wms.12.1697736890746;
        Thu, 19 Oct 2023 10:34:50 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b24-20020a05600c06d800b004064e3b94afsm4910004wmn.4.2023.10.19.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 10:34:50 -0700 (PDT)
Date:   Thu, 19 Oct 2023 20:34:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     "Bird, Tim" <Tim.Bird@sony.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: KTODO automated TODO lists
Message-ID: <087316aa-f8af-4612-b035-bada418f4e56@kadam.mountain>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <CACRpkdbNOmvBg+wHLHcdvp=YE=jYiKKCVWDqs2cMF85rXyv_aQ@mail.gmail.com>
 <CAMuHMdX2XDJkcTtysz0t+h1UuZCzioE5H2_tBerMz0LuSMAEZQ@mail.gmail.com>
 <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR13MB2503AD4559012411E72E0208FDD4A@BYAPR13MB2503.namprd13.prod.outlook.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 19, 2023 at 04:30:34PM +0000, Bird, Tim wrote:
> > And if people use appropriate Closes: tags, someone can write a tool
> > to only list non-closed items.
> 
> Wouldn't you remove the "KTODO:" and alter the comment (or remove it), with
> the commit that closed the issue?  It seems like leaving the KTODO would
> be a bug, as it no longer applies and would be confusing.

No, it's not a comment.  It's just an email to the list when you think
of something so you add a KTODO in the email.  It's like a searchable
hashtag, except it's a one line summary.

regards,
dan carpenter
