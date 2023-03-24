Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA25FC6FD20
	for <kernel-janitors@archiver.kernel.org>; Fri, 24 Mar 2023 08:27:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjCXI1C (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 24 Mar 2023 04:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbjCXI1B (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Mar 2023 04:27:01 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B6525B9C
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Mar 2023 01:26:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eg48so4626770edb.13
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Mar 2023 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679646418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMK8N+uW1xIMv8pFUrJlsRKDsRw1dlAiL2CT5NysWvI=;
        b=VkJGjoZeet6GdGAtiIVqYDaZ+dGx2Kqi6tYlzgnCQaQFYRs7+4tgq90DqJCBithiUJ
         GPWdhr+tFy+EkOV79dgC4rFZTHMQYrrkgxqgoTLir0xXGN/pvAvHFKrgSymkQKsujIfW
         BczTBFzM6HWnWrEYDpXOrDr9f4fSdlTegq9rt7NUGAKD0jXXOFkRYRqcWgoblSO640g/
         +vRo0K5BRjfMQVRnzileyjBc6McOSFlABMWkurFgEqZXb0MKCYfc12IsAaR5N2qn7bX/
         i9RdDRPFTX5xW7tvz9CNR7bxr2vQmYrmCjl9XbC3yavvdGBW3aiyKxvzz0X8+0ClFvwo
         aS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679646418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMK8N+uW1xIMv8pFUrJlsRKDsRw1dlAiL2CT5NysWvI=;
        b=uNKlTX4gfcKKU7w4hk0HcoRNmRSMSkCJduF/SEp//rNzs/Eh3OwLDB0ed3AlLXiUz0
         iaUlxTsMvwFkopEBC/s6ugG5IS/rbL1fGbtVxriHviJ3+ih+V/lkQ4PXXFSOw3BNqlH2
         1MaE8ejc0FzrEY77UeKBLwjETnOoKFGRyP2U5Cb0vQqpZIy6TbTMWdgCu4+GvD23Pgak
         ILi1VDVGI+W+HA25hFNsk5VeHa5l+QtH4kVEPqHTRSC2ZUBIRA9h2lMzQnPcbIUjCOJx
         1c3yrUp+ng07zgZnAwadbG4J+B7UPNO2n9r4sNPRvUmYWNitnWE4peyuzfUl+FsVzGF7
         l7VQ==
X-Gm-Message-State: AAQBX9cJ9zlaYosLKtlfQ9Blo3RPdcIBF/ywaUZpkN7vL4S2QtEpz9g6
        dRkDAKnfwzHewCRI5HMnfO80dw==
X-Google-Smtp-Source: AKy350aoXQWcPH+E3C+mxIDLEpYt9lK6TGHWgh3btJpBgFoZJKlnDgQa4HY94LxHDQITBl8eZGjdIA==
X-Received: by 2002:a17:906:2484:b0:930:8a26:eed8 with SMTP id e4-20020a170906248400b009308a26eed8mr1798359ejb.71.1679646417983;
        Fri, 24 Mar 2023 01:26:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373? ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
        by smtp.gmail.com with ESMTPSA id v14-20020a1709063bce00b0093344ef3764sm8028317ejf.57.2023.03.24.01.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 01:26:57 -0700 (PDT)
Message-ID: <eb05ac50-fda2-8324-1fd9-fda8579dfd8c@linaro.org>
Date:   Fri, 24 Mar 2023 09:26:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] MAINTAINERS: remove the linux-nfc@lists.01.org list
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc:     Bongsu Jeon <bongsu.jeon@samsung.com>,
        Mark Greer <mgreer@animalcreek.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230324081613.32000-1-lukas.bulwahn@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324081613.32000-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 24/03/2023 09:16, Lukas Bulwahn wrote:
> Some MAINTAINERS sections mention to mail patches to the list
> linux-nfc@lists.01.org. Probably due to changes on Intel's 01.org website
> and servers, the list server lists.01.org/ml01.01.org is simply gone.
> 
> Considering emails recorded on lore.kernel.org, only a handful of emails
> where sent to the linux-nfc@lists.01.org list, and they are usually also
> sent to the netdev mailing list as well, where they are then picked up.
> So, there is no big benefit in restoring the linux-nfc elsewhere.
> 
> Remove all occurrences of the linux-nfc@lists.01.org list in MAINTAINERS.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/all/CAKXUXMzggxQ43DUZZRkPMGdo5WkzgA=i14ySJUFw4kZfE5ZaZA@mail.gmail.com/
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

