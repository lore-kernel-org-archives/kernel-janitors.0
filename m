Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B99C7EE2F
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jun 2023 08:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237102AbjFFI1V (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jun 2023 04:27:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236881AbjFFI0k (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jun 2023 04:26:40 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025B010C9
        for <kernel-janitors@vger.kernel.org>; Tue,  6 Jun 2023 01:26:32 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so48558805e9.0
        for <kernel-janitors@vger.kernel.org>; Tue, 06 Jun 2023 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686039990; x=1688631990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gl0KhHQ8ZvhaQ8bNFuYRb0tSDK4WUrfjgYwfNozJQo0=;
        b=UzFW+x/W+vrZKvQPSSSdZW0M8n0JX2ZnlhsIx6ylHTjZJU2sgycP4SH+x2lyxDXIrL
         CTaCujlYwTcVKc0UxSvAXb8BHCLMX0FJftjbYueFNrPDoL31cS1oIRgE/8BTliz0mqoC
         PuW/Sh4s7WP+lpiA9EkhslbEKgdnZlGK/MrdTpxiAzd6qv5OUnJC66ufdP76u1ZbbN5C
         0EUAOBNZUC8QhO+xaJny8Ab3kSCbM/WnYA44feHNiDPVgf4+kL6Hud0dBNwCDxaulb59
         9SnCogP3YbC+g8LtiSRLKVJVEu6jlwvrpTJ5tKRFvgYrfRsEKgxWOvbCfMWkf8lmeKgO
         0BLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039990; x=1688631990;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gl0KhHQ8ZvhaQ8bNFuYRb0tSDK4WUrfjgYwfNozJQo0=;
        b=DutiKURVcOIrw1wN1XQQJX4sFKuEWUgXvnf50I9t8D0YitaNbQGxts8cJkz8a0hLlp
         DzxtVKGWMYgVwiVvgGen2JnApnBNcIn5wNmR4HiBGrVmzBJ4gIuptqTN96aDydFlm890
         1sdFNHH/kspdwupQxHVX7gQf3fe85sOeIV3+LfB4eVwJgDQmCikI9DmsE01Y1FyWSOf0
         m/m0nj8GawrtEZJeJ6VWMa4pm8twSiLfCh+2A8ShP67Gzfdk2WER6JKXccgTNRIMjLez
         Yht77js/1tcMxgm/+Pe91F3OINt75LUkYpEjJlp+CcWOzvBhnBX2+q+qRGFYWbPgwAvZ
         Pb1A==
X-Gm-Message-State: AC+VfDxd9x557dSvZiq9q6raMDJ9K6CfyNzcNBfYd7OWcumepKkiE1nc
        uvls0aCQ2wScFWIyoykgaaVq5w==
X-Google-Smtp-Source: ACHHUZ44OJ9ZY6+fXfSpAjeSs6QcuhYPuTqdWyo7EIK2QFMTquNAxpzgUg9yGAzpz1z5h8TS6FYwKA==
X-Received: by 2002:a05:600c:290c:b0:3f7:e8fc:678d with SMTP id i12-20020a05600c290c00b003f7e8fc678dmr1371136wmd.13.1686039990337;
        Tue, 06 Jun 2023 01:26:30 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g26-20020a7bc4da000000b003f50e88ffc1sm16908147wmk.0.2023.06.06.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:26:28 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:26:25 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] serial: core: don't kfree device managed data
Message-ID: <ZH7tsTmWY5b/4m+6@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The put_device() function will call serial_base_ctrl_release() or
serial_base_port_release() so these kfrees() are a double free bug.

Fixes: 84a9582fd203 ("serial: core: Start managing serial controllers to enable runtime PM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tty/serial/serial_base_bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/serial_base_bus.c b/drivers/tty/serial/serial_base_bus.c
index 1b37833b8f66..f125d16f3d16 100644
--- a/drivers/tty/serial/serial_base_bus.c
+++ b/drivers/tty/serial/serial_base_bus.c
@@ -98,7 +98,7 @@ struct serial_ctrl_device *serial_base_ctrl_add(struct uart_port *port,
 				      serial_base_ctrl_release,
 				      port->ctrl_id);
 	if (err)
-		goto err_free_ctrl_dev;
+		goto err_put_device;
 
 	err = device_add(&ctrl_dev->dev);
 	if (err)
@@ -108,8 +108,6 @@ struct serial_ctrl_device *serial_base_ctrl_add(struct uart_port *port,
 
 err_put_device:
 	put_device(&ctrl_dev->dev);
-err_free_ctrl_dev:
-	kfree(ctrl_dev);
 
 	return ERR_PTR(err);
 }
@@ -140,7 +138,7 @@ struct serial_port_device *serial_base_port_add(struct uart_port *port,
 				      serial_base_port_release,
 				      port->line);
 	if (err)
-		goto err_free_port_dev;
+		goto err_put_device;
 
 	port_dev->port = port;
 
@@ -152,8 +150,6 @@ struct serial_port_device *serial_base_port_add(struct uart_port *port,
 
 err_put_device:
 	put_device(&port_dev->dev);
-err_free_port_dev:
-	kfree(port_dev);
 
 	return ERR_PTR(err);
 }
-- 
2.39.2

