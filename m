Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3739CCEF;
	Thu, 13 Aug 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786614252; cv=none; b=meYzxIDQZx+n7sxbGqKhhGrLdC8XwpCxr2uTgB6Rj0K2VTRtxlsguzmvg50YkX+B5cNw1pnIaNQDQHWotSWOJCHzZ1+r0ygubhSpvmC/O9+IScAdKKVJANBvqZKb/l7uh6spkFXUai6/KaWAeTheGy3pCFFdYsUL5Zmjgf/lpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786614252; c=relaxed/simple;
	bh=+aupOxole8doPnhUl+CX4EmAgyb7a0s+Mr7BO//ceAc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lvgtHxTxQM7QycnFLhH/qDg1m15aDJk0xwqBZHxD6SCPFoTS1uId9JCFRKFDyvYrqNj/UuI51w/gbA/i44URa4QoyuHQ6WWNZEI2hpG+BCk2UzegfmMv+AhtSnX1iqCwHK/v44AFJPKlWhXcE2WqP3qObJw8w2Pjp6UIuwecwZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=jyysQfrG; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="jyysQfrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786614242; x=1787219042; i=markus.elfring@web.de;
	bh=+aupOxole8doPnhUl+CX4EmAgyb7a0s+Mr7BO//ceAc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jyysQfrGRQVBzCzpunlQOSDXDiCoOriRVmnk/jPTWbChA1sFBztlKNFp94TqbcaH
	 QPPAWBZfdnmSy3pSjmjm/UMuqegnoBfOPjxRUKJ+ScO504Um1UpJfbCMRjbDQ2BgY
	 zF59SLHfYrfCTP8eF90I1ZjndLi7Ecqf1NF13nzglDTBIzWW+DBfMbYnsQaIH1miD
	 nVQa7+TE7YGR/Ha2VzVjCX5wbXg9vAWBc1jjh4yM5Ot+aWTvfggZ7ow6eHbLfp6my
	 xfrxMqhWqTRlq1HS1w7yHFel+ZTClbiEztQ13tqLi/1HgloJjny0eYChHOitQCsgJ
	 raYsIES2YX2khbb1dQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MTOlk-1wQrrq1Ko8-00IIGE; Thu, 13
 Aug 2026 11:44:02 +0200
Message-ID: <e46362c2-085d-4083-96a3-3e289553d1e2@web.de>
Date: Thu, 13 Aug 2026 11:43:49 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rosen Penev <rosenp@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20260304041602.7539-1-rosenp@gmail.com>
Subject: Re: [PATCH] phy: uniphier-usb3: no devm for nvmem_cell_get
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260304041602.7539-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nIF3iz0+uhpRJ4xGWUPICsuDAzvKkYWZtaBvengcTLhg0VO/Pwf
 J0PHbBoUaQ9VdGug6mSrSbECYiB/gWLVyDh9fOS3a0tlSsCcBNJrwbTlNeA+8a8yLZWT0I8
 mMZqAPTwTRTruBh1Rf7BNJ9YQRm6YxOK7HvjcR58lnBzPlYZgJnZOU4l5SO7ko34Oe9L/ZU
 jG5FzRwa0umtGbgJA8w2w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OGAHi3DHNNs=;Lw+VYNinj+YZT+JUNmgnIzQL215
 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

> There is absolutely no reason to extend the lifetime of nvmem_cell_get
> to after removal of the driver. Use and free right after use.

How do you think about to increase the application of scope-based resource management?

Regards,
Markus
