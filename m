Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793545518;
	b=Gw7OGBh+4tBq6FkL//GoxJ8QIDp8ts+M64FHFuO6Tk6V0bbfGZWhOfiSmOCh+mKtrVyZ
	 gsZfI3ionOIPsVofLTMugF2lXHMLFs+fVWrFTlV5qzPHkoi8pDBvqSuIF5sFw6Sa0Mp5c
	 /uKU2YKLojrQS46VyZNCNyVpHJt0P5uwjv41dZi1r2Ku9cpawLPDOt3t2GFsZK2UJ5CS6
	 4WVgRumIgBmBjjaXVeaSmoZOdPdD6DfpCX3FGZFbwNzQdbrWhDRFJX55tYsyI/MreLJ3Y
	 e4xLEKQ3XPj6uJwe+ZKQIm3jW/3gfqYwpiZnjBuhIpCKzb/HRjjYURlygkK1MVRwHQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793545518;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=iR1PkMCGioT83Lr22OKwS6xnbl0LkFIxtbGUSz+GNTs=;
	b=pJZSHMYjVr3a5r0zx3FfOkk2PhaI8ZYhC4y5Ek8mSV01CLTtZWPCcVj7vYQIArrgtG4I
	 nMQBNDQXJ8hcrLrWv9yRoHHyVyud9fbFnGQuKyl/b3STYOG7G9aQBR7qNIk4DIVoJyWIh
	 eUgWyIU0Adm39XaaJ8VgkBNx4sFUSZ6TRp2tSUQcQXA1hyuDkUvgKVAsYfomwIIhvvHPk
	 LYGLkEEMK7T7XF0l+1GJuX1FQtSk2De75zPJzMwrJlpEeq61qcUMbCVQ2pimAiq08v+DB
	 qLRDUgla0KqRu9lxA0wwatBlgxJ2cxHpQwUymlbIzgscd0V9RItE/nszwcXn0z5m08g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D099D606A325;
	Sun,  1 Nov 2026 15:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D099D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=n7OxxnOI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iR1PkMCGioT83Lr22OKwS6xnbl0LkFIxtbGUSz+GNTs=;
  b=n7OxxnOIp3nrIbypaG/4v2H1AejSV7vofAdifTtXmBO+qj8UXCo5Jvzb
   Rn+SAlviClMsujr/SjkBK5D/WMJvlt3E/Qc01TcI0HoBJnIDN6YqkzYBa
   93M+hVC4DIQ4QFi8Ex9je/u8BzebZZpCdizLa93M6BUf+EL9fVTej3eW5
   Y=;
X-CSE-ConnectionGUID: aDNy7RhGQwqgoxsRYcHIHg==
X-CSE-MsgGUID: Kog4sLtsRzuUpZQ8Pdqaqg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="303208856"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien-2.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 16:05:08 +0100
Date: Sun, 1 Nov 2026 16:05:08 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Distributed data processing for SmPL scripts
In-Reply-To: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
Message-ID: <b55ad049-86e0-f737-a96a-f3151db5012@inria.fr>
References: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sun, 1 Nov 2026, Markus Elfring wrote:

> Hello,
>
> Some developers got used to tools which support distributed data processing
> for compilation tasks.
>
> Examples:
> https://www.distcc.org/
> https://github.com/icecc/icecream

Maybe such things can just be used off the shelf, since Coccinelle can be
invoked from make.

In any case, I have no intention of working on this.  If you want to
contribute something, please go ahead.

julia

>
>
> Would you be looking for similar needs also according to source code analyses
> and transformations?
>
> Regards,
> Markus
>
>
