Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7768AC77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 07:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235274AbjEWHF7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 03:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbjEWHF6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 03:05:58 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91225118
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 00:05:53 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3095557dd99so4253282f8f.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 00:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684825552; x=1687417552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lK0FbIRIU3vRu14qlzr2pPFF9QsFl229avcXo3OZVb4=;
        b=ltWNi/Ovu+Y0LtOwMv9XC7UwQCaBPib0inFJtmQUu6FWYA8voz0YkccytfW/HmsUT0
         dIkIs2pMYH9iBuS5JZUABVjx7IfXXz6kJ5nBuaQLVRfhIuIAsO42iJUzptnrW/qn/6cS
         jh1WrWPm9G+lRFljum30CIDHkyCirMKPSAoYq3jbLlBFpBfNeKmD5p1oWZMPr+U/zHBn
         3hDaYJPOzT/w4tXOAtx5m1jqDhdUMorK1DSCLJ5iSe04LKaDUdmeBmuwyNJ5vIIRMBN6
         zDgF8xrHafaxpwhzuiGVboPWkdpALW8qF/OlYzErq9ka+TBUuJuzbPgJoFO1/NcvicMO
         ohxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684825552; x=1687417552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK0FbIRIU3vRu14qlzr2pPFF9QsFl229avcXo3OZVb4=;
        b=asV3YJ85BGD/m/ASSDKPXHrPDAvMgkY71q1jKAHKYc+o15JiTdcAT9EI6cMlfEqoc+
         v8F1dgA/lm1WhME1S7OtZicuD3A+M0JbkztROblNN7w5zKpk/tCqyYymgyRqYNqbxstm
         J/23phI/vFjG5VKAAk06hPILuM1aTLIuOOS61yANg3JIdMLbpcw/rL154m0vxerVwqy/
         5tHPcj92EY5Vql3tESZeS1HZYTq2wDdKe/zAblwkMlWHiq7cI6JD1iZqt6umZPS5LmYf
         9lp5UlpCF8CXc6ExkFJwyXkClnIcQmDlLL3scH++DiKxQly7QNJqJV+9e+QRIqzRe17f
         zqcg==
X-Gm-Message-State: AC+VfDzq7oD6YbGpnUjV0VGfzbFUuHteT8lRX+kg83ikN2Y/46MtM59o
        BgdQJoNZUdKbEPQ+gfL1FFPQ1UiDeCSlJBni9KE=
X-Google-Smtp-Source: ACHHUZ4iZ9w3Br7aj/u4JCbG1/68MLmy50VAHu+zhSShAqCVeTRVEy8L0hvXV+NBg0asbp8H7v2myA==
X-Received: by 2002:a5d:40cd:0:b0:2c9:e585:84b0 with SMTP id b13-20020a5d40cd000000b002c9e58584b0mr9015110wrq.1.1684825552047;
        Tue, 23 May 2023 00:05:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a056000010200b002ca864b807csm10278389wrx.0.2023.05.23.00.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:05:49 -0700 (PDT)
Date:   Tue, 23 May 2023 10:05:45 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Su Hui <suhui@nfschina.com>, Jeremy Kerr <jk@ozlabs.org>,
        Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>, eajames@us.ibm.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        cbostic@linux.vnet.ibm.com, linux-fsi@lists.ozlabs.org
Subject: Re: [PATCH] drivers/fsi/scom: Return -EFAULT if copy fails
Message-ID: <413f4e50-b722-427f-ab30-d320efe71cc0@kili.mountain>
References: <20230519013710.34954-1-suhui@nfschina.com>
 <de9a7ffe-bedd-4181-886d-c9a3006b7be8@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de9a7ffe-bedd-4181-886d-c9a3006b7be8@roeck-us.net>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 03:30:06PM -0700, Guenter Roeck wrote:
> On Fri, May 19, 2023 at 09:37:10AM +0800, Su Hui wrote:
> > The copy_to/from_user() functions return the number of bytes remaining
> > to be copied, but we want to return -EFAULT to the user.
> > 
> Why ? EFAULT means that a bad address was provided, and it is not
> immediately obvious why that would be the case.
> 

Right now the function is returning success so that's definitely wrong.
The copy_to/from_user() function will only fail if a bad address is
provided so -EFAULT is correct.

There is a different Smatch warning for when people return a different
error code such as -EINVAL.
drivers/fsi/fsi-scom.c:337 scom_read() warn: return -EFAULT instead of '-EINVAL'
The return affects the user and -EFAULT but that level of pendantry feel
like possibly too much?  There aren't many instances of this warning.

regards,
dan carpenter

