Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FEBC74A44
	for <kernel-janitors@archiver.kernel.org>; Tue, 14 Mar 2023 18:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbjCNSbA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 14 Mar 2023 14:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCNSa6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Mar 2023 14:30:58 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5CA3196BD;
        Tue, 14 Mar 2023 11:30:43 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 403E07F9;
        Tue, 14 Mar 2023 18:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 403E07F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1678818643; bh=tX5BlomIMfjFk48N7G8zpaNKZ5y6cgHFSYOhFhTC988=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SNm3rP7qoJk1gDhJtcF0OKB8tpDPK1wFWcLrmQYtt6lkjPtUyh2kF7kZ8ZK4Oitws
         Nu2F+4kfSZYZROInIQw+uxQu0X5hiZ6nJDXshAxvh4M8KoGwFKWKcdnTXUewdPdAMS
         BYB8eyGhzsu8wB/aZINEtvR1Sm9QYJHXa5BTPqZjqxZkZYAO/YglJ67YuVVVFj2vl7
         WSKFEtN3u+PoCKZXYXDUBC7n0OSeh6jAnJ0NtiqMyQib96F7UINZJzzOlxyahTGQnV
         eTX+Y44pOhi/4uuSRUZ2EfHyHEl+Vzd4bRjEpaoVKLpIi3vdDE3lkkaKqoLLpCF+CM
         VCDwVCAFuARlg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
        device@lanana.org, unicode@lanana.org,
        "H . Peter Anvin" <hpa@zytor.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 0/2] Updating information on lanana.org
In-Reply-To: <20230307144000.29539-1-lukas.bulwahn@gmail.com>
References: <20230307144000.29539-1-lukas.bulwahn@gmail.com>
Date:   Tue, 14 Mar 2023 12:30:42 -0600
Message-ID: <87edprrxrh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Dear Jon,
>
> please pick these two changes that update information in MAINTAINERS and
> the kernel documentation on the actual state of lanana.org.

Done, applied.

Thanks,

jon
