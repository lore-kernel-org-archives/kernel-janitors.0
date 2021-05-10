Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6EAC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5C3E613DF
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 May 2021 05:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhEJFlN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 May 2021 01:41:13 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:46810 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhEJFlM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 May 2021 01:41:12 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A5cb0q014586;
        Mon, 10 May 2021 05:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=strZm/gR8zTg7ZItr46rKourU/RpLdZ1P+NAJruLddk=;
 b=tsv4sjqDm7l3f8LEdN8vs2BkGBPpQrm7tl6aUNCeDVNMLL2ahEhJlk6bNpXN7DNBt7Mx
 D/R6kp2xuo0w/CNatSW82U8HnRxi7cRSAPugiwNHHG0SE85rjIP4i6IR3HKvyrynakyN
 tZUrEQRCI12tXdg5cModtqadkpt5cP1bctklweua9u98l793F4ibAHTtzcQQDOaOC0FN
 8NA6hJWxsho9io5rX/vDpEDyEpEsNltAe+i6W6ZxrqpR8TRHG27M4srQQjDBUWH2txcE
 GC1A1foJn9vrJWbmy1r/iG5zhZhO0KRQoE32T/MiyX8o1XjJht+qUg7iTMAjHVMra54w qA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 38dg5ba09y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 05:40:07 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14A5ZVbi004834;
        Mon, 10 May 2021 05:40:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 38dfrupyv4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 05:40:06 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14A5e6Pc016675;
        Mon, 10 May 2021 05:40:06 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 38dfrupyu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 May 2021 05:40:06 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14A5e4bB029821;
        Mon, 10 May 2021 05:40:04 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 May 2021 05:40:04 +0000
Date:   Mon, 10 May 2021 08:39:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ACPI: scan: Fix a memory leak in an error handling path
Message-ID: <20210510053958.GO1955@kadam>
References: <63bf4e87eb42fa3fff2cd87eb605ebcc01f4b2f7.1620458525.git.christophe.jaillet@wanadoo.fr>
 <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOc6etbPaPOjdcfYBY1i_N0V6Tua9p-OL5Hw7PgJ6T7dfRrhfA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: LVSvsJAr6c74tAIXZuN7eRE3cYGCdskB
X-Proofpoint-ORIG-GUID: LVSvsJAr6c74tAIXZuN7eRE3cYGCdskB
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9979 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105100040
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 08, 2021 at 08:50:44AM -0600, Edmundo Carmona Antoranz wrote:
> On Sat, May 8, 2021 at 1:23 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
> >
> > If 'acpi_device_set_name()' fails, we must free
> > 'acpi_device_bus_id->bus_id' or there is a (potential) memory leak.
> 
> This is a question about the style used in kernel. This function
> (acpi_device_add) initializes acpi_device_bus_id and it could also
> initialize acpi_device_bus_id->bus_id and any of those might fail. And
> they will have to be freed if they are initialized and so on. I see
> that there are kfrees used for them in different places before using a
> goto err_unlock; I wonder if it is accepted practice to avoid doing
> these kfrees and have them in a single place instead, something like:
> 
> err_onlock:
>     if (acpi_device_bus_id) {
>         if (acpi_device_bus_id->bus_id)
>             kfree(acpi_device_bus_id->bus_id);
>         kfree(acpi_device_bus_id);
>     }
>     mutex_unlock(&acpi_device_lock);

This would introduce some bugs so it's not possible.  And it's also
really ugly.

What you want is that when you're reading the code from top down, it
should all make sense without scrolling back and forth, up and down.  So
choose label names which make sense.  "err_unlock" shouldn't free a
bunch of stuff.  You don't want a big nest of if statements at the
bottom.  The if statements in the unwind code should be a mirror image
of the if statements in the allocation code.

The best way to write error handling is "free the last resource style"
where you free the most recent resouce that was successfully allocated.
That way in your head you just have to keep track of one thing, instead
of tracking everything.

	a = alloc();
	if (!a)
		return -ENOMEM;

	b = alloc();
	if (!b) {
		ret = -ENOMEM;
		goto free_a;
	}

	c = alloc();
	if (!c) {
		ret = -ENOMEM;
		goto free_b;
	}

	return 0;

free_b:
	free(b);
free_a:
	free(a);

	return ret;

The error handling is just "goto free_b;" which is immediate.  Error
happens and, boom, dealt with.

It's not like in some kernel code where it's error happens, "goto out;",
scroll down to the bottom to see what "goto out;" does.  Then if calls a
the drivers release function which frees all the driver resources
whether or not they have been allocated.  So now you have to trace
through a bunch of if statements and no-op free functions.  Then if it's
correct you have to try remember what code you were looking at
originally and find your place again.

regards,
dan carpenter

