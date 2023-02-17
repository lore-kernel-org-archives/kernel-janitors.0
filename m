Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA893C05027
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjBQQlg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Feb 2023 11:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjBQQle (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Feb 2023 11:41:34 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC0197290A
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 08:41:11 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-53655de27a1so16407457b3.14
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26XswqPiBSGHP6s6nxsJN9EyGJs7UFJ3DdAuQxz9eTI=;
        b=QjVPkerEjWrxxjarxuiJc+xdZaWtTMwrrVkbMKx+zQ0sS+2ZceALbz7w3tw+V08q/h
         wZfHVB3xkCHpTjL88c17MyVIUYKcMEggb59H/DoG0w8KBqRLE9WJlC4+25UXq/SWtRhY
         rxuEtgMzJFQkPm+OQLT1oVlkhmWrILCyrgJLNHtCuyGjPMQ4ge94AoXcKmKShB7eLZAg
         mRuf3n4F4BErDTyzRdKmOFMm2TAV+/h6CpgcPfOHCAcV7pKhjb52pIVSr+2pxKDYHZ70
         VgpCTIoqrp09786WrH+nhLHXZyWPckazRDQMLnUelBF05IIhtS9cik+QlNNlyHfVooHg
         +DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26XswqPiBSGHP6s6nxsJN9EyGJs7UFJ3DdAuQxz9eTI=;
        b=M0ZurrULaE08oRmA/2S0ZEJEMrCtQjf+DmtRX5GSeZfBHPWc6e2O81tf0NU/RpMwP+
         IlLLYy+GI4vmCteZqbc3nwJ7THphwJ7uaRHtPC/BIMU+4tue/AdrPOZUfQKT20g4pXK9
         /qPlzigpRHYYJ73KLtMpW8kvddTNWzh6doQ6gs5RmL+3ni3sD26dv9ubc29H5FCfPaW6
         C+CYFQwoq4dpsj+ATcZBLqzAbUnyft4lqFPA31RoO8FHOT3Dr8KvAmfexThK6vnQsHvY
         gMa6seeSMgwE8q4OFB8ePgUyWPEw4yqP8OMLtp/Fn6ZScgV2iSUMoTlsevBphLBdEkRN
         FQwA==
X-Gm-Message-State: AO0yUKXzvqkfP9au7y6Ut2ZMqPClfRxtIxZAv+Ktfa/6tF1gSpSnkrXb
        d1BCrPYg0tb0GRtYSmus1tr4Rrds500=
X-Google-Smtp-Source: AK7set87ApVahS7blZenNrptYr3Ndt+wNPJw2gc7DMQ+lKkl6rWB22TCh2FKD8Zi8efKfBlmA8lkGKpHUiw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:64a:0:b0:965:fa76:ae7a with SMTP id
 o10-20020a5b064a000000b00965fa76ae7amr688504ybq.16.1676652064456; Fri, 17 Feb
 2023 08:41:04 -0800 (PST)
Date:   Fri, 17 Feb 2023 08:41:02 -0800
In-Reply-To: <f9423a6ee10d91bd6bad32beefd1b96cad4d28f1.1676620879.git.christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
References: <f9423a6ee10d91bd6bad32beefd1b96cad4d28f1.1676620879.git.christophe.jaillet@wanadoo.fr>
Message-ID: <Y++uHlQz7OEOzojb@google.com>
Subject: Re: [PATCH] KVM: Reorder fields in 'struct kvm_mmu_memory_cache'
From:   Sean Christopherson <seanjc@google.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
        Mathias Krause <minipli@grsecurity.net>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Feb 17, 2023, Christophe JAILLET wrote:
> Group some variables based on their sizes to reduce hole and avoid padding.
> On x86_64, this shrinks the size from 40 to 32 bytes.

Heh, a hair too late[*].  Unless I'm mistaken, Mathias will be sending a new
version in the not-too-distant future.

Thanks!

[*] https://lore.kernel.org/all/Y+puefrgtqf430fs@google.com
