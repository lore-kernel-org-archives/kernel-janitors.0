Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78937C7EE22
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 07:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240529AbjEOHN3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 03:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240483AbjEOHNX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 03:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B20810FF
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 00:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1684134755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xwF3bMtKzTBdMVk3tiqEPsRCHZdEoAnjzKN67iE7ThU=;
        b=huMcrnHTpcxOYc/brtNEhEIbtjGgW3YLGQQZacxvfJ6KZCrSb/KH2+RLSeK+kd3ZDMcrg7
        5z2HvtsIa8RHKrhosxAxM+VJgOiswOS75p2LKziTkSjpe6RCpuhNbdZhFJhVRRmxocNWpI
        uFF8bE3FGyX596yFMkhSv15zR4q11bI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-DPE9bQePOSuoktAa5LAEtQ-1; Mon, 15 May 2023 03:12:33 -0400
X-MC-Unique: DPE9bQePOSuoktAa5LAEtQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-50d89279d95so22336383a12.1
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 00:12:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684134753; x=1686726753;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwF3bMtKzTBdMVk3tiqEPsRCHZdEoAnjzKN67iE7ThU=;
        b=Udqo8CvHODuuugNqNhvr2ahn680MXYjRS/wwQREyzTerV+KBDp4DliCq862M7fwRXg
         Hxaht00czVIiE9fREZ+k6a0RGNvHJ/aSK2KQZlHCkCmtvLXYpivOEYr3G2w/lTwAcqBK
         vVdzGOByX0qh9pygIHMHBoAe57ODvhMck2D0g5KMakom1UpIcvapiBhvmbPRCdeusIaG
         kqIo8YBzJRvKSvCHALZ/p9js7bSvDmfTr4RW6yZzwI7JZsm5gG6PI183Hh3bxZ7Pms3j
         RGsrBac2ANQ8YrnXOIu5REkmLldz33al2LilvQFwMRPMAAnDh3meg7KRrwD9l5J8vGo7
         ekUw==
X-Gm-Message-State: AC+VfDzJQ+87+JftZi88TxhDelJc1J/K/9gl6F1goqp+NS+GZNJqOLlo
        7swtnmjCUc6TzT+6na4UuROWjmxO+kam7q3QY4M3x33cowxy4LkZjsSErejkp7fgLd/K2cudqwg
        0/HvsyutJ9b7KjgxHRTN0ZEcMUiD6
X-Received: by 2002:a17:907:2d0e:b0:967:13a3:d82c with SMTP id gs14-20020a1709072d0e00b0096713a3d82cmr24677030ejc.26.1684134752850;
        Mon, 15 May 2023 00:12:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6roqpg5jE0hXDmdOedggiZFhhlASXlWjExoRB/ZX0m8zeiDXY1K7sjvx8CPHbp5waK9vPFwQ==
X-Received: by 2002:a17:907:2d0e:b0:967:13a3:d82c with SMTP id gs14-20020a1709072d0e00b0096713a3d82cmr24677011ejc.26.1684134752575;
        Mon, 15 May 2023 00:12:32 -0700 (PDT)
Received: from [10.39.192.162] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090660d400b00965ac8f8a3dsm9178766ejk.173.2023.05.15.00.12.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 May 2023 00:12:31 -0700 (PDT)
From:   Eelco Chaudron <echaudro@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Pravin B Shelar <pshelar@ovn.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        dev@openvswitch.org
Subject: Re: [RESEND PATCH net-next] net: openvswitch: Use struct_size()
Date:   Mon, 15 May 2023 09:12:30 +0200
X-Mailer: MailMate (1.14r5964)
Message-ID: <7EFC8D77-C24C-433E-8E8B-FBCF4387A7CC@redhat.com>
In-Reply-To: <e7746fbbd62371d286081d5266e88bbe8d3fe9f0.1683388991.git.christophe.jaillet@wanadoo.fr>
References: <e7746fbbd62371d286081d5266e88bbe8d3fe9f0.1683388991.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 13 May 2023, at 9:25, Christophe JAILLET wrote:

> Use struct_size() instead of hand writing it.
> This is less verbose and more informative.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Change looks good to me.

Acked-by: Eelco Chaudron <echaudro@redhat.com>

