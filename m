Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AD239A05C;
	Mon, 10 Aug 2026 06:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344534; cv=none; b=SddpGf0qCFZ8E3OUFlF0ydvQyGL/+TFEa7EX/sEx366Bl1DKEltTP8KcohPXAA7FvX4bhYNKKZ9svdsX98Vq75kA2lW4/2+M8S25pMWIJAHIG4YTtEeDrSxl5B0g2MK34kFC8GqTNCUjUqn7m3cdyj+fzeztM+ZDUAPqeoi8Mro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344534; c=relaxed/simple;
	bh=AnrOAkHGfBHKokHdW8R3taVCnTdUJM7T36PLvpCTe40=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mGdOfA5uLvXgP1DJW7l2i8Z0I+wKJkPzKFEW6gI9RQjrvZiOwCaUO+6XRaHrBSUA/aeplLgLZXJN/6Os0lHtCW4UV5ikuaQ61MM8hYZV9Lk/sXDjStQNAHM9ZIeMlO56IaaIHOeYozz8E3Jl1t/pnwkanNdp33GI8Qd69KXO6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=OEjJ4kt3; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="OEjJ4kt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=64I2sy1dW9w9ftDf3f6K4/E7F9KthV/TOil0If0YQkg=;
  b=OEjJ4kt3jErE8FZQaKYQcfCHTeGHzefEAdcjF4cP2dXMs3/2+FgLM729
   rBAA7bWCTUv4uDO6G1edlnfon/RFUSrwYMay1O23Avx0Ed3vRLLmhvBId
   RqYUIFlorvm5UjMnUe2AZOOwMvpP4q7/61jotomcnl/jEB320Va44jiNJ
   M=;
X-CSE-ConnectionGUID: /e/A4jIVR/KSY7Thx9/j7A==
X-CSE-MsgGUID: UvIU+1WFRtq5Gd+QH8WBng==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,215,1779141600"; 
   d="scan'208";a="153947834"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 08:48:44 +0200
Date: Mon, 10 Aug 2026 08:48:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, 
    Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [cocci] [PATCH] coccinelle: scripts: coccinelle: devm_free:
 reduce false positives
In-Reply-To: <ef5b5f36-a1a2-4723-bc34-4ec7a5350ef2@web.de>
Message-ID: <27fd1773-a8ba-afe3-1cb6-51e4bc94d641@inria.fr>
References: <20260809165340.1719736-1-Julia.Lawall@inria.fr> <ef5b5f36-a1a2-4723-bc34-4ec7a5350ef2@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1551342331-1786344523=:38388"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1551342331-1786344523=:38388
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 10 Aug 2026, Markus Elfring wrote:

> > False positives could be introduced due to allocations using the new
> > _obj functions.  Add these to the "safe" rule accordingly.
>
> Can the SmPL disjunction specification be refined another bit?

As usual, a random comment with no context that makes the reader have to
go look up some other information to have any idea what you are talking
about.

Anyway, since I did take several minutes to go find the file and look at
it, I guess you want the disjunctions to be ordered by frequency in the
code base.  But I'm not going to do that.

> …
> > name has two possible types.  Incorporate type informationt to avoid
> …
>                                                  information?

Thanks.  Fixed.

julia

>
> Regards,
> Markus
>
--8323329-1551342331-1786344523=:38388--
