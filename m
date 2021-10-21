Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F215C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Oct 2021 21:51:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1754E61208
	for <kernel-janitors@archiver.kernel.org>; Thu, 21 Oct 2021 21:51:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhJUVxr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 21 Oct 2021 17:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhJUVxr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 21 Oct 2021 17:53:47 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E6AC061764
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Oct 2021 14:51:30 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id o133so1848075pfg.7
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Oct 2021 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=iIjOjRuuF69t6HmfV6mNW7nAeVgMNixa2oJL1/ZOiQg=;
        b=Z5m6QWz3AQaqJWA63h4Y1HANpmqTbvh8iX2KIJi1KsrNmJV61jA6eFzYvAa9OmdFr2
         CSQDgS9+cij1C9LrSPJ1Zp5ahQyWdi2P05pyAajvpLDq9ZeA+v0xxlcNw8RfdFl7Y9TQ
         kMp5brDQeT2CghqocReyzqfzk/18jbPr6ggOjPtmRjQdAicM2N4zAV2fHgFv2LcwRj9y
         umFzGoS2bdMqdN75/arbJhubAmjDGhvnqe8SDGQrxyvAIOf1o+m83gzPe4NRjx7J4ogq
         dSqjnnrSkoiLUDEjticgCK+46rTNdwXe+mfJ5Y7hZv4kBQg6FWWe6MCSSrOAQfbe3Ji9
         vDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=iIjOjRuuF69t6HmfV6mNW7nAeVgMNixa2oJL1/ZOiQg=;
        b=t8THiCysRoV3pbXdiUvKmpJH9PF8QcvKZVW7bczQ5n8LExYPcGtYBXmehrk638sM9B
         YETK/9OxXUzzlTdIv1Yj+UZaaAuVthJFaJWU4H7KUx1UPVlgXGS7kf2mKRyM4Z/VCPLR
         Km0xI3qaWJU5GO53GNO1hR0vON5iB4Gg7roPHGZJtq00ieVpp4P1F7gbI9oyW0UJw0bJ
         94NzlvnWdM2hL3eMolEaXwe26hkekGdL9jxx200Eitstxq/QjeyWAKC8pJT+MI6R7M8g
         REQUZ5u+ad8EvVyplc1krNF3jY18xq4v0TjIofTo1euREszAGAQbxMrg7T84Q5cpKTkJ
         c9tw==
X-Gm-Message-State: AOAM531eCBHZmwqw5GbdZ2gbAIdiCvc4vvhy8vT55JxBCaW72c5ynLPv
        DzNrcWnKqKNnmBJg1vHRf7Vixw==
X-Google-Smtp-Source: ABdhPJx+KdjsmowFFTshMv4kNktiSr9Nyaw7YXblCPr5iXukUmhP3B3jLEvS4as89EdK4LJkjWJ9yg==
X-Received: by 2002:a63:df49:: with SMTP id h9mr6314184pgj.198.1634853089868;
        Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:4ba5:eac8:81d9:3e28])
        by smtp.gmail.com with ESMTPSA id i8sm6943807pfo.117.2021.10.21.14.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
Date:   Thu, 21 Oct 2021 14:51:29 -0700 (PDT)
X-Google-Original-Date: Thu, 21 Oct 2021 14:42:25 PDT (-0700)
Subject:     Re: [PATCH] serial: sifive: set pointer to NULL rather than 0.
In-Reply-To: <20210925224726.183360-1-colin.king@canonical.com>
CC:     Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     colin.king@canonical.com
Message-ID: <mhng-f84d7cb5-9eb5-40e2-bdc4-9bfdbd67f6d3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 25 Sep 2021 15:47:26 PDT (-0700), colin.king@canonical.com wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Clean up the assignment of sifive_serial_console_ports[ssp->port.line],
> this is a pointer to a struct sifive_serial_port so the assignment
> should be a NULL rather than a integer 0.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/tty/serial/sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
> index 0ac0371f943b..b79900d0e91a 100644
> --- a/drivers/tty/serial/sifive.c
> +++ b/drivers/tty/serial/sifive.c
> @@ -887,7 +887,7 @@ static void __ssp_add_console_port(struct sifive_serial_port *ssp)
>
>  static void __ssp_remove_console_port(struct sifive_serial_port *ssp)
>  {
> -	sifive_serial_console_ports[ssp->port.line] = 0;
> +	sifive_serial_console_ports[ssp->port.line] = NULL;
>  }
>
>  #define SIFIVE_SERIAL_CONSOLE	(&sifive_serial_console)

I'm assuming this was aimed at the serial tree, but LMK if someone was 
expecting me to take it.

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
