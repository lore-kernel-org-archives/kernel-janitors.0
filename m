Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088DCC433DB
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 18:48:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C893661969
	for <kernel-janitors@archiver.kernel.org>; Mon, 29 Mar 2021 18:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhC2Sry (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 29 Mar 2021 14:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhC2Sr2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Mar 2021 14:47:28 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65199C061574
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Mar 2021 11:47:23 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id z9so12080384ilb.4
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Mar 2021 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egauge.net; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=pisDsURc1cBB1GPBwFAnnYsdUEWsfySg79F16WBDV7U=;
        b=CbpKY1suFtgV9qxCylHJMoV2sAUGtaiFGyZzoTqXnPKjtdUGO4IL+JS5Bp6H0EMqwc
         qc/q1pZtszUjQqRfX/W+o7HXOLXxOw0ILhE8lxiq/LL57FLy6XiTS+GzP9EhkBWxTXm3
         4RcZ6Z1cGqlK/DfcjBMq29ab+X3xWzQv8WU6wlgFh1ZKRMaf17aQLNqwaxe+eWTZvQfV
         7C7de7FlTF1a8kOif+XuvRXldL7vs3s9dTd/v7V5Q3EPMfiRcy4Uc0/fF5fJLoPBwvZv
         nPYZMOtCAio1Jli+vmdxAKQGV2W2wemJGEKQVxpHKfnmbLxLK7n7kLWwlCqPs2lACrMq
         Ybyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=pisDsURc1cBB1GPBwFAnnYsdUEWsfySg79F16WBDV7U=;
        b=fJ2qnQ23U6PD4IVV+sJp77eHHZVcz68Nx8uCbYMAqzE8NqQsp4MizeTZz2nde/hOXF
         g8N8V19pb9e5k07484RTh5QtcjtIvXun0abB9vThGDVhhb3xXsXMmO2L+FAlA+9PLVVZ
         mbHCoB97d4KRIPXGZuI1CAR6P/hBB3KRDUl8dzxqQ5lUPRulow0uchn2qmHruRnb3iHZ
         AqW1HSA2pgxgkdmFbvOngTS36wkEQqFpK4t1K0BVct1Sm7odQogrUJq/3Quo/hUWWKdx
         Hd71j3YS3xnTu5K7xUxXTaLE0svUGZxU8CsH8kP5OUkMUD8Q7hrSwIfLJ2vAaKtk4viw
         IrDQ==
X-Gm-Message-State: AOAM532gwYk6YjhBxLYRPZb38zD64OvfnD5HKVHAqgZh8pdVMAybwdDr
        5UGfbB0RT7P0Ur78V25gg1U3
X-Google-Smtp-Source: ABdhPJzFL0GKqndJrr15e7IOxLOA1u/JyUL18KtHLel/CW/9fZAp0ZYkPLx0eWLKzANnkWtvEyk/sA==
X-Received: by 2002:a92:c24c:: with SMTP id k12mr3188810ilo.75.1617043642850;
        Mon, 29 Mar 2021 11:47:22 -0700 (PDT)
Received: from ?IPv6:2601:281:8300:4e0:2ba9:697d:eeec:13b? ([2601:281:8300:4e0:2ba9:697d:eeec:13b])
        by smtp.gmail.com with ESMTPSA id 23sm10307392iog.45.2021.03.29.11.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 11:47:18 -0700 (PDT)
Message-ID: <37239c87142346dcba616cc63c64294dc274983b.camel@egauge.net>
Subject: Re: [PATCH] wilc1000: fix a loop timeout condition
From:   David Mosberger-Tang <davidm@egauge.net>
To:     Ajay.Kathat@microchip.com, dan.carpenter@oracle.com
Cc:     Claudiu.Beznea@microchip.com, kvalo@codeaurora.org,
        linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org
Date:   Mon, 29 Mar 2021 12:47:15 -0600
In-Reply-To: <cd087f6b-5f99-3bce-0015-ccf1a82625f2@microchip.com>
References: <YFS5gx/gi70zlIaO@mwanda>
         <cd087f6b-5f99-3bce-0015-ccf1a82625f2@microchip.com>
Organization: eGauge Systems LLC
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 2021-03-19 at 16:09 +0000, Ajay.Kathat@microchip.com wrote:
> On 19/03/21 8:17 pm, Dan Carpenter wrote:
> > If the loop fails, the "while(trials--) {" loop will exit with "trials"
> > set to -1.  The test for that expects it to end with "trials" set to 0
> > so the warning message will not be printed.
> > 
> > Fix this by changing from a post-op to a pre-op.  This does mean that
> > we only make 99 attempts instead of 100 but that's okay.
> > 
> > Fixes: f135a1571a05 ("wilc1000: Support chip sleep over SPI")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks Dan.

Good catch, but wouldn't it be better to fix the time-out check
condition instead?  Something a long the lines of:

--- drivers/net/wireless/microchip/wilc1000/wlan.c~	2021-03-29 12:44:52.066039259 -0600
+++ drivers/net/wireless/microchip/wilc1000/wlan.c	2021-03-29 12:40:29.176365116 -0600
@@ -457,7 +457,7 @@
 	u32 wakeup_reg, wakeup_bit;
 	u32 to_host_from_fw_reg, to_host_from_fw_bit;
 	u32 from_host_to_fw_reg, from_host_to_fw_bit;
-	u32 trials = 100;
+	int trials = 100;
 	int ret;
 
 	if (wilc->io_type == WILC_HIF_SDIO) {
@@ -483,7 +483,7 @@
 		if ((reg & to_host_from_fw_bit) == 0)
 			break;
 	}
-	if (!trials)
+	if (trials < 0)
 		pr_warn("FW not responding\n");
 
 	/* Clear bit 1 */


This way, the loop could actually get executed the number of times
indicated by the initialization of "trial" before issuing a warning
message.

  --david

> Acked-by: Ajay Singh <ajay.kathat@microchip.com>
> 
> > ---
> >  drivers/net/wireless/microchip/wilc1000/wlan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net/wireless/microchip/wilc1000/wlan.c
> > index d4a90c490084..2030fc7f53ca 100644
> > --- a/drivers/net/wireless/microchip/wilc1000/wlan.c
> > +++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
> > @@ -575,7 +575,7 @@ void chip_allow_sleep(struct wilc *wilc)
> >                 to_host_from_fw_bit = WILC_SPI_FW_TO_HOST_BIT;
> >         }
> > 
> > -       while (trials--) {
> > +       while (--trials) {
> >                 ret = hif_func->hif_read_reg(wilc, to_host_from_fw_reg, &reg);
> >                 if (ret)
> >                         return;
> > --
> > 2.30.2
> > 

