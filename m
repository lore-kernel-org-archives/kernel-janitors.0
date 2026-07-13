Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547A3955F9
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 08:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929895; cv=none; b=mZOXn/xUtGQivBChsgLMOrVzmavM3J//VfI3Vq2NtrmJK11MC/zG5NrZRB45kC8XwJfq9Od40KZcKoCw9F88T7cmr5WWXtG18yHruX6cMX23zP8syprN2bi5+wWp2Klogxr+0IfbIsI/I6xPeJFl/aXHqYsDyVexyr1Q1cAX3ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929895; c=relaxed/simple;
	bh=DtmdeSEEkMd6hSliNTMBtdGoqWUa3F++SLfQRU48okI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCX7JfDw/9cUHCT+WoX9kgTOTG7Y/hewdaiy/iYWGE83auAO3jgQ0QHA8ph/74uttpZSH41pUxbbPSuk2wIwXojePrXD12hdtwlCqJvT1hF2cGGcY74WBfN0KBBb6aYNY13uW2NEUU8c2pnhNHhSD6me+LE8dJtTXAZSXf7uCWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMYTKyWU; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMYTKyWU"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7ebd88be784so1558315a34.2
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 01:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783929893; x=1784534693; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CApcsfFtc+hrLmr0JOKsk6dM8KUEWmCDq5Qyf4FUjUA=;
        b=rMYTKyWUSLs/oUugE/Dpodlq1QenIFz5RyE5NObychObG/BfxL3G4LUm3wLSz+YjNg
         V9C+EBwF/3CTTJQUrGMouX2AwoUxY2h+hVfadPkpT8MjCVfP/Kz1kUoVCGutXPe5+dtA
         rnBWH7l41cD7ISEjFJKSWzQKiV67wdVeR+ncPoC6CAHJoxl8715mkM/LTUNYC4Hey4x/
         sum5zB8n5GMPQ6xhdD8v6pd334+bO7+aS8dfXg1hv67m2Cw2jxoGdPrHIPjWiDB9+uIO
         0KOwWITFz5hAXJvFFshxWANNJ93+bWhXPpmbF0mmCSqSd81KWMKjFfOaVOVFfrWwPcKM
         oJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929893; x=1784534693;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CApcsfFtc+hrLmr0JOKsk6dM8KUEWmCDq5Qyf4FUjUA=;
        b=VYYyJ5mxIEKVvCVQ+WP3vRDlKXFfQnujlWTSKf4AtzBZ4E6gpRd/0IlKeNGKV3bTOe
         fSWg2OihTvi3K3IpFg5ri3nE7l1OT8QI8LMXngrDWzByDbQdZO1EXv3EVzm3RHavEEhR
         gsDInx7U72Cidrlqau9cVUHpa2+Ntt4N1HTwzR6j4FBGKgiB21JjN46BVnt6JZTRbidN
         KlaG+9bOKBPgfOJ5T7kHOb0LpC7N0QFavWnEmpM68mUZLMcYgxx8XNu9FwxyD4d9GV11
         JqmSuumxNP0Dwq/zCCMjyW/YbtGgK+pyjGpegplLECRi2NgSjfM5ORKgDaAjyDhzco/5
         W82w==
X-Forwarded-Encrypted: i=1; AFNElJ+QwqV8WBUAkxBMdEx99ZvG/esmdBTz8oXjce2tCE3JamLEHCupRh5Fwyit9jt3m04cO9Om/75RhRj67QoCGvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wlvB6M5HkgK4zB4n+/fE/w4i25Q9VgEGk67gqVyq38ftT7x8
	nLMc/2IYDSxa8hcu5fMvMt71v6uAxaZJAnL0DTDN6q8DqlnnHOlp5HdL
X-Gm-Gg: AfdE7clDrg7po2kFZF01dJZ/BWEMdEDToSbuRnuxXccr7WybP4bvQpZHo2zmJz1rPRx
	K1FkYAylLObJ65GnIt6vqr8T1ubIQ0GADRo0RpTRcQOBdbQ7GHjIq6RE92pMdlH1mjZZ/kdKKk7
	cN9gQ/949YzBGCEPFl2rmf0/boaPHrK8dwAwPzOT7WUzML/EjEQfutH5JVRfZ9Bi7D/gU7+H9Cb
	fWgn8XiCJD9o8QtOuXyur4IGHHLF70BDeH41louhtsoju9Y9Hmm1ERn65mqArKg6SzeLukAt4WH
	CjL8b1XDRU1wiV0ifLWfVdnVGBsmV9+nwbsaiaisV1OTHXDI4aKAiYRy1P5Jc0Lt5QajKI8DwEQ
	PrOmXWZ6RDmUeqcfoCpQIAVyPXLmMOkUtU3FrlP4OmRhcbOexABAyqWBnr0ii0I6ChOZ1Rw7jsO
	ujBpuX
X-Received: by 2002:a05:6830:6688:b0:7e6:de36:3f35 with SMTP id 46e09a7af769-7ec0966e43amr5571430a34.10.1783929892978;
        Mon, 13 Jul 2026 01:04:52 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb2631dfsm12412729a34.13.2026.07.13.01.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:04:51 -0700 (PDT)
Date: Mon, 13 Jul 2026 11:04:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Michael Grzeschik <mgr@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Yibo Dong <dong100@mucse.com>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: rnpgbe: Pass an expression directly in
 rnpgbe_rm_adapter()
Message-ID: <alScHkiC3EmGzOlI@stanley.mountain>
References: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>

On Sun, Jul 12, 2026 at 08:35:21PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 12 Jul 2026 20:25:10 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “rnpgbe_rm_adapter”.
> 
> Thus avoid the risk for undefined behaviour by omitting the variable “hw”.
> Pass the required address directly to a function call.
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 2ee95ec17e97c58b65e978a08b75fa8cb6424e4e ("net: rnpgbe: Add register_netdev")

There is no NULL dereference here.  It's just pointer math.
No need for a Fixes tag.

regards,
dan carpenter

