Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A12BC0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 19:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjJYToJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 15:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjJYToI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 15:44:08 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B4A4E5
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 12:44:06 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so2663523a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 12:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698263044; x=1698867844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JeXrnJe8xvNfcrNS9vywqBs8RswX60g4RVbYr0154Ac=;
        b=Ebkn7cRfn1JhRy64xdFtiY5ujBfGzD61F6IXFEOe/9WezZJ1l8AUog0ImXFNEodyES
         0uNIienMC1DUlPUtkcZiwfLfCmcOXr9j/H8s3LqQzeavmpqTTEylEMacfmYM0BcBmgUR
         /+byw/GxlHdtAdqADOSHAZItToadgE76Carv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698263044; x=1698867844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeXrnJe8xvNfcrNS9vywqBs8RswX60g4RVbYr0154Ac=;
        b=P/sRCkEksZNa4jzaga9XSMnVWsY7dl6QiDKcKhSkOlQuN4ar8KtUdGOhUQeh7TT40a
         sPTBaTjvkkZbT720PfBHEnQc9b2uxGMYpD49OSZNEbgH9qE1vw4aEFhy1iYem/UvxNWK
         s2l4OY9heb1rqvll8WkeEthwnq7PcEHG+8xf50Er5lrzOK5J37KUFe4pNDOyTPIEFJjF
         oZPrYT4PDE3oZi4ETqZDCpwnx9oPmo5Om1ipLG5ZGdVN3Y3GoZFzlSgLchUVyP68lh7d
         bH+e63qHIvq9QLcxGPOW/mfGwZWeabXXFXR3vDS4p/akV+8gXxRFF/qWALKmjBb69Xf1
         ewDw==
X-Gm-Message-State: AOJu0Ywoyu6ko0am0Pp9hgD7rEQ/bFZTXQIDoDqxb7EIBqxoT2uC7mVP
        R12sL+p5FDGeswK5+EvkQRfiVEOLZykJQ+RUrwGYp5js
X-Google-Smtp-Source: AGHT+IEAeHCU7Mq98xC5EFAC0PEuujH8yeNt8T2AktXJ9lZ9rIMMzDAedrR42kJW1MzZbdUHKwWdDw==
X-Received: by 2002:a17:907:9811:b0:9ae:5513:e475 with SMTP id ji17-20020a170907981100b009ae5513e475mr635162ejc.9.1698263044486;
        Wed, 25 Oct 2023 12:44:04 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 30-20020a170906209e00b009a1b857e3a5sm10381768ejq.54.2023.10.25.12.44.03
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 12:44:03 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9adb9fa7200so22892966b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 12:44:03 -0700 (PDT)
X-Received: by 2002:a17:907:9492:b0:9ad:8a9e:23ee with SMTP id
 dm18-20020a170907949200b009ad8a9e23eemr587581ejc.13.1698263043242; Wed, 25
 Oct 2023 12:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org> <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
 <87fs1y8xkl.fsf@intel.com> <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
 <20231025141030.63acb006@gandalf.local.home>
In-Reply-To: <20231025141030.63acb006@gandalf.local.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 Oct 2023 09:43:45 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
Message-ID: <CAHk-=wj_4VNHeNmRJ_DeD7RDZFvPCQxVR1O2RwFAOG7Gb7OYYg@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        ksummit@lists.linux.dev, outreachy@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 25 Oct 2023 at 08:10, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> I think this is the key issue. We only want the context of an email that is
> being responded to present, and the rest trimmed. Automated trimming or
> collapsing doesn't do this well.

It's not just about MUA's that hide things. The MUA _I_ use hides
excessive quoting, but then when I look at the results on lore I often
get completely unreadable results because somebody quoted several
hundred lines of patch or whatever. And then I scrolling through the
thread is suddenly a major PITA.

So I do think that the whole excessive quoting on the lists should
just be a hard no, the same way html is.

                 Linus
