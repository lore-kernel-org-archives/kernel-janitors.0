Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C400EB64D7
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 12:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjFZM7e (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjFZM7d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 08:59:33 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E884FD8
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 05:59:31 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fa7512e599so41226475e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687784370; x=1690376370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=apk70vZy4KhYcnG84Q1wffo81Dl8DaLTVZRWL3wj6Xs=;
        b=caap5YVaJxmKP2ba+RBHLW3aV7Xw/RxMUuOzSGrHC3hoeFYNisi3znUAm9NeP95/un
         2p/He1Ved0EDYRQE7KVoMZEMTK6ptlZC3iWFQBrwBLAGEf9NqqqV8Q8hvDOr3rup8TJd
         jpmW46Au0Vsoo+lP/AIlkg/Mj9kpzvgfVsJJ8IdDGDJyDzcrZo9aInKMreHWCF17/UqE
         Pgm/pKnQJs8OtBpkx3mmYmto3MDF2SW0tuoAzgz8iju/WEjOyZ5C9XwMkUajztQfBSBG
         j9N29fLIXxoRolJQx5wv5LbMT4x1ApRFBJvdc2IW4hpO72Vm4s9gvvN2mOKWkRypjne2
         9EeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687784370; x=1690376370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apk70vZy4KhYcnG84Q1wffo81Dl8DaLTVZRWL3wj6Xs=;
        b=GCslWE1Ua3XNuhpc56Qi0m4d8RhWuZQaiYeXFS5oo0F6OvQ2+5S2vGRFCjpHMJa6JE
         FJ9T9eBk5tUZ+sikzYhHXQ20eWpsZowwPyslDlh2Tuw3B3dw7SsG9/ENjq8OE+z5/jSz
         kNYC/bItDeiVT+FvNLAQnIoulU1q0dvFsa7jusy9qZlo+KnV92doviOuLrAOG+tEWq7J
         apzdIXoMZbzXvb7iwpnUm7CDa7Rob7iURL+zSXQbnWwPdKVsbwoG/saWytrKS5la+xpO
         xrKQZL7QH7u9ljLC6wQ1VpKI+XoSdQc41/3Nj/d7QkEkXiaQrIDAm+N217rEyqmAT1n8
         vKPA==
X-Gm-Message-State: AC+VfDy5j+RYQO6775qBGFKEuf+RVDEOuP16sxAcmSS66ym11/VRhd9S
        zKuYLVKfff6AJvaWaO3fRsyc8Q==
X-Google-Smtp-Source: ACHHUZ6cBlNtxq75cN4Re6BcQmPh/298izmROOMzkk3aoy5z+JpobqagrTiu+DwsCmdHdbox+wHzaQ==
X-Received: by 2002:a05:600c:2942:b0:3f8:efc5:3382 with SMTP id n2-20020a05600c294200b003f8efc53382mr24739064wmd.31.1687784370379;
        Mon, 26 Jun 2023 05:59:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d6e85000000b003063a92bbf5sm7386241wrz.70.2023.06.26.05.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:59:28 -0700 (PDT)
Date:   Mon, 26 Jun 2023 15:59:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Demi Marie Obenour <demi@invisiblethingslab.com>
Cc:     Markus Elfring <Markus.Elfring@web.de>, dm-devel@redhat.com,
        kernel-janitors@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] dm ioctl: Allow userspace to provide expected
 diskseq
Message-ID: <e42e8115-6f75-447e-9955-ca4ad43ed406@kadam.mountain>
References: <20230624230950.2272-3-demi@invisiblethingslab.com>
 <3241078c-2318-fe1b-33cc-7c33db71b1a6@web.de>
 <ZJh73z2CsgHEJ4iv@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJh73z2CsgHEJ4iv@itl-email>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 25, 2023 at 01:39:40PM -0400, Demi Marie Obenour wrote:
> On Sun, Jun 25, 2023 at 01:23:40PM +0200, Markus Elfring wrote:
> > > This can be used to avoid race conditions in which a device is destroyed
> > > and recreated with the same major/minor, name, or UUID. …
> > 
> > Please add an imperative change suggestion.
> 
> Will fix in v3.

You don't have to listen to Markus.  Most of us can't see Markus's
emails because he's banned from the vger mailing lists.

Markus, stop bothering people about trivial nonsense.  I've said this
to you before, that if you spot a bug in a patch that's welcome feedback
but if you just have comments about grammar then no one wants that.

regards,
dan carpenter

