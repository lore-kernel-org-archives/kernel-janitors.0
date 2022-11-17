Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE316C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Nov 2022 04:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbiKQErn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Nov 2022 23:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbiKQErl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Nov 2022 23:47:41 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9F4686BB
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Nov 2022 20:47:39 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so718725wms.0
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Nov 2022 20:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IaHtScFjWWDQ4HjcnLerGsD2sTsL2YPTMmp1KjWveg=;
        b=D5imll78fHSuHLLJgCIOKV6A5KZxGMDCZV+4n4trcnDI5oKwWEm7P/dnBA1Ge4M7N0
         1bJZBEZ5h9uLxoRVAM34chf0HzHjMVwGzC0ZwI3b9rbZsrYiF7qV8mLVUjbEbqCrffL6
         GN0+XFx1R04IKc7hL9qHG5h+LwWsSNcyTeTEbFmrmAUhGQ1y3GNYLwE1xBZ6kNe+tBDU
         y98fh+EUZB7T2T+yqQoYEDmsyYPbR/SriXCK1qMlrjF1IM65L1qobEbXIYAxJb1/VlUf
         bfZ8+Pt2qCTfym6bQWSHiQnvQFadt50eLS7sHHyTr4KSU1ZUqXkW01MfiMcNvnt8SvHg
         LijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IaHtScFjWWDQ4HjcnLerGsD2sTsL2YPTMmp1KjWveg=;
        b=B3HoyeJ11xwzaqAch8zlc3NhwsR66eH2Y/gXQLyXlLczYqcOJaDfeJ6YrcgovuDhlK
         WWuRNUYMJKN7uSh8NW6JgXDTNlW2v4j1jE4/itP4V1r11O9J7lWivUHKWZV2WaOJCmJK
         w56RpiVfrivD2K+fQmVC2HdXCkqhgmnGqlArGNUN7qmz0+m7Hi6xXgJiCv85+Tr9DFZL
         8ZIGT0/WdA2ptLFjjQIp2249fSfzqRsQui03ytZWSYjXVrUWImk6PNNW5gdZhTievaGq
         6K/5HR3vdDBbsqOxJSzee1zW4AxGn5/PcweiE5sZFAVPmO6761k1jsXCdnPja6g9DLmc
         1bUg==
X-Gm-Message-State: ANoB5plof1IfwupnBBcuFD65xEdIwRVXLLt2v+XxtYZPazDGSyfhnq6c
        4TkRrW1TeqBHckYl71PdAKU=
X-Google-Smtp-Source: AA0mqf4fj/v1zJdbpMvmy/tl+KnkT0nMc9KTNwyX6QD3uIFexxs62PI/QCOubGoNs12vYi8OkTVDrA==
X-Received: by 2002:a05:600c:1d24:b0:3cf:6fd0:8168 with SMTP id l36-20020a05600c1d2400b003cf6fd08168mr3918216wms.206.1668660457733;
        Wed, 16 Nov 2022 20:47:37 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003cf774c31a0sm3890483wmh.16.2022.11.16.20.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 20:47:37 -0800 (PST)
Date:   Thu, 17 Nov 2022 07:47:27 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Alex Elder <alex.elder@linaro.org>
Cc:     elder@linaro.org, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: ipa: reduce arguments to ipa_table_init_add()
Message-ID: <Y3W83708rvg1Krvy@kadam>
References: <Y3OOP9dXK6oEydkf@kili>
 <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="kaLlnEmufTgL/1mU"
Content-Disposition: inline
In-Reply-To: <b30d04f4-db62-6a65-f35b-de7b979e5e65@linaro.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org


--kaLlnEmufTgL/1mU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 15, 2022 at 11:00:49AM -0600, Alex Elder wrote:
> > drivers/net/ipa/ipa_table.c
> >     413			count = mem->size / sizeof(__le64);
> >     414			hash_count = hash_mem && hash_mem->size / sizeof(__le64);
> 
> Line 414 is wrong.  It should be:
>     hash_count = hash_mem ? hash_mem->size / sizeof(__le64) : 0;
> 

Heh.  It really feels like this line should have generated a checker
warning as well.  I've created two versions.  The first complains when
ever there is a divide used as a condition:

	if (a / b) {

The other complains when it's part of a logical && or ||.

	if (a && a / b) {

drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition: 'hash_mem->size / 8'
drivers/net/ipa/ipa_table.c:414 ipa_table_init_add() warn: divide condition (logical): 'hash_mem->size / 8'

I'll test them out tonight and see if either gives useful results.

regards,
dan carpenter


--kaLlnEmufTgL/1mU
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="check_divide_condition.c"

/*
 * Copyright (C) 2022 Dan Carpenter.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"

static int my_id;

static void match_condition1(struct expression *expr)
{
	char *name;

	if (expr->type != EXPR_BINOP || expr->op != '/')
		return;

	name = expr_to_str(expr);
	sm_warning("divide condition: '%s'", name);
	free_string(name);
}

static void match_condition2(struct expression *expr)
{
	struct expression *parent;
	char *name;

	if (expr->type != EXPR_BINOP || expr->op != '/')
		return;

	parent = expr_get_parent_expr(expr);
	while (parent && parent->type == EXPR_PREOP && parent->op == '(')
		parent = expr_get_parent_expr(parent);

	if (!parent || parent->type != EXPR_LOGICAL)
		return;

	name = expr_to_str(expr);
	sm_warning("divide condition (logical): '%s'", name);
	free_string(name);
}

void check_divide_condition(int id)
{
	my_id = id;

	add_hook(&match_condition1, CONDITION_HOOK);
	add_hook(&match_condition2, CONDITION_HOOK);

}

--kaLlnEmufTgL/1mU--
