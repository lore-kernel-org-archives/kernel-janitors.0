Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEBEC4167B
	for <kernel-janitors@archiver.kernel.org>; Thu, 15 Dec 2022 13:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLON4t (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Dec 2022 08:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiLON4r (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Dec 2022 08:56:47 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA4792B24B
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Dec 2022 05:56:46 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id f18so3125926wrj.5
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Dec 2022 05:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbemP1c6S3PEakTONQ8dO0tUgJCGKV85raRDtlD30Lk=;
        b=Hn3Esh0h2FM4H2DbBj0RLkKsjdbfrbvPiM5b9LTsPHoJ8CC4VxNPs2SOwj3n3/CkO8
         Y7lROIJ2jFHShoTW/nNUiB1UWFQEI5kEe8RBv7acWUWkokZNP0Vuud5LSOyE3lCfFciQ
         dl229GYl8VCKynv8IQcECNlTQYZcKWSYLjvXlw+AYZPxPIjVwDJzlVyIOm+q41iLWvF+
         VJZiBS/zPuVBJoBqOt6YJcdI5cbN/HtQXnlCf2SeUmw9U8H9/vBRcjoICpqO0ZpfLtdW
         opEQbBCrNnop5JRk6GBLidK4VMx8TLvUAFN06ArrkwF60lmXeY5ep9aKSfHASPD/nPD7
         vhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbemP1c6S3PEakTONQ8dO0tUgJCGKV85raRDtlD30Lk=;
        b=LSG9EXfbFMt21KzFIDMuLExrVex006FpaYch2UW+kWTOs8yTD3eF+ffhm6RynYvcK/
         HbW0yHaZSFKM1yTAxawWyV803+qqWBpgzNHxJJpjOOzGI4NefA+Q29IhN4nXpcIJSAiM
         TGvhg/0qmtn+b+exc3B3FmPRo1dpyEI3HHpC2lF5bvtKS1L3Q4i7MA1Dme9wbptxFcx1
         7b4j9NUGGlyoRjuFv0BZ4MAYAZT+oEJlznym8jLzZbpr2TWmrgIcwWOaXhB6kcgGcQvN
         vqoYiUC3niItP5Iw8tTgjAuVv+hpKMorpXovJKhLb3eBtC3haM5EMM9LsbE7S7KubKfM
         WrsA==
X-Gm-Message-State: ANoB5pnAyatSwevgQYtTbPTrQURAEoc0Wch6L4WVrf4bo+0T4SGLrmUi
        Ap7j0FEcw0BBz6pvz16uPDZNuA==
X-Google-Smtp-Source: AA0mqf5P2tkunak3bS2XNL7OX59u+kq+GMZEm0DiLTs5w4tAK9lVOQ9z9TmiVktzcBMvgjAva6qzGQ==
X-Received: by 2002:a5d:5608:0:b0:244:bfaf:d352 with SMTP id l8-20020a5d5608000000b00244bfafd352mr18416383wrv.12.1671112604999;
        Thu, 15 Dec 2022 05:56:44 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id ck12-20020a5d5e8c000000b0022584c82c80sm6224720wrb.19.2022.12.15.05.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 05:56:44 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
        eajames@linux.ibm.com, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Aldas =?utf-8?Q?Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: Re: [PATCH] Input: ibm-panel - fix typo in comment
In-Reply-To: <20221213194855.260-1-aldas60@gmail.com>
References: <20221213194855.260-1-aldas60@gmail.com>
Date:   Thu, 15 Dec 2022 14:56:43 +0100
Message-ID: <87wn6sixd0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 13, 2022 at 21:48, Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail=
.com> wrote:

> "set the index to it's largest possible value" -> "set the index to its
> largest possible value"
>
> Signed-off-by: Aldas Tara=C5=A1kevi=C4=8Dius <aldas60@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/ibm-panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/misc/ibm-panel.c b/drivers/input/misc/ibm-pane=
l.c
> index a8fba0054..6be60bc8d 100644
> --- a/drivers/input/misc/ibm-panel.c
> +++ b/drivers/input/misc/ibm-panel.c
> @@ -101,7 +101,7 @@ static int ibm_panel_i2c_slave_cb(struct i2c_client *=
client,
>  		else
>  			/*
>  			 * The command is too long and therefore invalid, so set the index
> -			 * to it's largest possible value. When a STOP is finally received,
> +			 * to its largest possible value. When a STOP is finally received,
>  			 * the command will be rejected upon processing.
>  			 */
>  			panel->idx =3D U8_MAX;
> --=20
> 2.37.2
