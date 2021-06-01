Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F16C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 21:23:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 616A0610CB
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 21:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234800AbhFAVZg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 17:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbhFAVZg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 17:25:36 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A904C061574
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Jun 2021 14:23:54 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso448632pjb.5
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 14:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nFOdHAPlqNA14l42cZmkYqA40COT5/S1bjcVC9SoAHI=;
        b=BTmnHB6GCYHOsW7Lhz7JA98XDLhSB5gL8e7dn5Dh5rswFYMNQLXtNtUCchlzWvteTa
         Uq1OlGDNPy+/scsrcyuZBvvduVT5sGU5gZjvpd/jwBSHl84ZYhuiv8pyV4Z+/Q1vEUYX
         beQ7UB7awXvd/L4sCIuGVxH8N2BWVANj9I3FRJT1fvFwcRIu3Y/1x2kpZT0mCcChXv6k
         VTOvZpCojN4XoF6XkNNj7STzZr1gxr6MVaF96t2GZENeWar32ZCdbd9RaBTPYI5kBFh8
         M2OYUPSHM/uxIvBmsSlNcFkT4dZyOqbfbtcNUB11OyEdEUEtZkX96VHWyVtcjM7bSM5l
         wpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nFOdHAPlqNA14l42cZmkYqA40COT5/S1bjcVC9SoAHI=;
        b=dLcvO6xwdkckyZtAmyJeoGYzMHpi1TsA64UjvcUEa/yG8xr8LF9+xhiwiZqghRk/Ql
         xc8bK4KQwMKPDTR4RCu6SwMHt1IenFkeQeJ6DGoLFpwMvyN1GldN/D+/X5+a5sycjHvG
         JQreUJiqZ9betM3BwCFfxMrHpiwsLr7kLsC9K8KxW4GqsSrFbrl0EAxhr7xHEFyZfsvb
         b6MAWo4ZSDsTIin6olDvyjxrhZmzdIXo60PdzNnT0+Fd91YMglzT+RLQ/UzBih0/Z0B8
         5M+iOlkP7n6Y6X9+wq0jA+GtcHXff2GcmhHmluQbsq02jJH9AB4BdRHCfvhXc4uVtt7V
         RKqw==
X-Gm-Message-State: AOAM5308y3BFOtXj5dJ2HK5ouXag/4VQpBRkWa6jRy+/CWcpJ2d7o4DX
        erMfNb1cWME8HBT/GUw7lkE=
X-Google-Smtp-Source: ABdhPJyTVt+hz7pag/VILCMTakmkbnOnTNsOv4aDu9jrrzM/sa+FEsT5XPu0N+a+AlHogWNSmUFSbA==
X-Received: by 2002:a17:90a:8581:: with SMTP id m1mr27085910pjn.47.1622582633631;
        Tue, 01 Jun 2021 14:23:53 -0700 (PDT)
Received: from fedora ([2604:2000:efc0:108:b082:f3a8:abff:a570])
        by smtp.gmail.com with ESMTPSA id o20sm957498pjq.4.2021.06.01.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 14:23:52 -0700 (PDT)
Date:   Tue, 1 Jun 2021 17:23:46 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <YLalYt3m8jzoL4ie@fedora>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
 <20210601205006.GA10983@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601205006.GA10983@kadam>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 11:50:06PM +0300, Dan Carpenter wrote:
> On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> > The other thing which might be interesting is if you pass a NULL
> > to IS_ERR() and then dereference the NULL then print a warning about
> > that.  This has a lot of overlaps with some of my existing checks, but
> > it's still a new idea so it belongs in a separate check.  It's fine and
> > good even if one bug triggers a lot of different warnings.  I'll write
> > that, hang on, brb.
> 
> 100% untested.  :)  I'll test it tonight.

Ha, you make it look easy. Let me know if I can help with testing
Should I just add below to my smatch and recompile,
or is there an experimental branch to build from?

