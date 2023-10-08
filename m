Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8C5E95A67
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 Oct 2023 17:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344915AbjJHRMG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 Oct 2023 13:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjJHRMG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Oct 2023 13:12:06 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE1BB3
        for <kernel-janitors@vger.kernel.org>; Sun,  8 Oct 2023 10:12:04 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-690d8fb3b7eso3411949b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Oct 2023 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696785124; x=1697389924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdDGhksNk+95G2Rk4jqSpCJbRS1WE04e+7m7Uoe1Ug8=;
        b=dBZytdHto7KRrS97jg4yn4uuKIm8AXHZ90ml0A9czb7D4Q1uM5+9OS7yqh1btoOXSQ
         QQp4VRrwNVKaRQl09RE/cn7Tl/P2DIAaUe8Tz/4v2LsmfvZZHnJ2Ibvw8kARoJfA8j2w
         v0xZnzdobwun9wI3rt551hG6Iv83Hv/MZzdB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696785124; x=1697389924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdDGhksNk+95G2Rk4jqSpCJbRS1WE04e+7m7Uoe1Ug8=;
        b=bdg5ggU09JwSrMYaFNL+sVtAHVxjb5ZuRylo+FH6iRJ5imMBKObxGyADohRGt/Qbbn
         V4v7zD+ldax7U5Znl1p738rskIB32XOrIM79Zu7SC0H9rMZgJcrYdYs4iyYLfAbUA5dF
         ZqPAi1AhIWAt2h1mUDwSflEJSNFb6FgCcg0P4FmQQIguzZ9hkXwgQAPaBkc9Ggoi/Hze
         +Z/SZxPD1smqGi0Y+sBxD2EA/UBAVZOAAHwP+tgX+0iFsP9fnvwxv1nWvfay36YUJtNJ
         HouVyXi3+X9wXdRzEB6MeORNkXYILINSht16p/Xf02UtshuESRjz8itjGRnbebpnI6KZ
         wL4w==
X-Gm-Message-State: AOJu0YzyUjl3CcMaUXwXqOLTC2jim3e3H3hsuZxjpXKqjrE8r69lWRrN
        4sFtbprq5ZIuTNC+VpwPJK80Bw==
X-Google-Smtp-Source: AGHT+IHHu6wejYufFLWQOKaw9Sok91yvolc0x+XXaNMoZPSzMAJuU/9qzMAG/BoOfXai94GB8wgegA==
X-Received: by 2002:a05:6a00:39a6:b0:690:fa09:61d3 with SMTP id fi38-20020a056a0039a600b00690fa0961d3mr17059096pfb.15.1696785124399;
        Sun, 08 Oct 2023 10:12:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k22-20020aa78216000000b0069337938be8sm4748906pfi.110.2023.10.08.10.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 10:12:03 -0700 (PDT)
Date:   Sun, 8 Oct 2023 10:12:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Bryan Tan <bryantan@vmware.com>, Vishnu Dasa <vdasa@vmware.com>,
        VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-hardening@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH] VMCI: Annotate struct vmci_handle_arr with __counted_by
Message-ID: <202310081009.045F3E99@keescook>
References: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56bef519d982218176b59bbba64a3a308d8733d5.1696689091.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Oct 07, 2023 at 04:32:34PM +0200, Christophe JAILLET wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch is part of a work done in parallel of what is currently worked
> on by Kees Cook.
> 
> My patches are only related to corner cases that do NOT match the
> semantic of his Coccinelle script[1].
> 
> In this case, something similar to struct_size() is implemented in
> handle_arr_calc_size().

I think this should likely lose VMCI_HANDLE_ARRAY_HEADER_SIZE entirely
and the helper to use sizeof() and struct_size() directly, but probably
as a separate patch.

> 
> Note that I'm slightly unsure on how things will behave in regards to the
> krealloc() in vmci_handle_arr_append_entry().

It looks correct to me:

                new_array = krealloc(array, new_size, GFP_ATOMIC);
		...
                new_array->capacity += capacity_bump;

i.e. "capacity" is adjusted up before accessing any "entries".

> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> ---
>  drivers/misc/vmw_vmci/vmci_handle_array.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/vmw_vmci/vmci_handle_array.h b/drivers/misc/vmw_vmci/vmci_handle_array.h
> index 96193f85be5b..b0e6b1956014 100644
> --- a/drivers/misc/vmw_vmci/vmci_handle_array.h
> +++ b/drivers/misc/vmw_vmci/vmci_handle_array.h
> @@ -17,7 +17,7 @@ struct vmci_handle_arr {
>  	u32 max_capacity;
>  	u32 size;
>  	u32 pad;
> -	struct vmci_handle entries[];
> +	struct vmci_handle entries[] __counted_by(capacity);
>  };
>  
>  #define VMCI_HANDLE_ARRAY_HEADER_SIZE				\
> -- 
> 2.34.1
> 

Reviewed-by: Kees Cook <keescook@chromium.org>


-- 
Kees Cook
