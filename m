Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBF2C4321E
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Dec 2022 18:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiLBSbO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:31:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbiLBSbL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Dec 2022 13:31:11 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AE0E7878
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Dec 2022 10:31:10 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id cm20so5718164pjb.1
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Dec 2022 10:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfK+kfqbWPptgCq2tZCiMpVEUs5CosRMB5lioDGYMKk=;
        b=ihCOICzU9nJEOo0P2BhftCjjX0ng291HIJTq+vBvOtmTjDX2nctPCeEY54SNqvCoKH
         Ho477OJgIkHgoBM5aUUXyNdBQvjrTfbO9K3yPIodpY7uFCH7Th53RYvtZ4OjIoPYGOZy
         OH6uyhO0hSAiB9v2AHNP5icPXZGWNmyW4njPIBV05dgLLAEYqWdL0wqMbomqDJOo9HmV
         g+13AgTUNTn5vOGErc0sqTcjcbYdxyVW8rUhNOPGwOs3HVIxZhfBGkHeZ/KZVxaTegFN
         Min0mX0FvZfX9Het51hhpAMaFuW/dLQ77hSth14Gz7JzY2mtNSEsXuOy20hbMcU0uFVa
         Hgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZfK+kfqbWPptgCq2tZCiMpVEUs5CosRMB5lioDGYMKk=;
        b=eB90iCbWcOafuSIirfX6niFqH9E5PGqj6rIWZGnAoE+4xOXAsZyc1cpe3QUjUe13kS
         Qj8HInSLBJgRVYsYVTOKA02UTNWnBNOUm9TQzOHz2hXb+LKNGwukdtTFMNOo414TpTdf
         JQ/HzDxK3AtMgvXid6X4TgdklYWAokAc8yPpEGP5MRBys1ix7O5gsPvvwXmZZhy5jgQ+
         F4SKNvObApqsZw1nGweLAsmoDOdZMnrUKfFOk+36WvNtD8c+JrdAq+0m6UUgWrc3Fv5j
         H6V5BB2dOf2GDoFBxFWvSI6WbyfnnSPx0oPwSKgqvnkUs1o8NgAXbmT4jZ0tAukpEOjy
         o5jQ==
X-Gm-Message-State: ANoB5plyguP+YipqErJsgRkCbKj3FYauhshQe/ET+CQPE8MLC52y7wBZ
        khx2umKqJI01zifYO6b1KvfABQ==
X-Google-Smtp-Source: AA0mqf6HaLY2x1LQczWVnG+WVM5qZCz4SaGDPltGY08HbQBpPiqU6EAI8SfB8StMG3TIYceogMwsYw==
X-Received: by 2002:a17:902:b282:b0:189:91f3:bfe2 with SMTP id u2-20020a170902b28200b0018991f3bfe2mr24328012plr.34.1670005869670;
        Fri, 02 Dec 2022 10:31:09 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id fa13-20020a17090af0cd00b00218abadb6a8sm5019339pjb.49.2022.12.02.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:31:09 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:31:05 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     "Colin King (gmail)" <colin.i.king@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake
 "probabalistic" -> "probabilistic"
Message-ID: <Y4pEaaQsnDWEOxjH@google.com>
References: <20221201091354.1613652-1-colin.i.king@gmail.com>
 <Y4o0Nq4SKGZgDOxi@google.com>
 <10445a4d-0175-3e5e-aa74-9d232737a7c2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10445a4d-0175-3e5e-aa74-9d232737a7c2@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Dec 02, 2022, Colin King (gmail) wrote:
> On 02/12/2022 17:21, Sean Christopherson wrote:
> > On Thu, Dec 01, 2022, Colin Ian King wrote:
> > > There is a spelling mistake in some help text. Fix it.
> > 
> > I assume you have a script/tool of some form to do spell checking?  If so, can
> > you point me at it?  I'd love to incorporate something like that into my workflow.
> 
> https://github.com/ColinIanKing/kernelscan
> 
> It needs an appropriate dictionary to be installed. It's very fast (but
> sometimes makes mistakes, I need to fix those!).
> 
> ./kernelscan -k src_directory > mistakes.txt

Ah, it's specifically checking messages to avoid false postives on code and whatnot.
Neat!

> I normally run this across the entire kernel git repo on a daily basis, and
> diff the new results with the previous results using meld and figure out
> what needs to be fixed.
> 
> You may be better off with using codespell

Heh, my kind of nitpicking people :-)

  MSDOS->MS-DOS

Thanks a ton, that's exactly what I was looking for!
