Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE043769E8
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 16:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933383; cv=none; b=A7f+7ZOjRWnV1EDPstSdYid5W9G6OOCNH4C46DgADOgGwYeui7iy79fIFWSD/bS4v6jT9wG5vy7y9MAuoje5aQIR1oh/6kv9LZxPD7i761KTk+5Ub5s66wjS59LppNnqTnU72AKAsXAf+fbElctUkL6iMAUPYusjg1zvf7RTXaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933383; c=relaxed/simple;
	bh=htt0EsCgKGEOGwB4NXwVuw4GDD6NZdPqsmXB/Uz+4WU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=q7lyMpKmMMPB5NU63XRojvp6F05IHoLqR5k8SCyBM/tCeY3gKk0TqmUg96giSeKvoUNTfcqYWFSU0U0EkQP50WMX4ygXu0UlEsu8uCxAbD5fQ5v8n07FOnxD31XxDPai3zn09eIf1yv3Bzwb6xvx0koT8iGJ/f9pE8sfMuR5wx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=VhGhyoPX; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="VhGhyoPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VTHvxHk58Hy9yWVXIJFZsnvlgi5O/jd00ePVFdBnr0M=;
  b=VhGhyoPX9L+7CzXTXGHbOFrxpBH6SVq10MGUobgSMwe/lDAaevk46boq
   CJZggOTS3XeSBiWeFqL0jGWfwDN6QPfd4BILk2UB9geO5Y0ns0/FemOxs
   CqBXIBYlPYRdoD0KUERCQRQ9LAqOfFJ05gz5ZQpvVq3Nu0YVcZsLckdKA
   U=;
X-CSE-ConnectionGUID: FDz94qMtSJ6RQ0L/wZIqaA==
X-CSE-MsgGUID: AXz4ZtmBQbOUCGb7Eb4Mnw==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,248,1779141600"; 
   d="scan'208";a="292056086"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 18:09:37 +0200
Date: Fri, 28 Aug 2026 18:09:37 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr, 
    kernel-janitors@vger.kernel.org
Subject: Re: Improving support for replacing expression parts by SmPL
In-Reply-To: <3e20eaeb-797e-47e9-8dee-a6c97f360a46@web.de>
Message-ID: <1adbaba0-d3be-a8f7-54ef-933a4fe02250@inria.fr>
References: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de> <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr> <b2fd77fe-fc97-412e-a5d1-69b88e27f61b@web.de> <47b6b35-2cfc-b5e-f96-8ec6548cd9@inria.fr> <3e20eaeb-797e-47e9-8dee-a6c97f360a46@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1769865536-1787933377=:104528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1769865536-1787933377=:104528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 28 Aug 2026, Markus Elfring wrote:

> >> I got the impression that some expression parts would be replaceable.
> > If you expected it to be replaced, you have to specify with what.
>
> I would like to achieve something also for another more detailed SmPL script.
>
> See also:
> https://elixir.bootlin.com/linux/v7.2/source/include/net/pkt_sched.h#L128-L134
>
>
> SmPL code sketch:
> @replacements@
> expression …, dev, …;
> @@
> (
> -container_of ( link , struct tcx_link , link )
> +tcx_link(link)
> |
> - READ_ONCE ( dev -> mtu ) + dev -> hard_header_len
> +psched_mtu(dev)
> |
> …
> |
> -refcount_inc_not_zero ( & r -> refcount )
> +p9_req_try_get(r)
> )
>
>
> Markus_Elfring@Sonne:~> spatch --parse-cocci /home/altes_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/list_inline_non-void_functions5-net-20251114-adjusted.cocci
> …
> minus: parse error:
>   File "/home/altes_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/list_inline_non-void_functions5-net-20251114-adjusted.cocci", line 8, column 21, charpos = 2685
>   around = 'mtu',
>   whole content = - READ_ONCE ( dev -> mtu ) + dev -> hard_header_len

Well, it seems that you have not provided a complete semantic patch, since
there are ...s in the list of metavariables, so I can't answer the
question.

julia

>
>
> Regards,
> Markus
>
--8323329-1769865536-1787933377=:104528--
