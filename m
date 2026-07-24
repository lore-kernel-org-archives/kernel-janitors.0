Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B7A1E9B37;
	Fri, 24 Jul 2026 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908976; cv=none; b=nUSeSQV6u0CT05PDbTCFRc0+zaSBYk6Dd95Hk2X9/hg3r1bBSAnNNo5cA+yTpQyCp53zzCCtl2vhjuX4ASRGxn3Ijm3aR9cjNQLBO+kSrjdC2reQd4qMUiW0h7/17Unk9D9zXvP4ggewmE41Fo9Vf9FzbC2G5hPh0NNIAKOc8ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908976; c=relaxed/simple;
	bh=5AepKk40Ax/rjRJzAsAJd17jiG8G15kFF+9fw3OOjFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=kZi0xUSee6yNJ0Da/+ZXD70qB5lKB4PfPupmkJ2yPrNNgFxUaD/66CUm6HNiSzxCvhj8mxCBhhhWx3O5ZaXuoDRujLzy4DwVtZ2q2lEBu5whWIsHDxcLcoEw/B2iTMWNHlP1KOEatSPFiyS+bCUhirk7Yxp/ktUm/N6Ii/X6WZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EfUa5sIK; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EfUa5sIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784908971; x=1785513771; i=markus.elfring@web.de;
	bh=ywxZDkvqJBV/i4HUxuyo9WmWR2E71GwILNwSPV3cQiQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EfUa5sIKVUdhT+hnIbqB68EgaC4opCY348n4Qki6KbvKg2eeSQJ0sucge2rDFR37
	 XotDwwZSR7UAhuUGJVqhnQeV9HqE3qoBFFY1tFwFqdilkUNHx6MexesqiUbYmgT5c
	 qjPlAhsAdcoXFqKe+pWVrz8JSP1AUplycEEzseB9Afqj0CQUQkvxoCsS9aliRY/Jf
	 Yb0/yPnE8t78wdEt/6Aky3B8p/KbPiBgiInI9FeSuhlDuJoeiOTaX35CwvgCHD1EM
	 DM1QyoU2BdHII673x03BaIkKUqrRHRHIWmy2MiG5Qqpoc7cqNkpcZ3tcFtYwolXti
	 VhItK6Pjuhh7xwfiag==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MvKXV-1x4YEE0fXV-017uOM; Fri, 24
 Jul 2026 18:02:51 +0200
Message-ID: <5fcabf68-1a24-4438-acff-aab0ca470f39@web.de>
Date: Fri, 24 Jul 2026 18:02:47 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [1/36] coccinelle: misc: add cond_return_no_effect.cocci
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 Sang-Heon Jeon <ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-2-ekffu200098@gmail.com>
 <CABFDxMEuccFb2zPoA_Fdc6jswhqzMN62At9kEFqGBL5DZOj3DQ@mail.gmail.com>
 <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
Content-Language: en-GB, de-DE
Cc: Nicolas Palix <nicolas.palix@imag.fr>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <514fd536-291a-bfad-fac8-15e0d0611689@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XrVWt5BP3ZgxJ0TUrTH7FU5MrmggqRupGBnFkQnzRMUlYSy6X8o
 WWDBLN5rjHblCC1377EPMmQHnjyA+4BKn02wsEDi8IG+UfpPL8XLE4QFpNp24vK1MyezEOM
 ImsYwiX39jghNckPuEyINlsamj13fPXTJe89Dxj4185MVXya4JbZDXVkSxIHxKYPUyCOaAc
 Vt015cCr4CQ1fWIegzILg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3hsnsa70vjk=;qbaZtHeQA+bo8ujxm+q2VQ6vdCw
 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
 ptjYByyy90CZYU7VJl9Zf7tXrZCnVPIKZvb1oD0

> I don't see an opportunity for more efficiency for the above rules,

I hope that such a view can be extended.


>                                                                     but go
> ahead if you have some idea.
Several ideas were mentioned in known information systems.
It is unsure if they can get ever more corresponding development resources.

Regards,
Markus
