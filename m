Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC768EC874B
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 18:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbjIGSLH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 14:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234039AbjIGSLH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 14:11:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FB310CF
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 11:10:37 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so1713235a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 11:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694110231; x=1694715031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGxlXmD7rXzlXkZp/1+5eV0AkPQGPfHPdjs2ruZgIyU=;
        b=ZNrxkRPpHWTJ0buJgluIumehlzHtQUdwHJnY+lD7PYsah3aGYKVjOBa/X/vG9qqIIU
         S07MsDYWq+Myk3cmGDGaHNnXOt/tPxO6JyU9qYgk4MS5pbCoSTnlwGRp8bI7oyVDU54B
         Mdg9SKsm4APiWnOoF4N5GjhJbLsuBaag5dpU2aO0wcQIMdOIa/MoUWffgtInhV/DS2F7
         25Fstu3lapq3nllKM3rNWnHMlwhvx0uPlQCmnExI7xAUan0S95M7TDqqyvtcVbdlEZUi
         4zg4f7CIREaKFwOWH0sF/xCYxMmtj7H6WxcTKVhUy6zdCTWJrvM6RMnqKIeMYyeKSVeH
         CDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694110231; x=1694715031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGxlXmD7rXzlXkZp/1+5eV0AkPQGPfHPdjs2ruZgIyU=;
        b=qgFGQo0z3HawrrqbF41/Ha+Mjr8lUTuEQuOee7zMEWA2DfxTtvd4dM2PlxCxYVv6f6
         iqSWeDf5l/fg34EbRgIggLzWEEC7dTaXUOx9voEGG1BX0SQhH3lWPn6Z1VpoWtWQ60sC
         N3QCmWXvXqsSKL59mNrMwFyFaBXfcT2HGWPSh2SV60dZt5uZwF9aNkTP174U+Y0rPgFR
         PQS0tNf4P6mXb2kDvE4Ulbv6yp9dn90nmgYj+S8vpkO+hgg3IKD8ADxYbDeAq0h1x0Fx
         tQ/PdUrRBK/BKoKGD2yXVIsyXfix9FGXZuZYp7Pwj7MT7chOLHKwh8zeiP9FDJJyiobZ
         S/tg==
X-Gm-Message-State: AOJu0YxTKy1+//hjy0MGubK8v3qN0zfb1GqFmsQCU5NWz5nXAJ5PjUyu
        5Jhh/yjT20d6c/n9rk0ajp8LTwbZMT3owRSsLao=
X-Google-Smtp-Source: AGHT+IF4ScXeNFc9T6sa37xCIejdfIcIV8Ku7W6rsWwu23Jm9Jysj7coReVtQDIMzxl8ptY3zXn6Fg==
X-Received: by 2002:a05:6000:ca:b0:31c:488e:ff33 with SMTP id q10-20020a05600000ca00b0031c488eff33mr4065832wrx.58.1694078850155;
        Thu, 07 Sep 2023 02:27:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ay30-20020a5d6f1e000000b0031f65cdd271sm3766111wrb.100.2023.09.07.02.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:27:29 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:27:24 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Edward Cree <ecree.xilinx@gmail.com>
Cc:     linux-net-drivers@amd.com, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] sfc: functions to register for conntrack zone
 offload
Message-ID: <dc2012e9-d1aa-43bc-bc84-03abb4cbc487@kadam.mountain>
References: <ede55fab-c74d-4594-9c71-0165b9460d22@moroto.mountain>
 <d80bf2ed-e91e-1f8b-fb38-e164ec7b5704@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d80bf2ed-e91e-1f8b-fb38-e164ec7b5704@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Sep 06, 2023 at 11:58:28PM +0100, Edward Cree wrote:
> On 06/09/2023 12:55, Dan Carpenter wrote:
> > rhashtable_lookup_get_insert_fast() can return NULL or error pointers.
> 
> So it can!  Thanks for catching this.
> Looking at the rest of the driver, it appears quite a few other calls
>  to this function also assume it returns only valid ptr or NULL.
> I'll audit them all and produce a patch, with your Reported-by if
>  that's okay?

Yes, please!  Thanks.

regars,
dan carpenter

