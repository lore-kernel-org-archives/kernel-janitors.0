Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A765C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 20:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F7D7613AD
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 20:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbhFAUwA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 16:52:00 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9466 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234707AbhFAUv6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 16:51:58 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151KhOvY015610;
        Tue, 1 Jun 2021 20:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6pNgX5rpokd6/t8ro7bcSWWQi9zDufkOiwlgo2JEGQE=;
 b=EkmuBHeFjfV06Kofn20R77tWg4lAzsLgt059eRaWqUktQY3pPhWBLHBwi5I6lofK44MZ
 HqMuaMqpeLjqGDFksme7YQU8FSVqEnlqrOyhrTrYoLqVXj7o9ZtISmTWFYKZpCv2Zkr6
 fto3k02F/Mg1VKjhsJwoSYFCv8qK1r98BDHPKosBTzaL1oLj6ErdampgMV25q99Ara9h
 uWbabi3FJK7lWKcd27ECCukHCy4nHvc/pREUg8KwpuVwMHP6icjHLBET2P4pfn7gthI+
 oYTgTzzbxtxRLIelw26VhvKZe5VHnne66y0z5ldA5TZ+MNt3NB3XFBb2X6QIcQdxVs3R 8g== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38vng40r7d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 20:50:15 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 151KoEDj156086;
        Tue, 1 Jun 2021 20:50:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38udea0t8c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 20:50:14 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151KoDHt155982;
        Tue, 1 Jun 2021 20:50:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 38udea0t71-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 20:50:13 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 151KoC2T018261;
        Tue, 1 Jun 2021 20:50:12 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Jun 2021 13:50:12 -0700
Date:   Tue, 1 Jun 2021 23:50:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210601205006.GA10983@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
 <20210601193419.GH24442@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601193419.GH24442@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: pFojUiFdWVpr_Y-5wvTKZ3mv604pLQrl
X-Proofpoint-GUID: pFojUiFdWVpr_Y-5wvTKZ3mv604pLQrl
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 10:51:23PM +0300, Dan Carpenter wrote:
> The other thing which might be interesting is if you pass a NULL
> to IS_ERR() and then dereference the NULL then print a warning about
> that.  This has a lot of overlaps with some of my existing checks, but
> it's still a new idea so it belongs in a separate check.  It's fine and
> good even if one bug triggers a lot of different warnings.  I'll write
> that, hang on, brb.

100% untested.  :)  I'll test it tonight.

There are a bunch of ways to write a check like this.  This test is
based on copy and paste, guess work, and instinct.  I normally just
start writing the simplest check I can and test that, then I refine it
based on whatever the common false postives are.

In this code, do I need to have a modification hook?  Probably not, but
it was in the original code I copy and pasted and it seemed harmless.
Slightly ugly perhaps?

I knew from experience that I want to check if it's an explicit NULL
pointer passed to IS_ERR().  There are a few ways to write that.  I
could have looked at the values or I could have looked at the ->possible
values.  I probably should have looked at the values instead...

The __in_fake_assign assignment is copy and paste.  I shoud probably
delete that but it's harmless and a potential speed up.  It was in the
check_check_deref.c and I don't remember why.  Probably it's essential.

I'm not happy with the DEREF_HOOK api.  I've been planning to re-write
that but I haven't yet.

regards,
dan carpenter

/*
 * Copyright (C) 2021 Oracle.
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
#include "smatch_slist.h"

static int my_id;

STATE(null);

static void is_ok(struct sm_state *sm, struct expression *mod_expr)
{
	set_state(my_id, sm->name, sm->sym, &undefined);
}

/*
 * The expr_has_null_exact() function means that it was explicitly
 * assigned NULL, not just that it is potentially NULL.
 */
static bool expr_has_null_exact(struct expression *expr)
{
	struct sm_state *sm, *tmp;
	sval_t sval;

	sm = get_sm_state_expr(SMATCH_EXTRA, expr);
	if (!sm)
		return false;

	FOR_EACH_PTR(sm->possible, tmp) {
		if (!estate_get_single_value(tmp->state, &sval))
			continue;
		if (sval.value == 0)
			return true;
	} END_FOR_EACH_PTR(tmp);

	return false;
}

static void match_is_err(const char *fn, struct expression *expr, void *unused)
{
	struct expression *arg;

	arg = get_argument_from_call_expr(expr->args, 0);
	if (!expr_has_null_exact(arg))
		return;
	set_state_expr(my_id, arg, &null);
}

static void check_dereference(struct expression *expr)
{
	char *name;

	if (__in_fake_assign)
		return;

	if (get_state_expr(my_id, expr) != &null)
		return;
	if (implied_not_equal(expr, 0))
		return;

	name = expr_to_str(expr);
	sm_error("potential NULL dereference '%s'", name);
	free_string(name);
}

static void match_dereferences(struct expression *expr)
{
	if (expr->type != EXPR_PREOP)
		return;
	check_dereference(expr->unop);
}

void check_null_deref_after_IS_ERR(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_hook("IS_ERR", &match_is_err, NULL);
	add_hook(&match_dereferences, DEREF_HOOK);

	add_modification_hook(my_id, &is_ok);
}


