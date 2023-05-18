Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EAD0C77B7D
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 May 2023 08:22:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjERIWh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 May 2023 04:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbjERIWe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 May 2023 04:22:34 -0400
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 18 May 2023 01:22:32 PDT
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0729E2;
        Thu, 18 May 2023 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=9a8jzjXs3MLamS6mM9bcSsKOIMzXsAYe3LUcbXx8VFc=;
  b=blA/S39WDLdhEE2pUoGIYYSESevxG4BTk9EIDBPp6aCIj3DY5oigPl6e
   w27Zdq3mmzrfYx3EdEd759UTKzeLDlBKZsJGIT9YqVABzfbnD4WbA0Suj
   FlzRWy6ICUpKDDxZtkQAmJRTKTZiolhBDSHrpjUo0N0lnCgtfhSc9vl3l
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.99,284,1677538800"; 
   d="scan'208";a="56393996"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 10:21:27 +0200
Date:   Thu, 18 May 2023 10:21:26 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Dan Carpenter <dan.carpenter@linaro.org>, smatch@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Julia Lawall <Julia.Lawall@lip6.fr>
Subject: Re: devm_ on lists
In-Reply-To: <a2866a55-f3b0-ff99-b17c-8f0fc9e55e9b@wanadoo.fr>
Message-ID: <alpine.DEB.2.22.394.2305181009090.2858@hadrien>
References: <db0e0930-d76c-426b-9d9b-366f97d7e167@kili.mountain> <a2866a55-f3b0-ff99-b17c-8f0fc9e55e9b@wanadoo.fr>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-176162583-1684398086=:2858"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-176162583-1684398086=:2858
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 18 May 2023, Christophe JAILLET wrote:

> Le 18/05/2023 à 09:27, Dan Carpenter a écrit :
> > I sometimes have more ideas than I can handle in a day and my mind
> > resets every night so every morning I am a blank slate like that guy
> > from that movie.
> >
> > So I'm going to start writing them down and adding a hashtag.
> > #StaticCheckerIdeas  I'm going to CC kernel janitors until the Smatch
> > list gets archived on lore.kernel.org
> >
> > There is a bug in ti_sci_probe() where it does:
> >
> > 	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > 	...
> > 	list_add_tail(&info->node, &ti_sci_list);
> > 	...
> > 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> >
> > Idea 1:  If of_platform_populate() fails, then info freed but it's it's
> > still on the the &ti_sci_list list.  Look for list_add of devm_ data
> > and ensure that it's removed from the list before an error code.
> >
> > There are other lifetime issues surrounding devm_ data.  We need a
> > list_del in the release function as well.
> >
> > Idea 2: The other error paths all have clean up so last error path
> > should have clean up too.
> >
> > regards,
> > dan carpenter
> >
>
> Nice!
>
> A really naive:
> @r@
> expression m;
> identifier alloc_fn =~ "devm_";
> identifier list_fn =~ "list_add";
> @@
>
> *	m = alloc_fn(...);
> 	...
> *	list_fn(..., <+... m ...+>, ...);
>
>
> also seems to give some decent results.
> Written as-is, there is a lot of false positive, but is a start.
>
> I'll give it a look.

Here is an attempt that is a bit more defensive than Christophe's:

@@
identifier d =~ "devm";
identifier x;
expression e;
int r != 0;
global idexpression f;
iterator i;
@@


*        e = d(...)
         ...
(
*        list_add_tail(&e->x, &f)
|
*        list_add(&e->x, &f)
)
         ... when != list_del(&e->x)
             when != i(...) { ... list_del(&e->x) ... }
         return r;

Perhaps Christophe's more general list_add pattern is a good idea.

This has false positives when the return value is a variable that actually
contains 0.  These false positives are easy to detect.

This rule requires that the list is a global variable.  That constraint
implies that the rule gives a small number of results that are "easy" to
deal with.

Afterwards, the question is what does one do to deal with them?  If you
remove the line when != i(...) { ... list_del(&e->x) ... }, then one of
the results does have a loop at the end of the function that deletes all
the elements in the list.  That is fine as a solution if the list started
out empty.  Otherwise, I guess one would have to collect another list of
things added to the list along the way, to be able to remove them all in
the failure case.

If the list_add can be moved to a safer place, as Christophe suggests,
then that also seems like a good solution.  But often the allocation and
list_add are in a loop.

There are a lot more results if one replaces the two occurrences of &f by
... The typical result has the list being &a->b where a is a parameter.
Then one would have to trace up the nested callers to check that they are
all destroyed on failure.  That seems painful to do manually, and probably
painful to do with Coccinelle.  Does there exist some smatch code to do
that?

julia


>
>
>
> One of my first match is:diff -u -p drivers/perf/qcom_l2_pmu.c
> /tmp/nothing/perf/qcom_l2_pmu.c
> --- drivers/perf/qcom_l2_pmu.c
> +++ /tmp/nothing/perf/qcom_l2_pmu.c
> @@ -852,12 +852,10 @@ static int l2_cache_pmu_probe_cluster(st
>  		return err;
>  	}
>
> -	cluster = devm_kzalloc(&pdev->dev, sizeof(*cluster), GFP_KERNEL);
>  	if (!cluster)
>  		return -ENOMEM;
>
>  	INIT_LIST_HEAD(&cluster->next);
> -	list_add(&cluster->next, &l2cache_pmu->clusters);
>  	cluster->cluster_id = fw_cluster_id;
>
>  	irq = platform_get_irq(sdev, 0);
>
> which looks like a real one.
>
> list_add() should be at the very end of the probe in order not to "corrupt"
> the l2cache_pmu list.
>
>
>
> Adding Julia if she wishes to dig it a little more with coccinelle.
>
> CJ
>
--8323329-176162583-1684398086=:2858--
