Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19824EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Jun 2023 13:35:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjFZNfR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Jun 2023 09:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjFZNfQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Jun 2023 09:35:16 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD9AE64
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 06:35:14 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fa93d61d48so13590805e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Jun 2023 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687786512; x=1690378512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSXSrL5SBC6uysg7fDXpV4R+sOE/vGqBgFIZWIbj7pw=;
        b=EDg/JYJGZHQwgJsLcFq9/ITSErd0gEgwbs2B4EI87mfwR+DHdGWPwKDMv96ICBrWM4
         WqFunED0vhQtUzVRkuue+yeasq5UfMt+tCQb64KjCfQOaHx/ZBopTIlpSZqdCxdlVVff
         ohEobd+9qAxavA6NVYulWWiCbgLdb12y2VmU9/5Vc9rBOcjdHWaieY8Rm+VrF+WMUkpa
         JhHcnCU4tVj8s3SN1dgNsC2VAv59kUZxtH1zpBvcrASH8tImi/R6hx076/3JKSBF1BFo
         kE0LxRzEhDCEiegJ7Pf8uHAe/Uk50OQACxhG8bh0XWCn6DkcLcHyWE6XacRHV8Pm0KTr
         syxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786512; x=1690378512;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSXSrL5SBC6uysg7fDXpV4R+sOE/vGqBgFIZWIbj7pw=;
        b=czwleIWo3T2ZU1fC1aGY3zMQ82+mVlidBDwdS1b/b8WcAA2v1kZDsVVDlpAXpzdiT6
         vlkQRgWd3iMcDau8rSH7Bo7uKx0idccTq9ftyohZxzFFm4aNHPTNNPbmdjkXB2UzUTFJ
         NPXgeWe7MjNVPJuwr732PyZnvN54xOeuOXH4+2xDALZWZFHMX0Q3116xQk5LnB3uEKA7
         LEqf/EAjPbXk1xtCgcp41ZGp7MQuRbTfueqakxV5eMEtwrkHO1mpHlR68uc4gZv3XHZC
         Hu5o/JQ5YLD8hig4qQ6KkazGJJoreCrcO1hyoA/cWjqT3UmWBYchjsggv5svvkeu+n5U
         c96w==
X-Gm-Message-State: AC+VfDyveoba66ai8tike4aVs60aJ+SPvKmXkttJ0UJN9vNQ78JXN3Gv
        em46AW59O1oTJS6ioOK9RPVt8deUYk0UrJmIw7U=
X-Google-Smtp-Source: ACHHUZ7WdbGtDIPRhHdOfpa04nv2W0iY1lsc6UFWYGvhTfoDiKA98kj0m9x9EYimTM6Ba0V8jGNOxw==
X-Received: by 2002:a7b:ce8a:0:b0:3f9:8c3:6805 with SMTP id q10-20020a7bce8a000000b003f908c36805mr21926578wmj.7.1687786512617;
        Mon, 26 Jun 2023 06:35:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b003fa9a00d74csm2125136wmo.3.2023.06.26.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 06:35:10 -0700 (PDT)
Date:   Mon, 26 Jun 2023 16:35:06 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] tracing/probes: Delete dead code in
 trace_eprobe_tp_update_arg()
Message-ID: <f657e0c7-46c3-4e8f-a472-35ec98229660@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code was recently refactored and now the "ret" variable is always
zero.  Delete the check for non-zero.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This code was changed in 1b8b0cd754cd (tracing/probes: Move event
parameter fetching code to common parser)

 kernel/trace/trace_eprobe.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/trace/trace_eprobe.c b/kernel/trace/trace_eprobe.c
index cb0077ba2b49..b5181d690b4d 100644
--- a/kernel/trace/trace_eprobe.c
+++ b/kernel/trace/trace_eprobe.c
@@ -797,10 +797,7 @@ static int trace_eprobe_tp_update_arg(struct trace_eprobe *ep, const char *argv[
 		return ret;
 
 	/* Handle symbols "@" */
-	if (!ret)
-		ret = traceprobe_update_arg(&ep->tp.args[i]);
-
-	return ret;
+	return traceprobe_update_arg(&ep->tp.args[i]);
 }
 
 static int trace_eprobe_parse_filter(struct trace_eprobe *ep, int argc, const char *argv[])
-- 
2.39.2