> 
> There are a bunch of ways to write a check like this.  This test is
> based on copy and paste, guess work, and instinct.  I normally just
> start writing the simplest check I can and test that, then I refine it
> based on whatever the common false postives are.
> 
> In this code, do I need to have a modification hook?  Probably not, but
> it was in the original code I copy and pasted and it seemed harmless.
> Slightly ugly perhaps?
> 
> I knew from experience that I want to check if it's an explicit NULL
> pointer passed to IS_ERR().  There are a few ways to write that.  I
> could have looked at the values or I could have looked at the ->possible
> values.  I probably should have looked at the values instead...
> 
> The __in_fake_assign assignment is copy and paste.  I shoud probably
> delete that but it's harmless and a potential speed up.  It was in the
> check_check_deref.c and I don't remember why.  Probably it's essential.
> 
> I'm not happy with the DEREF_HOOK api.  I've been planning to re-write
> that but I haven't yet.
> 
> regards,
> dan carpenter
> 
> /*
>  * Copyright (C) 2021 Oracle.
>  *
>  * This program is free software; you can redistribute it and/or
>  * modify it under the terms of the GNU General Public License
>  * as published by the Free Software Foundation; either version 2
>  * of the License, or (at your option) any later version.
>  *
>  * This program is distributed in the hope that it will be useful,
>  * but WITHOUT ANY WARRANTY; without even the implied warranty of
>  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>  * GNU General Public License for more details.
>  *
>  * You should have received a copy of the GNU General Public License
>  * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
>  */
> 
> #include "smatch.h"
> #include "smatch_extra.h"
> #include "smatch_slist.h"
> 
> static int my_id;
> 
> STATE(null);
> 
> static void is_ok(struct sm_state *sm, struct expression *mod_expr)
> {
> 	set_state(my_id, sm->name, sm->sym, &undefined);
> }
> 
> /*
>  * The expr_has_null_exact() function means that it was explicitly
>  * assigned NULL, not just that it is potentially NULL.
>  */
> static bool expr_has_null_exact(struct expression *expr)
> {
> 	struct sm_state *sm, *tmp;
> 	sval_t sval;
> 
> 	sm = get_sm_state_expr(SMATCH_EXTRA, expr);
> 	if (!sm)
> 		return false;
> 
> 	FOR_EACH_PTR(sm->possible, tmp) {
> 		if (!estate_get_single_value(tmp->state, &sval))
> 			continue;
> 		if (sval.value == 0)
> 			return true;
> 	} END_FOR_EACH_PTR(tmp);
> 
> 	return false;
> }
> 
> static void match_is_err(const char *fn, struct expression *expr, void *unused)
> {
> 	struct expression *arg;
> 
> 	arg = get_argument_from_call_expr(expr->args, 0);
> 	if (!expr_has_null_exact(arg))
> 		return;
> 	set_state_expr(my_id, arg, &null);
> }
> 
> static void check_dereference(struct expression *expr)
> {
> 	char *name;
> 
> 	if (__in_fake_assign)
> 		return;
> 
> 	if (get_state_expr(my_id, expr) != &null)
> 		return;
> 	if (implied_not_equal(expr, 0))
> 		return;
> 
> 	name = expr_to_str(expr);
> 	sm_error("potential NULL dereference '%s'", name);
> 	free_string(name);
> }
> 
> static void match_dereferences(struct expression *expr)
> {
> 	if (expr->type != EXPR_PREOP)
> 		return;
> 	check_dereference(expr->unop);
> }
> 
> void check_null_deref_after_IS_ERR(int id)
> {
> 	my_id = id;
> 
> 	if (option_project != PROJ_KERNEL)
> 		return;
> 
> 	add_function_hook("IS_ERR", &match_is_err, NULL);
> 	add_hook(&match_dereferences, DEREF_HOOK);
> 
> 	add_modification_hook(my_id, &is_ok);
> }
> 
> 
