Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561782F90E0
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929187; cv=none; b=MsA6XLj/bh3EIAfWiCy2f4eRsULwQk6QDqHK90wnhTU8J22BXITIr9OKFjerp4/q6BNIFBWUSNPoQiJHxnOreyGGBYpfY0SQSR+UYj2s13fdGafSjIbWZUWlX42CX4hiDf+4Gs/5DUHbEjmYtYePRyWIcNZvfgBXYplEsY25fKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929187; c=relaxed/simple;
	bh=sMiSC/Oce1KVFHiYY/YLdPcPekohNK1Xq/qrVVrmZp4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MsKi9M+SjtYhnXEzqSnjTPOb+dN4CxW9nmWMe8R3cAIWTliFCw4vTMtcdaccfq95xtine3fMIr7Cbxz4t95T7tD8dmQqqoTyDgBfOXgXCccx2YswxjahrOpt1PUlXZKRyx7Grl7QtT3YQpfbryB+07echyACcj3lLjht6qKWwSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=qog7QvqR; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="qog7QvqR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ehTcZZHGYHICoMybqWSzwAd6F9OVvnlKBiWTIUGdtys=;
  b=qog7QvqRbcUYUZxfjbl/Kn8vQxCnn362kmqWMpY7uH8Jd0rSyPE880Dd
   T0M7C7IX6olz+0jgH9LHAY89L6VLL6Y89g+0KCYYS23YygnowCBcm3WlY
   lRZmHRHP1C+HC6ExXRwshoh1qSbsMZADWj2dGh+MmkjFoevC32guBVpTS
   o=;
X-CSE-ConnectionGUID: Gu/TdZFIRFmZJaQPNLkw2A==
X-CSE-MsgGUID: uHQ7BBZZRfKsT2wnfqlR2g==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,248,1779141600"; 
   d="scan'208";a="155313810"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 16:59:37 +0200
Date: Fri, 28 Aug 2026 16:59:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, kernel-janitors@vger.kernel.org
Subject: Re: Improving support for deleting selected macro calls with SmPL
In-Reply-To: <b2fd77fe-fc97-412e-a5d1-69b88e27f61b@web.de>
Message-ID: <47b6b35-2cfc-b5e-f96-8ec6548cd9@inria.fr>
References: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de> <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr> <b2fd77fe-fc97-412e-a5d1-69b88e27f61b@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2146134731-1787929175=:104528"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2146134731-1787929175=:104528
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 28 Aug 2026, Markus Elfring wrote:

> >> Another SmPL script example:
> >> @deletion@
> >> @@
> >> -READ_ONCE(dev->mtu)
> >>
> >>
> >> Questionable test result:
> >> Markus_Elfring@Sonne:…/Projekte/Coccinelle/janitor> spatch --parse-cocci delete_READ_ONCE_for_mtu.cocci
> >> …
> >> invalid minus starting on line 3
> >
> > You can't simply delete an expression.  The resulting code would not be
> > valid. …
> How do you think about to improve the error message anyhow?
>
>
> > The problemn has nothing to do with READ_ONCE being a macro.  It occurs
> > for any expression.
>
> I got the impression that some expression parts would be replaceable.

If you expected it to be replaced, you have to specify with what.

julia
--8323329-2146134731-1787929175=:104528--
