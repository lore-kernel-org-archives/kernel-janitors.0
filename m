Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A09FC4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 19:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AABB61378
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 19:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234574AbhFATCd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:02:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19476 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233970AbhFATCc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 15:02:32 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151IwIlp022661;
        Tue, 1 Jun 2021 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Tt6nhmGpZc5Poq2bYfj82jUOkVxYKSGi/Y6tYJFD/Cw=;
 b=0b9jahIoQS0QW7j7lKsTi1cDunMeABus1WkefE7plPOZHILo1LDVJWAXb3BueFfYfYou
 E73ZKLo6Y4kpuw3KZPJEJSE8NhjyxVHYvkeVmTsIr9OMW6je53ZrFzGFAuHtUMHMXGLl
 P0prQ+pTnMjfnZAGomiDZRMZL2i9b0TxDWqpOW5hwacP9mDKIMltWIeA6TZEZhGPufNl
 BFqJNkyJiz3taiP1W/hh44+mPjiDL8l51r2EOBerX5TEgSjoe2qe2f/g/YzdEHxE1NGq
 HOVp0/HYuu5bLapGj99vcv6uOYg65Zsc4sIApbyE8BJYZknQhokYin9+5ozacm9iLi4p GA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 38vtymgme0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:00:50 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 151J0nCA090304;
        Tue, 1 Jun 2021 19:00:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 38ude9sqmx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:00:49 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151J0ZxA088736;
        Tue, 1 Jun 2021 19:00:49 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 38ude9sqk7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:00:49 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 151J0lhT005030;
        Tue, 1 Jun 2021 19:00:47 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Jun 2021 12:00:46 -0700
Date:   Tue, 1 Jun 2021 22:00:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210601190040.GG24442@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLZ0Q6S2A9kxXk6c@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: 0q4COvu5n9gzTj_JjQRNILff8tWRL-J4
X-Proofpoint-ORIG-GUID: 0q4COvu5n9gzTj_JjQRNILff8tWRL-J4
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 01:54:11PM -0400, Nigel Christian wrote:
> On Tue, Jun 01, 2021 at 12:25:40PM +0300, Dan Carpenter wrote:
> > The alloc_migrate_huge_page() doesn't return error pointers, it returns
> > NULL.
> 
> Hi Dan,
> 
> I'm trying to start using smatch. Is this in the warns report?
> Wasn't able to find using smatch_scripts/kchecker mm/hugetlb.c (T_T)
> 

No, it's not.  I was never able to make the check work well enough to
publish.  To many false positives, because some functions return error
pointers depending on the .config.  Also I should have modified it to
ignore paramaters and only look at returned pointers.

The test is from 12 years ago and it's really bad...  :P  Also it
references some debugfs rules which changed a many years ago.  I have
to go for a call but it would probably take 15 minutes to write it
correctly these days.

regards,
dan carpenter

/*
 * Copyright (C) 2009 Dan Carpenter.
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
#include "smatch_slist.h"
#include "smatch_extra.h"

static int my_id;

STATE(is_null);
STATE(ok);

static void ok_to_use(struct sm_state *sm, struct expression *mod_expr)
{
	set_state(my_id, sm->name, sm->sym, &ok);
}

static bool is_basically_unknown(struct expression *expr)
{
	struct sm_state *sm, *tmp;
	bool known = false;

	sm = get_extra_sm_state(expr);
	if (!sm)
		return false;

	FOR_EACH_PTR(sm->possible, tmp) {
		if (!is_whole_rl(estate_rl(tmp->state)))
			known = true;
	} END_FOR_EACH_PTR(tmp);

	return !known;
}

static int rl_is_null_and_valid(struct range_list *rl)
{
	struct data_range *range;
	int i;

	i = -1;
	FOR_EACH_PTR(rl, range) {
		i++;
		if (i == 0) {
			if (range->min.value != 0 || range->max.value != 0)
				return 0;
			continue;
		}
		if (i == 1) {
			if (range->min.value == valid_ptr_min && range->max.value == valid_ptr_max)
				return 1;
		}
		return 0;
	} END_FOR_EACH_PTR(range);
	return 0;
}

static struct expression *get_call(struct expression *pointer)
{
	struct expression *assigned;

	assigned = get_assigned_expr(pointer);
	if (!assigned)
		return NULL;
	if (assigned->type != EXPR_CALL)
		return NULL;
	return assigned;
}

static int is_a_debugfs_thing(struct expression *call)
{
	if (!call)
		return 0;
	if (call->fn->type != EXPR_SYMBOL)
		return 0;
	if (strstr(call->fn->symbol_name->name, "debugfs"))
		return 1;
	return 0;
}

static int returns_err_ptr_sometimes(struct expression *call)
{
	struct range_list *rl;

	if (!call)
		return 0;
	/* get_implied_rl() should normally return success here. */
	if (!get_implied_rl(call, &rl))
		return 0;
	if (rl_max(rl).uvalue >= (unsigned long long)-4095)
		return 1;
	return 0;
}

static void match_is_err(const char *fn, struct expression *expr, void *unused)
{
	struct expression *arg;
	struct expression *call;
	struct range_list *rl;
	char *name;

	arg = get_argument_from_call_expr(expr->args, 0);
	if (!get_implied_rl(arg, &rl))
		return;
	if (is_basically_unknown(arg))
		return;
	if (rl_is_null_and_valid(rl))
		set_state_expr(my_id, arg, &is_null);
	if (rl_max(rl).uvalue >= (unsigned long long)-4095)
		return;
	call = get_call(arg);
	if (is_a_debugfs_thing(call))
		return;
	if (returns_err_ptr_sometimes(call))
		return;
	name = expr_to_str(arg);
	sm_msg("warn: '%s' isn't an ERR_PTR", name);
	free_string(name);
}

static void match_dereferences(struct expression *expr)
{
	struct sm_state *sm;
	char *name;

	expr = strip_expr(expr->unop);
	sm = get_sm_state_expr(my_id, expr);
	if (!sm)
		return;
	if (!slist_has_state(sm->possible, &is_null))
		return;
	if (implied_not_equal(expr, 0))
		return;
	name = expr_to_str(expr);
	sm_msg("warn: possible NULL dereference of '%s'", name);
	free_string(name);
}

void check_err_ptr_vs_null(int id)
{
	if (option_project != PROJ_KERNEL)
		return;

	my_id = id;
	add_function_hook("IS_ERR", &match_is_err, NULL);
	add_hook(&match_dereferences, DEREF_HOOK);
	add_modification_hook(my_id, &ok_to_use);
}





