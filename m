Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB41C04A95
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Sep 2022 21:37:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234352AbiI1VhD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Sep 2022 17:37:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234203AbiI1VhB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Sep 2022 17:37:01 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0097992F52
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Sep 2022 14:36:59 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-12803ac8113so18992848fac.8
        for <kernel-janitors@vger.kernel.org>; Wed, 28 Sep 2022 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8OWmUn3+T5zXTPaC+bf/lvL+XUKnWGP4IeTHrEcXpWE=;
        b=DAdkaMwy6Nx8AURbnCII/HrGRywjeRMMs43hcDL+Maxwu0ZOzhIwHK+Gtz/gpvjnSf
         WhjzpzVpYYjVrKiPbnaylJVaKB9uYUnlPOkyCCAXZ5+ELgclwh5Ug0VSNdae7cwwlfjx
         SqhDO2Ux6nkXy00+0QG1PJND6cXxqp+LAErK7v1I4IU7pG5d6FnTdQLRofTmvVe8tPmS
         cJBPJOq+1qmeySCbEmzuvf8W63hr3Mhq6UdHAb+oMcy1F47MIvbkvWvSU7ijlaqmZhAq
         CfCyOkOGx3B1uyqlaNNCO7PvczvtcjsDjNruVBFYrcyv60c+cy9zk2GT3wlp1HdUjK0+
         tabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8OWmUn3+T5zXTPaC+bf/lvL+XUKnWGP4IeTHrEcXpWE=;
        b=hiCISXTbdkQf4NuTgkTnOBZlW45/H5hOeSu1TUL+rP/0Kza54Onsly/rgf/fjZ7yuD
         RWpUpurULDjhSFnt7ZpzC5OZ5nCbCUJ/vcNV2nKt2LGlCnOyWnX5p5htcAdGO8Z4mG7G
         H5ZHbpGxe8TLfcIk5qRA9rtx+HQ6NbVlEqjgqVMswQcsiFxXMFqz1pqIcrQdgaistYXM
         qp4R42nfptKvVAE21o6oDRfgwxJHSi1dzjMu7kmhSXzEVLdwYoBTnhLC2OzlMMoRmTcb
         JOwijxrrfLw7/xkmHgL8jmdu116xY3frZ1xt31LGZxEXyB9XYp9PFZQaHbPI9dz0rDTo
         UI6g==
X-Gm-Message-State: ACrzQf22rlv1i4uguPtKyhkyfTGiFiPaZvT6dtuCHS1Jmh88hXQEvS6E
        SFa71Ne2jGPIS4DEF+aXCQT5NN/n5tze2va9zV2Phw==
X-Google-Smtp-Source: AMsMyM4LqskWTLvxoPVhDXyAtfbGtTpAFYGl2ctvyY6tM+2CE+l2S7WyCBcSIm5xfa9I2rCoag8cFpNzF25ep1laIus=
X-Received: by 2002:a05:6870:5250:b0:127:4360:a00b with SMTP id
 o16-20020a056870525000b001274360a00bmr6538854oai.13.1664401019207; Wed, 28
 Sep 2022 14:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220928213458.64089-1-colin.i.king@gmail.com>
In-Reply-To: <20220928213458.64089-1-colin.i.king@gmail.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Wed, 28 Sep 2022 14:36:48 -0700
Message-ID: <CALMp9eQJQaPbp+UrAYzwLXUGuMdOxOQVVJRs5bJOzjn02RM-_A@mail.gmail.com>
Subject: Re: [PATCH] KVM: selftests: Fix spelling mistake "begining" -> "beginning"
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 28, 2022 at 2:35 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in an asset message. Fix it.

Nit: assert :-)
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
