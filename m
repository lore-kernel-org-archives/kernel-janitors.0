Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB80C433DB
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E17ED6146D
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355246AbhCDAVq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbhCCPFw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 10:05:52 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1A7C061761
        for <kernel-janitors@vger.kernel.org>; Wed,  3 Mar 2021 07:04:58 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id f33so23790650otf.11
        for <kernel-janitors@vger.kernel.org>; Wed, 03 Mar 2021 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=awzIJukxIn3496jKn3aKkaMrZCk6YH4VW3bDiugzALY=;
        b=RvRlGkNcFhWi7u1KmBynlduvXvAvc5OgEvxiJvS8PkXgDfg5eLyypszajtTEC3vJcT
         g+M4/ctfXdbDVaf8d2jFcnHfHSWvEj770ZYER3fDS8ZqspeBmhnyCqerqOnTROD8Kmyv
         FGC5mJ414a341MXNhLGFui63z4U8M27ryMOYVGqbAyfpRTfrc2k65TcW/eWR2nB5OF1i
         zE0viYtCfNdF5ZmLuBKaPRCj5g5bg7zHsoAqcciTUEs0nyEQ96k1tVCb2UDiHUm66baO
         +cyAectTSxRsmkOMK9NTlCGwqJijr91TYjvbLEi9ySDKzYKjsbNdBjzRB61RDlYvzxKE
         ktDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=awzIJukxIn3496jKn3aKkaMrZCk6YH4VW3bDiugzALY=;
        b=JGQCinkIy3VYo1Yi7/jiL3g40XhJCQwgS8lSUPsl6W4oF436SLdQpDe3B6L5uz4ugG
         KkCLDHQJXzV6j4MZwl5CaOYYXMLhZEVkNnrb1KuWi5tKu9MtxZ8zz2FPU22IsMUX8NLQ
         ExrbsLEPM2JwmMIN0QHm3Yu4v0oeRM0v2UVJCg4PHHvBjMDQd1NCTtuzjLzH9ce7BCJx
         390BjcrHFf8qX+1O1lkJzc2FQuVwa3Hrm3kxLaSG38Vq7cwhujWj8TPJ4y2ElOjV12d3
         oagtJ1KEK+Re3UCNlRGcGQoDoUIKWUaz5/fRPomjKnJEQikmAMNt3RcuPCHRRwfXU8Vr
         SKZQ==
X-Gm-Message-State: AOAM533aoZWfHeNFKajdgqcO/JhIf2tLeGAFmEubWWTPn8zE6uJdQ7hE
        NEqipdFKz6ZVEXDIvKzT53oMaMZgMfsABRpNAA/sPvXx
X-Google-Smtp-Source: ABdhPJzjEtQEJOeMzY2F5sci2j3avEqTW+zAuyAP1IMbYxRCWx1YIw/nrcT+hm+hR+SpmGexRmYpr1qyraOIoTWIEv4=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr11841920ota.311.1614783897805;
 Wed, 03 Mar 2021 07:04:57 -0800 (PST)
MIME-Version: 1.0
References: <YD4eZLCFU+fbTGIp@mwanda> <MW3PR12MB45540A69909BB5556C6E1C11F9999@MW3PR12MB4554.namprd12.prod.outlook.com>
In-Reply-To: <MW3PR12MB45540A69909BB5556C6E1C11F9999@MW3PR12MB4554.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 3 Mar 2021 10:04:46 -0500
Message-ID: <CADnq5_NsD2qkoTK9mJhhTLGi4hSP4b+MNMcg6=6xPYYCfWG4rA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix off by one in hdmi_14_process_transaction()
To:     "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        "Wentland, Harry" <Harry.Wentland@amd.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
        "Liu, Wenjing" <Wenjing.Liu@amd.com>,
        "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, Mar 2, 2021 at 2:26 PM Lakha, Bhawanpreet
<Bhawanpreet.Lakha@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> Thanks
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> ________________________________
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: March 2, 2021 6:15 AM
> To: Wentland, Harry <Harry.Wentland@amd.com>; Lakha, Bhawanpreet <Bhawanp=
reet.Lakha@amd.com>
> Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexande=
r.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Air=
lie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Dan Carpenter <dan=
.carpenter@oracle.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Siq=
ueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Liu, Wenjing <Wenjing.Liu@amd.co=
m>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-janitors@=
vger.kernel.org <kernel-janitors@vger.kernel.org>
> Subject: [PATCH] drm/amd/display: Fix off by one in hdmi_14_process_trans=
action()
>
> The hdcp_i2c_offsets[] array did not have an entry for
> HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE so it led to an off by one
> read overflow.  I added an entry and copied the 0x0 value for the offset
> from similar code in drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c.
>
> I also declared several of these arrays as having HDCP_MESSAGE_ID_MAX
> entries.  This doesn't change the code, but it's just a belt and
> suspenders approach to try future proof the code.
>
> Fixes: 4c283fdac08a ("drm/amd/display: Add HDCP module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis, as mentioned in the commit message the offset
> is basically an educated guess.
>
> I reported this bug on Apr 16, 2020 but I guess we lost take of it.
>
>  drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu=
/drm/amd/display/dc/hdcp/hdcp_msg.c
> index 5e384a8a83dc..51855a2624cf 100644
> --- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
> +++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
> @@ -39,7 +39,7 @@
>  #define HDCP14_KSV_SIZE 5
>  #define HDCP14_MAX_KSV_FIFO_SIZE 127*HDCP14_KSV_SIZE
>
> -static const bool hdcp_cmd_is_read[] =3D {
> +static const bool hdcp_cmd_is_read[HDCP_MESSAGE_ID_MAX] =3D {
>          [HDCP_MESSAGE_ID_READ_BKSV] =3D true,
>          [HDCP_MESSAGE_ID_READ_RI_R0] =3D true,
>          [HDCP_MESSAGE_ID_READ_PJ] =3D true,
> @@ -75,7 +75,7 @@ static const bool hdcp_cmd_is_read[] =3D {
>          [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] =3D false
>  };
>
> -static const uint8_t hdcp_i2c_offsets[] =3D {
> +static const uint8_t hdcp_i2c_offsets[HDCP_MESSAGE_ID_MAX] =3D {
>          [HDCP_MESSAGE_ID_READ_BKSV] =3D 0x0,
>          [HDCP_MESSAGE_ID_READ_RI_R0] =3D 0x8,
>          [HDCP_MESSAGE_ID_READ_PJ] =3D 0xA,
> @@ -106,7 +106,8 @@ static const uint8_t hdcp_i2c_offsets[] =3D {
>          [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_SEND_ACK] =3D 0x60,
>          [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_STREAM_MANAGE] =3D 0x60,
>          [HDCP_MESSAGE_ID_READ_REPEATER_AUTH_STREAM_READY] =3D 0x80,
> -       [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0x70
> +       [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0x70,
> +       [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] =3D 0x0,
>  };
>
>  struct protection_properties {
> @@ -184,7 +185,7 @@ static const struct protection_properties hdmi_14_pro=
tection =3D {
>          .process_transaction =3D hdmi_14_process_transaction
>  };
>
> -static const uint32_t hdcp_dpcd_addrs[] =3D {
> +static const uint32_t hdcp_dpcd_addrs[HDCP_MESSAGE_ID_MAX] =3D {
>          [HDCP_MESSAGE_ID_READ_BKSV] =3D 0x68000,
>          [HDCP_MESSAGE_ID_READ_RI_R0] =3D 0x68005,
>          [HDCP_MESSAGE_ID_READ_PJ] =3D 0xFFFFFFFF,
> --
> 2.30.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
