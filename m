Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FAFCDB482
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 10:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjJSKe7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 06:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjJSKe4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 06:34:56 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14B8FA
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 03:34:54 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32da4ffd7e5so369144f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697711693; x=1698316493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=lgXCyMoJ4ePOJCrJQlFBVWwImk9CquZTm2u+4IE5bTLtPVWBbowhiIBfGgaGuAWrir
         DMxI0HL07KlU1xMB4vomLRQKtQMZLphduJzxLtj2ykGYudNotYgAQqSoAnDKKRUT/gNI
         SgcdgfC3VbnIluEfSaA7d/2WV73XdsUSrMjHLFjNMAYh3QJzTsG1AT6xJbt8D20l7NEg
         7O4YkfxJpbWGEE08hp+aAS6en1I9e6rsXaJTKTeKxVBWPWTorAwlBUeRSrJWXpo4LLsx
         HsrmepXs085cNJX7L5ZVKAFsHgngCK3ga37IxqX4hyu9uwhOPvk86n+uWaDncEpLjTZd
         usQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711693; x=1698316493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=oPzsKNyQn+i5vbqyaOvbGYIFkjW3x73DxXfzDIaFai5aYfJr0jcp8SRHwFPDf14Rj4
         9Pb46LEO/n31u3OJisGkHjSdASYFJ14GvY0NgpgXPWqIRGHvNVzI2OyhArq0WP9I5Cza
         +p+ibvyVueOvc1Zhx04aR4Vpz+hq3jbud1SgC1BkxEjntTusKTU01xoAZV5uG70RxyDk
         TT5LG9+zEyMjDOpdq0ZkpJGusPWCKSvTCvX6bVxc6BMI7EPU/e2qE/q68BARpgm+5HwV
         HYI9LoLuGAjTukkpfSYlo7tPpGyneIUqTk1iWYZQQ/9aDYaDQAGbC6tnsMiaBEip8s0K
         IwjA==
X-Gm-Message-State: AOJu0YznFCXPHI307oXesaiRgv3U8QWzCQi2V9mJTAFU8JS858rJwAEF
        YrXWZrOCmVl9xpn6cJd7cY3qwA==
X-Google-Smtp-Source: AGHT+IFdar0VVDaMOSgRpl4MSClkYLbAVPKlMoGU4cE/swmAe891KuxkdeV5d/6VMA1irMhQ27GKxQ==
X-Received: by 2002:adf:eb87:0:b0:32d:dd68:e83 with SMTP id t7-20020adfeb87000000b0032ddd680e83mr1075240wrn.21.1697711693227;
        Thu, 19 Oct 2023 03:34:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b0032d8eecf901sm4175868wrx.3.2023.10.19.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:34:52 -0700 (PDT)
Date:   Thu, 19 Oct 2023 13:34:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
        trix@redhat.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: lan78xx: add an error code check in
 lan78xx_write_raw_eeprom
Message-ID: <aa78dff4-d572-4abc-9f86-3c01f887faf1@kadam.mountain>
References: <20231019084022.1528885-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019084022.1528885-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Oct 19, 2023 at 04:40:23PM +0800, Su Hui wrote:
> check the value of 'ret' after call 'lan78xx_read_reg'.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> 
> Clang complains that value stored to 'ret' is never read.
> Maybe this place miss an error code check, I'm not sure 
> about this.

There are a bunch more "ret = " assignments which aren't used in this
function.

regards,
dan carpenter

