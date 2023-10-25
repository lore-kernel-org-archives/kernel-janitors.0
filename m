Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07366C0032E
	for <kernel-janitors@archiver.kernel.org>; Wed, 25 Oct 2023 11:58:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234897AbjJYL61 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 25 Oct 2023 07:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbjJYL60 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 25 Oct 2023 07:58:26 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916C9136
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:58:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c501bd6ff1so78171541fa.3
        for <kernel-janitors@vger.kernel.org>; Wed, 25 Oct 2023 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698235103; x=1698839903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfUbynUkW0A2o7wHLTAuig9K/lMD2l5OcDGR5b7mo8I=;
        b=HYyYR0uMNwcSdS9CVikc8iJGHfOC/5jShavalbMU6vJRt68ZUt1rT8JKwOLZ/49sJ6
         gvVZsnQJ3RkhSX+MJS8RmKe8iC+jl60pBcvHL1es8DBpk7oTMPb1Ak23xItagqxMm4o3
         lL3yBozDfXqWPhSryx2B9E8mASZUyY1YToXF+2JVIpxvhwAn5jkE7+0xpiUzrF12ijrR
         88ZBpJAgvjfqUAV//vCZv9qmm0Wpw+MskL4OfMNext53DqHEQtCrBhuddDnF9Ai40HFr
         O6AtZwjbe92j4N/66Hz3qHQ9eDmA8cyWaNp8F7NETU4NFSDfVXtyET19GvP5IMOIVML+
         LCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698235103; x=1698839903;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfUbynUkW0A2o7wHLTAuig9K/lMD2l5OcDGR5b7mo8I=;
        b=ecU1v3642baVqRbWLkDiJAgpcZIkTfFFp+D1pe2JfRx2/gtB1PTV+5JeKZu9F24eEx
         yBY3+9sHsAnROjNM0Whwz9M8M4K89VZ4zYkKhAO7vFfQIeU6Q6sj59mu+kgxj+bhHEps
         kljc661Wygv1kJCoHP8Ala6AlBsm/m+l/22S4aMgVON0rrzjUyY7AEDETQgGcd5RQ82d
         gqbjay6PGsqndY5LtY3JFimS3sQQEUZa5tD6hX35TgWRrHVnLGP38fyu7fubSkhaBYqh
         QDqAsCx3duAyCfEMvl2Bc0cOjGjvbtcApupWudKxj10RCy4fbW/wPpZjwHeb/Cywa98s
         cTJQ==
X-Gm-Message-State: AOJu0YxaBh3Dx7mf8y7qKBX1jZSC2rzPfVCEmiqBSM756VhZvVMYfrpe
        SedcjmYkzx4BCsQbpIpK7a4qbWk88AEf7rQl2tg=
X-Google-Smtp-Source: AGHT+IErfEwam0o9Z+S9MmPXBYGKaBe2GqXi5WgE8PLd41wLN6ZsTrlS6woDbrEBK+9ZpW85UKerfw==
X-Received: by 2002:a05:651c:c8a:b0:2bf:fa62:5d0e with SMTP id bz10-20020a05651c0c8a00b002bffa625d0emr12084791ljb.2.1698235102948;
        Wed, 25 Oct 2023 04:58:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c16-20020a05600c0ad000b003fee567235bsm19103191wmr.1.2023.10.25.04.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 04:58:22 -0700 (PDT)
Date:   Wed, 25 Oct 2023 14:58:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2 2/2] pwm: Fix double shift bug
Message-ID: <447a8e49-ee37-4fde-bc4a-ebec3e37a311@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e031db45-add0-4da7-97fa-dee95ee936ad@moroto.mountain>
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These enums are passed to set/test_bit().  The set/test_bit() functions
take a bit number instead of a shifted value.  Passing a shifted value
is a double shift bug like doing BIT(BIT(1)).  The double shift bug
doesn't cause a problem here because we are only checking 0 and 1 but
if the value was 5 or above then it can lead to a buffer overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2:  White space change.  Split the patch into two parts

I didn't put a Fixes tag because it doesn't affect run time

 include/linux/pwm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index e3b437587b32..cda3597b84f2 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -41,8 +41,8 @@ struct pwm_args {
 };
 
 enum {
-	PWMF_REQUESTED = 1 << 0,
-	PWMF_EXPORTED = 1 << 1,
+	PWMF_REQUESTED = 0,
+	PWMF_EXPORTED = 1,
 };
 
 /*
-- 
2.42.0

