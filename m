Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E23C77B61
	for <kernel-janitors@archiver.kernel.org>; Thu, 27 Apr 2023 23:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344370AbjD0XBI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 27 Apr 2023 19:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344315AbjD0XBH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 27 Apr 2023 19:01:07 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5903268B
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Apr 2023 16:01:06 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b9f00640eso2060708b3a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Apr 2023 16:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682636466; x=1685228466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEIv0mpPqT6iAHQ12FfnifyqYoeAQW4rrtrDxVFk1U8=;
        b=Do9/pqSIjG1lwOjGDZ90CWJjHVOBweqpeo0Zs/cqh502uf8tNs+7ry8nJci/0hYzvw
         VxTLFS1CaC7cfPWLwL7Xn1IwAEM7cahAGBIvx6/NEtqeGvjDeZ68+eed7WpYXGFxl7ec
         4EWirWJfUxVNUh5CXYuucg0SDYJtmd9L6HJfkNc6XtcQeWpAirjDxNi5M9+K1JmccXCO
         vPpn8p+5DT/LzB9Y+UZE8sL4aWzSnR5E24wTwMqmXmN6IZYznyDvlFnFO8MvajagvmmD
         pf3GY4yYkBH6jVSoq2VQaqdS7gMYynCinRL/cnQ+gZRNMuFi1oOMRqOdhxuzzqlp0zfI
         45BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682636466; x=1685228466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEIv0mpPqT6iAHQ12FfnifyqYoeAQW4rrtrDxVFk1U8=;
        b=eQWyR44Zv2YjKp/i8tS36sBnlW8VnZsM13EfxIyaCI2qv6Q17czqywjRyYA48c3P3E
         aJ6sA+wbFN6sAqyR/XhZJvyH/4nJ5Wlc3fi5mNWKsu8ix7ciyfI3P2GaLG6CQSoXyogR
         6TV85ecM4PSCS1T/50mGmk8BzaJwY0ORP7ybFGlH4XxbUN8gDz5XYEDWIVaLl3RqDftp
         QMCAwBVv7weHVUL6cedmqXjKY8OL0+ixaMdAesgqNf32QfBhT6N768vOvqHkqeIAxox4
         X3LgZDo0KM857hUBQS8GV/9SckDDd1YjzIHq+DSIcnn1/HqnFZM6og3q6DA383Xc8ADC
         cBUA==
X-Gm-Message-State: AC+VfDwPq9sFhUkZX32oGbALcCkA3KmOAo5wrPt3/1D1+X78FCzmXfHr
        Ir90sVfY/CnlIlttbFl9rfYIeYM0cuO5IME5iO0=
X-Google-Smtp-Source: ACHHUZ4agbOrasu1chzWjy354jO+EEIA67oWUAcf7l6h4rFBDwFZ9No+KBZyh7mgI5P40TQdekIg6Q==
X-Received: by 2002:a05:6a20:440d:b0:f8:ea21:7c4f with SMTP id ce13-20020a056a20440d00b000f8ea217c4fmr3472983pzb.5.1682636466237;
        Thu, 27 Apr 2023 16:01:06 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id f17-20020a63f751000000b00502ecb91940sm11903029pgk.55.2023.04.27.16.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 16:01:05 -0700 (PDT)
Message-ID: <3decbaf1-250b-9b73-70fd-4cb9a204c452@kernel.dk>
Date:   Thu, 27 Apr 2023 17:01:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] nvmet: Reorder fields in 'struct nvmet_ns'
Content-Language: en-US
To:     Chaitanya Kulkarni <chaitanyak@nvidia.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sagi Grimberg <sagi@grimberg.me>,
        Christoph Hellwig <hch@lst.de>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
References: <aea924d31f2bd2f740b1ccc6f462905bd6cab763.1682624855.git.christophe.jaillet@wanadoo.fr>
 <ba5df67e-534d-6f79-6277-80c755ca7e94@nvidia.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ba5df67e-534d-6f79-6277-80c755ca7e94@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/27/23 4:59?PM, Chaitanya Kulkarni wrote:
> On 4/27/23 12:47, Christophe JAILLET wrote:
>> Group some variables based on their sizes to reduce holes.
>> On x86_64, this shrinks the size of 'struct nvmet_ns' from 520 to 512
>> bytes.
>>
> 
> Although this looks good, we at least need to document what
> happens on other arch(s) which are not mentioned in the
> commit log ? is there a possibility that someone might come
> up with the contradictory data in future for the arch(s) which
> arch that are not mentioned here ?

The change is certainly not going to make things _worse_ for any arch,
so I think that's somewhat of a pointless exercise and an unreasonable
ask for something that makes sense on 64-bit arm/x86 and saves half the
space.

-- 
Jens Axboe

