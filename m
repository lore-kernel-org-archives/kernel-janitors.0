Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A8EE75458
	for <kernel-janitors@archiver.kernel.org>; Tue,  3 Oct 2023 12:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbjJCMt3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 3 Oct 2023 08:49:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjJCMt2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 3 Oct 2023 08:49:28 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FA0BB
        for <kernel-janitors@vger.kernel.org>; Tue,  3 Oct 2023 05:49:24 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3231d6504e1so864903f8f.2
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Oct 2023 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696337363; x=1696942163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=JXhJ8lVEqaQbQfqiLFkM5IR7OEITC9US5qgu9MwJkSgFwS9b1sawkVfHh/uCP3Vw1d
         IGTXSmTnj54onQZ7TNLPvJhG36d88ONUNIAV8f+YAjU74UuUoeu7re5UfOeY2JCFANi1
         PI4MQsUBVTfuqSDT9z0rZMAsBnnXPZntGncIMdgODV5B8b7wYNgRxm44+Nq0vV0L8AxI
         O6J1knivsTRqHJt6TJaIF9SBI64kq5EDdjWwPyVFN2sZr5BJHx8voZ0emNhL0SJiToK2
         14qHh4WDqqy0lGkrBP39kPyyLAoPd2qq3QnUPbVDmHL6bKOn+csodW0F2B6SfJWYZ9XB
         amnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696337363; x=1696942163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlhxrmRkRpeN3OD8U4BACgAdd1QbrxInrsx8HMZ5kJg=;
        b=d5CbPCs2wPLhVvLGshdRfGo2acRapo3gVHc254pqcJB53s0zXvYCNdhE+M7C/16HC7
         wfNzBUYy4GXHGoBuFI76n6qyYtmoDGDGZXs/9xxDyugVxjerO3DB1GnNMVVXp4QbO5m7
         FOJhMBZqndp8RucEFKG5Ws+BeXXhaU8VecMwcfyIdbFp+QQL3ZKFRXNtu1TCYL9ko5Ol
         uWP5NmiLRNvoBO5c/uud9TWjT+nv1FfI7Xp1NWwTWFzVUr6r7PUdqB9rvUcH0gJAkRFW
         qe+BYzRirgpGL4h92443nuhPddIEXONLnN9rsn8U7C+uKNbgqAVyqpSrH3zoEKgCxZGa
         4m+w==
X-Gm-Message-State: AOJu0Yz4T2BT135Tlz4xSeW0Ys6UbBAm7Bk1MjKxf8bBEzZudsR3DVQ9
        RUg0BL5R0Y0GAPTtn1WWLwyJHQ==
X-Google-Smtp-Source: AGHT+IHaooNR/TbU/A9B5ajdiCBcPIbTQ8DPZxIgHjk9yBVQj+gRRRWDV1SLznjSXOlY8aO5drEItQ==
X-Received: by 2002:adf:f302:0:b0:320:b2a:4ea6 with SMTP id i2-20020adff302000000b003200b2a4ea6mr13526615wro.9.1696337363023;
        Tue, 03 Oct 2023 05:49:23 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v8-20020adfe4c8000000b003247d3e5d99sm1522305wrm.55.2023.10.03.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 05:49:22 -0700 (PDT)
Date:   Tue, 3 Oct 2023 15:49:19 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Kun-Fa Lin <milkfafa@gmail.com>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <dd71316e-18e6-47a4-a267-67328b1a1158@kadam.mountain>
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
 <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Oct 03, 2023 at 08:02:33PM +0800, Kun-Fa Lin wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> > The of_parse_phandle() function returns NULL on error.  It never returns
> > error pointers.  Update the check accordingly.
> 
> Commit message contains some redundant whitespaces.
> 

I have no idea what you're talking about?  Are you talking about two
spaces after a period?  :P

regards,
dan carpenter

