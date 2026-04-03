Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BECC313E0D
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Apr 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255218; cv=none; b=VWgGW0WRD2OhR6f8HWLte1rk6bOZmayaRId2lctprCoDtIyVu+8A23UnHLXHf0A9S/DltWq+nv+KpvCnk855kzYy7+J4MCx4od84zUZm3EpdBiN2NY+6soZJn0jB7CUpqCnG4xUahCEgE/+PkmI4RzleX/f8tSIgSsAIdC7S2wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255218; c=relaxed/simple;
	bh=pw7ISAZ0ZJ5mAfmSZ+31Yt3oULJTqzOhFyOFlAXJJIU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=CMoBQIWU1R4RxjvvOJmGovIQB4EtStXJdiinIJvH/hNY2ABuKYTzQ1FRD1KAUsyd/UlylN3OZDUQ/xgMTesScB2mUBCw3aTUJSmRkN0sKtmguFHLqoTKqJCM4ujx299hx1qnqM/jckqU6QVTmt9v65j58B0f2rdv17SxOJ28JQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=probert.se; spf=pass smtp.mailfrom=probert.se; dkim=pass (2048-bit key) header.d=probert.se header.i=@probert.se header.b=IJ83kgo+; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=probert.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=probert.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=probert.se header.i=@probert.se header.b="IJ83kgo+"
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id D18C65A1031
	for <kernel-janitors@vger.kernel.org>; Sat, 04 Apr 2026 00:26:45 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id BD0405A0D38;
	Sat, 04 Apr 2026 00:26:45 +0200 (CEST)
Received: from localhost (unknown [172.22.191.6])
	by s934.loopia.se (Postfix) with ESMTP id BB2D67CEA50;
	Sat, 04 Apr 2026 00:26:45 +0200 (CEST)
X-Virus-Scanned: amavis at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s474.loopia.se (amavis); dkim=pass (2048-bit key)
 header.d=probert.se
Received: from s934.loopia.se ([172.22.191.6])
 by localhost (s474.loopia.se [172.22.190.14]) (amavis, port 10024) with LMTP
 id GLNAIXilYg9d; Sat,  4 Apr 2026 00:26:45 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: linus@probert.se
X-Loopia-Originating-IP: 94.191.136.33
Received: from localhost (94.191.136.33.mobile.tre.se [94.191.136.33])
	(Authenticated sender: linus@probert.se)
	by s934.loopia.se (Postfix) with ESMTPSA id 3036E7CEA4E;
	Sat, 04 Apr 2026 00:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=probert.se;
	s=loopiadkim1707418081; t=1775255205;
	bh=pw7ISAZ0ZJ5mAfmSZ+31Yt3oULJTqzOhFyOFlAXJJIU=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=IJ83kgo+uT4roRJ6/k7oDPOqSiLB1rCTRz87nPD0mNDdM58cIAGG4leypjq+BKAjc
	 P3oUfWuYEgdNyrjmsKYJPv+YCKEJSsRcJ52HwF8iRanzCZMzYj5uR66WVf0BjVL5p/
	 clPv88AZDAb24hrEIVlcZ8Q3hZ1MPwx1ZtZmK0VfzzBj+zht+jERpOLGfVc7wFpPRO
	 Ku1jmLwJ7b84mNVLTcGnpGmXsmPWQO3IdGIdfNtRI54282zy0B8crtsHd18DfqGJDj
	 mlIuqcBaWnn2s7K8RUKkdFz071T/IOOPQeWDpIlEJrr9yVtwc8sWH1BQMnE90FeOfN
	 e3Eyf+tFFMpSw==
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 00:26:44 +0200
Message-Id: <DHJVG6CPKGHC.2QS8V338CBA3F@probert.se>
Subject: Re: Status of kernel-janitors?
From: "Linus Probert" <linus@probert.se>
To: "Rolf Reintjes" <rolf.reintjes@web.de>,
 <kernel-janitors@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
 <acrhsqvXp4R-egW4@stanley.mountain> <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
 <245d14b-6f1b-1ece-a73-2021fabecd6@inria.fr>
 <DHJTVEP7FY8Y.1L1C3P9RYRR0L@gmail.com>
 <5f2579aa-324f-4ba6-a737-381ea22cfddd@web.de>
In-Reply-To: <5f2579aa-324f-4ba6-a737-381ea22cfddd@web.de>

On Sat Apr 4, 2026 at 12:20 AM CEST, Rolf Reintjes wrote:
> Am 03.04.2026 um 23:12 schrieb Linus Probert:
>> On Fri Apr 3, 2026 at 2:01 AM CEST, Julia Lawall wrote:

[...]

> Why did you not CC kernel-janitors-mailinglist?

I wasn't aware that this was custom to be honest. Apologies.

Br,
Linus
