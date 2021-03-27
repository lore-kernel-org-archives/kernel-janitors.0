Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EBAC433C1
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 14:45:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3DD3619AB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 14:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhC0Oom (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 10:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhC0Oom (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 10:44:42 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDCBFC0613B1
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Mar 2021 07:44:41 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id j11so7475250ilu.13
        for <kernel-janitors@vger.kernel.org>; Sat, 27 Mar 2021 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BXtzfODoTNZz35d2SUT5fneEA+e5CsUTfnR6fOoZbTQ=;
        b=dP0XHt8kftvgIuKnyjyto4iaY2A73qxMmyjLXoCp2FEgahARSrbNcVYdj0yJzPqLQn
         xjlmmYRyXllTO5iumiOOreUxaqycOuRIrmQmdW4PF8Rkpae6kmayo8xHdq96pSI2FzXE
         nzNguQdG912tQ6k0KTnpm9Eu2RFSKlB0JXKXLpIRAgChyPQBP8aLyn5w8azEbp5g6sYP
         d6xwDWdRVedMx80ImxIQ0ekdbJ/Dj3clivDT7sb2w8S8ro8Qi+28KnSYxPRBM3t7ujiT
         ss0XLoopGDLxLlmC9D2If8MFV5LtihuSaXvKeJ94n4lTi5C8WJ/nwAGVTrw9jaT4tGGK
         NQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BXtzfODoTNZz35d2SUT5fneEA+e5CsUTfnR6fOoZbTQ=;
        b=ke6xusThzleWkCOPwpF3G00qHJ7K7V8SuEY+ht6og6T8zt8vli9/SERWJ4B6cjFKAW
         tKN6ROZpJqkEmgT7iknpogJ6K7cqjVOB1C/vnsZuabCDnQLQwezpV4rEQHno3z+u+6MT
         6VXjF14p/H9Jux37KWa2g5dn/FXoKUFARLbqIT6zOiXrm4vmomdB8tPTHEwBguy4202w
         0zm3dAqEdOAaemV6JoA+94Dw8aPqRiN2oXh9IHVam8xgM5E2EvKr1p+LFNo8xshljCKx
         a/BTPfRYkdjaOf6BEIh5cS0Ju553pDGbYalYXRE9dRpjfpgmvBNjKE5Hl36JITkxaOV5
         MeAA==
X-Gm-Message-State: AOAM530svCy8p2rucnTfaKgqjjr2Eu37GW2WSLrNOl/sJOYxYJKOcdQ2
        GXXKMXeFx3HOCiIyBcUP26z2u9b2N9mb+MnLyEY=
X-Google-Smtp-Source: ABdhPJyeoXNRGaZpD87mDIphQzar9i9dcf55V704fpQ38WqRChCjHfd5FQ5LksqW3js5uvdFp1AWHbEJCm9E+rBNuOU=
X-Received: by 2002:a05:6e02:b2b:: with SMTP id e11mr5673970ilu.149.1616856281261;
 Sat, 27 Mar 2021 07:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210327001736.180881-1-eantoranz@gmail.com> <20210327001736.180881-5-eantoranz@gmail.com>
 <20210327081758.GJ1667@kadam>
In-Reply-To: <20210327081758.GJ1667@kadam>
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date:   Sat, 27 Mar 2021 08:44:29 -0600
Message-ID: <CAOc6etZaqnDXU4dgBmx_qd8iwpmEjDhs=7JnLuCUFxs65=TRHQ@mail.gmail.com>
Subject: Re: [PATCH -next 5/6] staging: rtl8723bs: mark some variables as __maybe_unused
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marco Cesati <marcocesati@gmail.com>,
        Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Mar 27, 2021 at 2:18 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This is just papering over badness.  Leave the warnings as is so someone
> will notice it and fix it properly in the future.
>

Interesting.... I wonder what the right way to handle this would be
then. Is it a more appropriate solution defining the debug macros
_only_ if we are debugging and then also use #ifs in code to define
the variables and handle them?

So, currently, in rtw_debug.h, we have this (lines ~134-140):

#define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData,
_HexDataLen) do {} while (0)

#define DBG_871X(x, ...) do {} while (0)
#define MSG_8192C(x, ...) do {} while (0)
#define DBG_8192C(x, ...) do {} while (0)
#define DBG_871X_LEVEL(x, ...) do {} while (0)


And then, a bit further down the road in the same file:
#ifdef DEBUG
#if defined(_dbgdump)
    #undef DBG_871X
    #define DBG_871X(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)

    #undef MSG_8192C
    #define MSG_8192C(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)

    #undef DBG_8192C
    #define DBG_8192C(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)
#endif /* defined(_dbgdump) */
#endif /* DEBUG */

If we remove the definition of the macros that were around line 134,
we need to make sure that those macros are not used in code if the
same conditions are not met... so, it might mean that we control if we
define the variables we are using... one of the examples from this
patch:


    unsigned char *p, *pos, *wpa_ie;
#ifdef DEBUG && defined(_dbgdump)
    unsigned char * reassoc;
#endif
    unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
.
.
.
    if (frame_type == WIFI_ASSOCREQ) {
#ifdef DEBUG && defined(_dbgdump)
        reassoc = 0;
#endif
        ie_offset = _ASOCREQ_IE_OFFSET_;
    } else { /*  WIFI_REASSOCREQ */
#ifdef DEBUG && defined(_dbgdump)
        reassoc = 1;
#endif
        ie_offset = _REASOCREQ_IE_OFFSET_;
    }

    if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset) {
#ifdef DEBUG && defined(_dbgdump)
        DBG_871X("handle_assoc(reassoc =%d) - too short payload (len =%lu)"
             "\n", reassoc, (unsigned long)pkt_len);
#endif
        return _FAIL;
    }

> regards,
> dan carpenter
>
