Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723906;
	b=rt+nEr8Wp0BAzN3Eg/QAaHYLbJCoMP0evlEwM9wq6eOVB0TKZTa6s08ALJBTq8dlExyI
	 rESMqLOPJQ3LnK10aEXy0r9Fiv8963I0AWHUwZNYz5LcuHv/EQ+eobQQsYIwpkaxQz/8E
	 ZbZaoo8IGORGogTG/zlWewAtJRKTa9ZrjQnZbbA4QYtFbGm0DiM0q/eW9HHdvKa0mSAJw
	 NBM4qn5d/9Eeomaj4nOE5Zcs3ntdlmJOpqIq4lqcaf4duApBfCRNbnZQgPiLTRmO5QT7t
	 SwKp5XG8AN43kq0/b3A74a64lsu2D6HGSFAkK4DL9hMy7KnoSU5C9E8ebuUXfLt9T6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-ID;
	bh=HY4Dd0Zbou7obxIpf8q47+lTpf0BW1FP4z2nkWOCkl8=;
	b=GTe3Gmw2xxTEwLEItkj/HfN2zH076lhdWkKPIDn8M1AOuRhm9HtVVyQDNC8n6kXDXZJn
	 hD2qz372nmAy13egOpfLPxRVxJvFWg548JlfHtVb8lG/cU/MiU9Tz/o3UqeznUM+QlEp0
	 pC3xIi3SZOzlr2uKBpqVh3N7RhHDNl1xkIn+PIcKb18yhxgN3/5T2kjLBzs0mPaiXBEMR
	 8bwISz+vf8xtuSHFgsYhzaMDwJDi9Sm/CNmO+2SkJxbk0D5ufH0aZ5SDMwoWkYe2wdlnl
	 BOcfsoVR88MhlTPMtJcN00WDJokRMPTDHGwVONLaqKDiVd1W/CQuLVTu7FAuJTABdZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9E6606A328;
	Tue,  3 Nov 2026 16:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9E6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=JmkENaVU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=HY4Dd0Zbou7obxIpf8q47+lTpf0BW1FP4z2nkWOCkl8=;
  b=JmkENaVULp79A4IA//PvHHncEPCo3gjPpWx1T0OwcZckxWgZXDADpLwU
   JghimYRMpYedMV4uF/XRiFZ0IUACwkwwsgtFv65bUD6TqRPJBAb6pXt9e
   0C2FvgyLNki47STtrDoqcC4tl9EIF3USRc7qrHeS/UtDMl/vwwlbTLack
   o=;
X-CSE-ConnectionGUID: +EappCgOQEWmrcq4ShxV2A==
X-CSE-MsgGUID: z9Yaetg/SMCm4g20GmXW3w==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,193,1787004000"; 
   d="scan'208";a="161648430"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 17:38:22 +0100
Date: Tue, 3 Nov 2026 17:38:20 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: cocci@inria.fr, tools@kernel.org, kernel-janitors@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Replacing special goto statements by direct returns?
In-Reply-To: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
Message-ID: <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-489044682-1793723734=:3641"
Content-ID: <791c737b-3292-d1ac-a25-2578cac8bd7@inria.fr>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-489044682-1793723734=:3641
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <d52ad096-714-ddd1-6ad5-f1ea219fc09a@inria.fr>



On Tue, 3 Nov 2026, Markus Elfring wrote:

> Hello,
>
> The documentation for the Linux coding style contains the following information.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v7.4-rc1#n526
>
> “…
> The goto statement comes in handy when a function exits from multiple
> locations and some common work such as cleanup has to be done.  If there is no
> cleanup needed then just return directly.
> …”
>
>
> Thus it seems that the following script for the semantic patch language
> can work to some degree.
>
>
> @replacement exists@
> identifier label, var;
> @@
> -goto label;
> +return var;
>  ...
> -label:
>  return var;
>
>
>
> Unfortunately, patches would be generated then by such a simple SmPL code
> which would still preserve return statements that became unreachable.
>
> Test result example:
> Markus_Elfring@Sonne:…/Projekte/Linux/next-analyses> time spatch --allow-inconsistent-paths fs/xfs/libxfs/xfs_btree.c …/Projekte/Coccinelle/janitor/replace_goto_by_return2.cocci
> …
> @@ -1735,7 +1735,7 @@ xfs_btree_increment(
>                 --lev;
>                 error = xfs_btree_read_buf_block(cur, ptrp, 0, &block, &bp);
>                 if (error)
> -                       goto error0;
> +                       return error;
>
>                 xfs_btree_setbuf(cur, lev, bp);
>                 cur->bc_levels[lev].ptr = 1;
> @@ -1747,8 +1747,6 @@ out1:
>  out0:
>         *stat = 0;
>         return 0;
> -
> -error0:
>         return error;
>  }

I think you can do:

@useful@
statement S;
expression error;
identifier error0;
position p;
@@

S
error0:@p
  return error;

@useless@
position p1 != useful.p;
expression error;
identifier error0;
@@

f(...) {
(
<...
- goto error0;
+ return error;
...>
&
...
error0:@p1
  return error;
)
}

I have not tested this.  It might not work, or it might be very slow.

julia


> …
> real    0m1,074s
> user    0m0,995s
> sys     0m0,071s
>
>
>
> How should such a source code transformation approach be improved accordingly?
>
> Regards,
> Markus
>
>
--8323329-489044682-1793723734=:3641--
