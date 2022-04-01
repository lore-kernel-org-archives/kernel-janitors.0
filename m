Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91F3C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri,  1 Apr 2022 14:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346555AbiDAOIZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 1 Apr 2022 10:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346540AbiDAOIZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 1 Apr 2022 10:08:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 69F54215469
        for <kernel-janitors@vger.kernel.org>; Fri,  1 Apr 2022 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648821994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oPKiMeBipG/n75nIi9Z8lQEgirdQ3eeZPdOA5+6OEM4=;
        b=FQnFN/w/wUeSKe0PfiBHMd+tzA+UR4c5dtuesLm+w1ZhbM9kKl+wgL16mKdUn3XXlyWcUu
        KBOjp/TUfT10XJhMgcMjCrssdYcKplQdIzUBR7Kkndk5JdGYkwHp9fCCj3P00nAbgi4CGE
        4MezlV8DyPV11W9/O42I+hKEIn3GngM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-xVMrJLFUMZidzA3HVgsmLg-1; Fri, 01 Apr 2022 10:06:33 -0400
X-MC-Unique: xVMrJLFUMZidzA3HVgsmLg-1
Received: by mail-ej1-f70.google.com with SMTP id gx12-20020a1709068a4c00b006df7e8181ceso1650393ejc.10
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Apr 2022 07:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oPKiMeBipG/n75nIi9Z8lQEgirdQ3eeZPdOA5+6OEM4=;
        b=7cCnA0t3t0qVZgFVOWvGXZIZesb6Yv9D52wMY2RVtOppkPXljx3itgRY9jkBNcdL+L
         GOiEan+v4b4tBvLFswV11kq3DhzswTfmku1z798FyA4QcRBbrLs3VcJTBrNlEu3byogN
         VTiSC7rY4HxP66AaoCAyE6WFDruMmB3Seua7aaPd7Pscym/DJtGuv8DVxlrrDli1d/Dt
         6RmT1Z0UCgsVdPlXt7HFgsBOa6HvkUqdP0z84bOQoGJg3sjMCteekr7/oKKTFIRNHyxx
         YxplK8B0VYyZ3IicMgXliIq+LyNCaHDUbWSYHD/4Dn3aDRluMMkJTVj0llKH3sGeoKVx
         CKCw==
X-Gm-Message-State: AOAM530uYz6iDAPT5H8AHBUfYyi94+8GvIIwm5d61tboxzPhcefonWm1
        /efGp2SNAaQOXjCH6PA6MwZfDjQaQkRgC2zOrkrLTOItthw/4V09kz0UBdc3FIgcKaHBn8jtU5s
        MhTxlrIYGlzNTt+ACxcKnQF8rlMpm
X-Received: by 2002:a17:907:2cc6:b0:6e0:1ae5:d762 with SMTP id hg6-20020a1709072cc600b006e01ae5d762mr9714607ejc.291.1648821991798;
        Fri, 01 Apr 2022 07:06:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD6bu0GtgNQPcO6zhHTHlVfQGsBTyEM/XcoIIEW2FyS6WECKfMjFl64ImfiDDCAZyLfM/7cA==
X-Received: by 2002:a17:907:2cc6:b0:6e0:1ae5:d762 with SMTP id hg6-20020a1709072cc600b006e01ae5d762mr9714577ejc.291.1648821991539;
        Fri, 01 Apr 2022 07:06:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id c12-20020a05640227cc00b004192114e521sm1221807ede.60.2022.04.01.07.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 07:06:30 -0700 (PDT)
Message-ID: <705809c7-8370-de2e-fe32-47735fc9c39e@redhat.com>
Date:   Fri, 1 Apr 2022 16:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] KVM: MMU: fix an IS_ERR() vs NULL bug
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220401100147.GA29786@kili> <YkcGfMNjaayttqtC@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YkcGfMNjaayttqtC@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/1/22 16:04, Sean Christopherson wrote:
> Paolo, any objection to also returning '0' in all non-error paths?  There's no
> need to return whether or not the TDP MMU is enabled since that's handled locally,
> and the "return 1" is rather odd.

Well, I kept that because I thought there was a hidden reason for that. 
  At this point I was really about to press Enter and send out the pull 
request, so...

Paolo

