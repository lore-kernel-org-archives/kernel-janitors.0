Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCD3EC873A
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 15:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234592AbjIGPqx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 11:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344218AbjIGPcm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 11:32:42 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E3A1FDC
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 08:32:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-500913779f5so1866484e87.2
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 08:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694100687; x=1694705487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnMGoGgKemb+DDrSQzPTABi+a718THu1rk85qOkvFQg=;
        b=DB7iM+w/gW3bkJVnVzZw8EIzE5plcublWASUZnTdM7wJuVm5yQ9wbBsHUyFnMdzJY9
         qbTNfSos7u82g5QWw6s1hH6dgDQQQPhryxUO3gSUBchHJDGYlOGyph8qnBmUdDZ2l0ul
         o12GwhiPjAcD5SmMiV5avPgyToC65dvKezs8A6vL2VsODQn/oQmXS1VFMpDzrx/1vcwr
         y/jvtuB3dJIA5on824hXB+wBA/u9ypWfheC8spZHN+qZXjKc/L9LZte4JWYftkJxH9jq
         McjNA+WOcwiYq4Z/7KPETcNzHGcxt/nu5Q4+Wy8G1VctwO9zslAXhtOdbvWJtygJ21uI
         MRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694100687; x=1694705487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnMGoGgKemb+DDrSQzPTABi+a718THu1rk85qOkvFQg=;
        b=GrpZ0VyygfOBr555uxoNr6Wa4fFDX4ACKM0KHXCBU5P3xCMAl9yCz6X2FSrZCQKRIx
         yThYZwYY1zKQ/verKE5734whAkJ6ARgSBDpM2EQPVFgZRokuKuLrMkV+roa3rOZtWrGu
         mB+XglUSa/FwVGfB0Rhr7l8DbS5F1d29EkMPwT2DAZyXSZ9UjWtg/Z1Q1atSWkI7EAZj
         SVXSbY231Hx1drVMsSDgSMv1BxtGCHfIypLYjs3tQoU+K6uWHfNyqqh4dWgv1qo3XWgo
         fiGHdS85MzdpFYFfs7Tbc8p8Z3TheUslm7bLJsCDpAOaeVAJDqeqT9XALitkOEt5in6X
         A7Xg==
X-Gm-Message-State: AOJu0YyXQ3VxQ612pZ58yzbJPx5KCvr3GrJDmgkUL2gIwrfOpVSYOz5s
        DuLlzlCmuDNyzJLs5dLyIzbnxQTUMgNVTl9zh1A=
X-Google-Smtp-Source: AGHT+IGyPStu/4bGX3A398E8xixDQaUmGkOmIW0jf0T9gkQFvDYPcLVleJrm+vURQhH+rA2UwXThOQ==
X-Received: by 2002:a05:600c:2246:b0:401:c297:affb with SMTP id a6-20020a05600c224600b00401c297affbmr4284944wmm.37.1694085336903;
        Thu, 07 Sep 2023 04:15:36 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c364a00b00401b242e2e6sm2208451wmq.47.2023.09.07.04.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 04:15:36 -0700 (PDT)
Date:   Thu, 7 Sep 2023 14:15:33 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Longfang Liu <liulongfang@huawei.com>,
        "David S. Miller" <davem@davemloft.net>,
        Zaibo Xu <xuzaibo@huawei.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] crypto: hisilicon/hpre - Fix a erroneous check after
 snprintf()
Message-ID: <71bf9b84-462f-405e-91aa-fb21fc6ffbd5@moroto.mountain>
References: <73534cb1713f58228d54ea53a8a137f4ef939bad.1693858632.git.christophe.jaillet@wanadoo.fr>
 <ZPaSCOX1F9b36rxV@gondor.apana.org.au>
 <00bdcfec-6cc1-e521-ceaa-d16d6341ca16@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00bdcfec-6cc1-e521-ceaa-d16d6341ca16@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 05, 2023 at 07:27:47AM +0200, Marion & Christophe JAILLET wrote:
> > 
> > The other snprintf in the same file also looks suspect.
> 
> It looks correct to me.
> 
> And HPRE_DBGFS_VAL_MAX_LEN being 20, it doesn't really matter. The string
> can't be truncated with just a "%u\n".
> 

drivers/crypto/hisilicon/hpre/hpre_main.c
   884          ret = snprintf(tbuf, HPRE_DBGFS_VAL_MAX_LEN, "%u\n", val);
   885          return simple_read_from_buffer(buf, count, pos, tbuf, ret);

You can't pass the return value from snprintf() to simple_read_from_buffer().
Otherwise the snprintf() checking turned a sprintf() write overflow into
a read overflow, which is less bad but not ideal.  It needs to be
scnprintf().

regards,
dan carpenter

