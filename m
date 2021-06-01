Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE20C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 19:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 700506023B
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 19:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhFATxg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:53:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19422 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233853AbhFATxf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 15:53:35 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151JpgBE011387;
        Tue, 1 Jun 2021 19:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=lswwGf7HrZAvNQajxcbonvMl1C6xsRyUNOHRm7TnUlo=;
 b=DYqsvRIiP1GJRHkRU27tcMqPh1p1V5/GlCjnz0OsABoi56uqkbvS7ArK9l1UToAW510F
 /5O/GdW13+qsKZmjhW+K6L/hd7ofzbFPcKEF1+/lG3pFyhQpVqXTXDios/mpDnZxMkrR
 X/y93QEs1i9tsF6x0sNQO0v7dBuooMzc65M4g6RFJmrVcIFpDRWYqlfCQTtKTcWv9M0U
 FoB8OZY6mGMyp0xmnQZQyTrYHlqFNx1KpZFtsciJxVnY0ZutcPgZWJyF3H45MrdGxUOf
 6ggZkIvqEmAbkQod4Ee+VNQ8PTGJnlr8jTK51snMNxtQj7rp6Zjo3tbmhGPn4vGgpN2k EA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 38vtymgmyx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:51:52 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 151Jo5Ox166407;
        Tue, 1 Jun 2021 19:51:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38uaqwktgw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:51:51 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 151JppHn168461;
        Tue, 1 Jun 2021 19:51:51 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 38uaqwktgr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 01 Jun 2021 19:51:51 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 151JpoCe000559;
        Tue, 1 Jun 2021 19:51:50 GMT
Received: from kadam (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 01 Jun 2021 12:51:50 -0700
Date:   Tue, 1 Jun 2021 22:51:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <20210601193419.GH24442@kadam>
References: <YLX9FCOU0Il8Ejoy@mwanda>
 <YLZ0Q6S2A9kxXk6c@fedora>
 <20210601190040.GG24442@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601190040.GG24442@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: uftUXdnRRIYr2AZHFJ0Vy_aHS4Izhm22
X-Proofpoint-ORIG-GUID: uftUXdnRRIYr2AZHFJ0Vy_aHS4Izhm22
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Here is my next attempt at this check.

Back in 2009, I used to write Smatch checks which were too complicated.
Ideally, each Smatch check should only print one warning.  The state
engine should only have one custom state, and &undefined and &merged.
That check I sent violated all those rules.

The other thing which might be interesting is if you pass a NULL
to IS_ERR() and then dereference the NULL then print a warning about
that.  This has a lot of overlaps with some of my existing checks, but
it's still a new idea so it belongs in a separate check.  It's fine and
good even if one bug triggers a lot of different warnings.  I'll write
that, hang on, brb.

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

static int my_id;

static void match_is_err(const char *fn, struct expression *expr, void *unused)
{
	struct expression *arg, *call;
	struct range_list *rl;
	char *name;

	arg = get_argument_from_call_expr(expr->args, 0);
	/* ignore unknown values */
	if (!get_implied_rl(arg, &rl))
		return;
	/* error pointers are what we expect */
	if (rl_max(rl).uvalue >= (unsigned long long)-4095)
		return;
	/* ignore valid pointers */
	if (rl_min(rl).uvalue != 0)
		return;
	/*
	 * Don't warn if people are using IS_ERR() to sanity check their
	 * parameters.
	 */
	call = get_assigned_expr(arg);
	call = strip_expr(call);
	if (!call || call->type != EXPR_CALL)
		return;

	name = expr_to_str(arg);
	sm_warning("'%s' is not an error pointer", name);
	free_string(name);
}

void check_not_an_err_ptr(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_function_hook("IS_ERR", &match_is_err, NULL);
}



