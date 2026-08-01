Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C6B35CB6D;
	Sat,  1 Aug 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785572324; cv=none; b=eW2pKsO47kxZykCEXF2gp6MnSoAGdMPF+cDZyf1sOb4kgnCKFXY8GDzXMVS3smpXkv71PAK6FW3gwCPLoy5JZg6G3FBxaZm67KoNV5sFUO3y8nDCM+/pX4nfr1tksCb98HxPIhoP+RjI/NXy17Qne/+rGNRG38u4mDLR2X5XFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785572324; c=relaxed/simple;
	bh=edyJVeNpBdBL6GdDa9j75YJF/jZ94n2/1O8Ja3ab3jE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LZNMl/c9j/boLdWcR4EpdwFgJqZ0yul2ldOLKnIAd+w8fSvJd6cJJ/Y8Z0C+MC1JCNzxQLItAM9RuzRK8DmCnmWZ6STkndoLQy2mbt7gt5p5hwXrI423fP52GcGcdL/IrM+yJnRQctyrkOvYRU61cnSQg6oXtH+K+Axhe+ehtSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=pUBgE7qL; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="pUBgE7qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=qdqsv5AkPRtsvfQw7ries6OHtAwQs1BekKY/HE6SBI4=;
  b=pUBgE7qLn3DpjGT4xj5yIjUXq0GHY1Ag+UU+u6z9epvfLBt1k/P+xqbi
   TVA2EQvT8oz8RuaD3wqrYh8sGNBwv/v5G5CUCK/WqOhMjMInHQ7Tl06yi
   TzPjIi2yZFe35CpOw0vUaNku04CYPv/ZLpPWbz5kfm6Ympyb5yLwtE4VG
   A=;
X-CSE-ConnectionGUID: vHgSfTYMSeehxUGE6sV49Q==
X-CSE-MsgGUID: hd0LxffORvSmeTwj/cj4kQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,198,1779141600"; 
   d="scan'208";a="153419013"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 10:18:39 +0200
Date: Sat, 1 Aug 2026 10:18:39 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org
Subject: Re: Improving output for single characters (with SmPL)?
In-Reply-To: <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
Message-ID: <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de> <be2727e1-907e-487f-8522-e5aa694b1c38@web.de> <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 1 Aug 2026, Markus Elfring wrote:

> >> Which implementation details should be reconsidered here for an affected macro?
> >> https://elixir.bootlin.com/linux/v7.2-rc4/source/tools/bpf/bpftool/netlink_dumper.h#L25
> >
> > The shown source code transformation approach can be repeated on demand
> > for selected areas.
>
> I would like to add that only a single diff hunk is generated for the following script variant
> of the semantic patch language (as it would usually be expected for the mentioned software component).
>
> @replacement@
> @@
> -fprintf
> +putchar
>  (
> -stdout, "\n"
> +'\n'
>  )
>
>
> > Now I wonder about the following information.
> >
> > Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Linux/next-analyses> grep 'diff -u -p a/netlink_dumper.h b/netlink_dumper.h' /home/altes_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/use_fputc-bpftool-2.diff | wc -l
> > 2
>
> How can the generation of duplicate difference output be avoided here
> for other SmPL script variations?

I don't know the details o what you are doing, but if you have duplicated
output about herder files, it would be because the header file is included
in other files.  If there is no need to process the header file
specifically based on a given .c file (which would be the case for the rul
shown above), then you can use the option --no-includes.  If you want some
type information from header files but you don't want to transform them in
a way that is specific to the .c file in which they are included then you
can also use --include-headers-for-types.

julia


>
> Regards,
> Markus
>
>
