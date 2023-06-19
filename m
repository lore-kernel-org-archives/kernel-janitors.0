Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C03EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Jun 2023 05:18:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjFSFSl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Jun 2023 01:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjFSFSk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Jun 2023 01:18:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC786E0
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 22:18:38 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f90b8acefeso10353265e9.0
        for <kernel-janitors@vger.kernel.org>; Sun, 18 Jun 2023 22:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687151917; x=1689743917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OquOs5lO1U91r5XJ8YkPJm7HLczPqYuopjUQav868/Q=;
        b=t8X3a0UEHKMxgeRYtPpwA8NWpeRX4e62YdkDSjhP52QfQOCVz42PR/oVNS90CNjzCi
         BbIjBD204Xeu/++F0pTAKt3UhCFCVERz+yjIJBYE01FIshbB6Xy8mDOr2enV1Caw/cLn
         AZeKYoSs6WSYyMpQ2NvGbd++aKhNXgjloq15x+w0QQ5L9j6od0C7SmlYIND3RZe9Q+7N
         ASsfCagCtzXD5Kg5DDU/GPxhonSFgouGlmDZtrrag0kL2vQlUpMbvdHE++h7k7tTNsQq
         5xMDfsCmuYs40InYj816SB42cZPK+lQ2z3UZAGAA05n2HsWxsXItymKP87fiEIb8+DZ2
         jz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687151917; x=1689743917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OquOs5lO1U91r5XJ8YkPJm7HLczPqYuopjUQav868/Q=;
        b=gtZ5hiGodZgxXwDVTJJp2Y6yuUnicX7ti3PEHSsoB6DxOeNn+9BMa/X+iPGP3TUnfX
         WijTkPo0sLtSlub5E4uy4I9lqjeirxTIHeDhEogg+jLuUHMx0kmNKdsQGqfmXw38mvhG
         /K/ElYaGLB0q6wQxlsdmbjSpDirC1gv2R24s9Q4PzVAO+PUL8T+syqC71qAksTbRTcJd
         dmwe3Vt21P2FPynLZdLDJdwQ2aG3HDTPSLq2IGlJ8AGUET+FyeONu6RlzNta8AFlgrHg
         msyyzHKeCD0ONKwoXX5GV6dyDcC4HwYzGvl4wFPIJ75dRR6i3yTWsbY2h5Ake++zw5R1
         Jozw==
X-Gm-Message-State: AC+VfDyHAM9ui3QMnfh/To2uzjWubvvc30XymwxPN79f45re0tI2c1k9
        Ew5o8SsZaNSjn1m+tplwXosSGA==
X-Google-Smtp-Source: ACHHUZ7D+w4xn3LwLcUR7LW7ZSPiQyX0GhbcWwDCJGmGAqKzJ/edYq2AYh0V6a9rzt8V8FBlLNtzmw==
X-Received: by 2002:a1c:4b0c:0:b0:3f9:b083:109 with SMTP id y12-20020a1c4b0c000000b003f9b0830109mr1202144wma.33.1687151917454;
        Sun, 18 Jun 2023 22:18:37 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l20-20020a1c7914000000b003f709a7e46bsm9364089wme.46.2023.06.18.22.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 22:18:35 -0700 (PDT)
Date:   Mon, 19 Jun 2023 08:18:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Reorder fields in 'struct hid_field'
Message-ID: <d6026b7f-dc07-4d0c-9805-cc61d6b9a4b8@kadam.mountain>
References: <a804f2e91bc32cc5e17e012ed90972415606db4e.1687075665.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a804f2e91bc32cc5e17e012ed90972415606db4e.1687075665.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Jun 18, 2023 at 10:08:07AM +0200, Christophe JAILLET wrote:
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 39e21e3815ad..5be5e671c263 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -480,9 +480,9 @@ struct hid_field {
>  	__s32     physical_maximum;
>  	__s32     unit_exponent;
>  	unsigned  unit;
> -	bool      ignored;		/* this field is ignored in this event */
>  	struct hid_report *report;	/* associated report */
>  	unsigned index;			/* index into report->field[] */
> +	bool      ignored;		/* this field is ignored in this event */
>  	/* hidinput data */
>  	struct hid_input *hidinput;	/* associated input structure */
>  	__u16 dpad;			/* dpad input code */

You could move the dpad next to the ignored to save another 4 bytes.
I think it is still grouped logically that way but I don't really know
what dpad is so I might be wrong.

  	struct hid_report *report;	/* associated report */
  	unsigned index;			/* index into report->field[] */
	bool      ignored;		/* this field is ignored in this event */
 	/* hidinput data */
  	__u16 dpad;			/* dpad input code */
  	struct hid_input *hidinput;	/* associated input structure */

regards,
dan carpenter

