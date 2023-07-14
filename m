Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF17EB64DC
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Jul 2023 05:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234966AbjGNF56 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235054AbjGNF54 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jul 2023 01:57:56 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E81DF2D51
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jul 2023 22:57:53 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-31441bc0092so1639464f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jul 2023 22:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689314272; x=1691906272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwPQ9teSwd7Nb0FFHLc2ex+bU+I6qkcibvl/8wSBGpM=;
        b=mpRqdXBs8lf/WLyEeojTNe9gL7TaquUgfb/wvL2K/bifpt0UIXhRSzaLPzzNy33XY/
         yyAMv6o6KSpYRQEG9t9Fm+OH22gcjDUXIydlyvTrpqPQSzLXqY5KxYsPdvIZT38PqJMr
         5CgNVtPMpQ1/hzxc/9cbr0C2tTrVBoJ038wIA5Oc5STTsg1qMN8jTySe+w3wGfwVFA7z
         6oomNO5mP5ddl4X/7t+6e+kO+nELxB0PDUxl1UjjkIUHyT8/TAIjla+o/3vqFqfWPRrR
         v+iP3HI9vQihXu4ujzNHXnnFR7W/JMJZksnAOaKxRrrMqs5cszQi+0ZoyTzXchMfNUhA
         jkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689314272; x=1691906272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwPQ9teSwd7Nb0FFHLc2ex+bU+I6qkcibvl/8wSBGpM=;
        b=BgxJSCNNK5k6Vx+fbpYogeQhHuPOwgFB4/kUFXdWddAo2on3OS03l/ZlcKgJAfw2x9
         4GT65sHKwBTqgJcumLTesnp+WgchN3ptnIr6sfsGxLx7GN1L8yv3Xczc2I24tRAEVwR+
         shA8nPe5cfXwcMhnAaSOke3vvmoFPMiw89ePBmFnTaW12/8b3rwkQde1lXfOMa8Vqrbp
         5Izfw9J//gpGrhp+odLYTexhMh99fWH/Pmh/K5aLSRad/ooJ/LwFoxGi9+9/e/ZvIPXu
         iIjY0uOk64a13DyhBZs/3hNyxth/QWBl3keHaDFShO3frPizygMHJnZZQLcjc5kVp/47
         hbNA==
X-Gm-Message-State: ABy/qLb9usFV5XGropJ4jdUckJAng2y11TKaE0bRz6tFk2CUisHQWVSs
        YGxfect30noXh1IX+qxx1f5EcA==
X-Google-Smtp-Source: APBJJlEiO62Awkmfn/b8CTowVt52CzGQlfo4zygUtugdcmsF4JuaJ1Tq6jXK3SdounlkLp1n8IkMlw==
X-Received: by 2002:a5d:680b:0:b0:316:f099:209f with SMTP id w11-20020a5d680b000000b00316f099209fmr173009wru.70.1689314272135;
        Thu, 13 Jul 2023 22:57:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a5d6712000000b003113ed02080sm9735214wru.95.2023.07.13.22.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 22:57:50 -0700 (PDT)
Date:   Fri, 14 Jul 2023 08:57:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     Wang Ming <machel@vivo.com>, opensource.kernel@vivo.com,
        kernel-janitors@vger.kernel.org, ntb@lists.linux.dev,
        Allen Hubbe <allenbh@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Jon Mason <jdmason@kudzu.us>,
        Serge Semin <fancer.lancer@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Minjie Du <duminjie@vivo.com>
Subject: Re: [PATCH v3] ntb: Remove error checking for debugfs_create_dir()
Message-ID: <791a3c06-47cd-450a-8c4e-24fe52fdaa4e@kadam.mountain>
References: <20230713085621.3380-1-machel@vivo.com>
 <e93e7bb2-c254-06e2-87b7-1f59e52930f6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e93e7bb2-c254-06e2-87b7-1f59e52930f6@web.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Markus is banned from vger so only people who are on the CC list can
see his email.  A number of maintainers have asked him to stop
commenting on patches.

regards,
dan carpenter

