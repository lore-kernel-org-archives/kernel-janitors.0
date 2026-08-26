Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F15235C687;
	Wed, 26 Aug 2026 18:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769410; cv=none; b=CSUx5kjXSF85j9P/PXMvEMnx8sSDnto64yByESEXTU7hHhgBuDkRVK02fn2Dag0arRJc8u82VqS3DgG+2uIrM5R/oKMRGwcD7smiAjcQW1HWFAhflcV1O+699T/qYhZZh4J5UlWoMn5WkY/2pWxbim8sVfl1ZN4hNgqxmJ102I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769410; c=relaxed/simple;
	bh=YlDpnlyCZjfv6j26TTWJyWs4USSSG0F06tPSsgcJM7Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=JcNGSwKqDBHTeZ3tGDL89qhvVyG+sxa7ZkhpXWLWrj26iIZ3gEhykxQDV4V6RNC9tjAwb0/MAoQNK5qL7lQeN7EjcxkXKMcT1hDAIRVrVAaSWn6ZDBlFes+mWowOEBTOftrZUsxXk0JHxZ6d+GzcS63pxRaRioGt9tEVQZJfltA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qlmWWhGp; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qlmWWhGp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787769391; x=1788374191; i=markus.elfring@web.de;
	bh=YlDpnlyCZjfv6j26TTWJyWs4USSSG0F06tPSsgcJM7Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qlmWWhGpxzzfRQDNCQ1bkzFEicD9MMTQkGojlWJ/t9iFNM39QN+ZAJPDfcM7iyRk
	 6Je6YJC+I6pPW0cFl67DxrjhboAk+9UmYMGJrwGKeUg6nAk4oDQ2K4bt/qKjpl4LF
	 0/68vs8JrwHRjwsU/wDDZDpSt9eprqZlBSuGI6mYTJOI+R0F5FP6Kzo81sAKSpakB
	 w8Y7QLGMZ4TK96wplxqm2Fs0OlQRmlrxfLSqvKBG7wRt5gzlUG6wUCoVbZXqR/x+Q
	 Otx0jVYhq6JMFmR61T9xIt5DKhPrUA8Zm1AGganPz1HnVGVftBM4yfcaizh2pKAza
	 iVFyiG3mOeVNlcyLRw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M1rTQ-1wx6cp0zTE-001Jue; Wed, 26
 Aug 2026 20:36:31 +0200
Message-ID: <29d4c995-4194-49b6-8994-eba662b73b56@web.de>
Date: Wed, 26 Aug 2026 20:36:29 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yang Zi <2959243019@qq.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com>
Subject: Re: [PATCH] regulator: max8649: Fix NULL pointer dereference in probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K3HSartTdco1SPceMUwSsShFw7Ho4KbqJINuguPPN6ahA8s9vXf
 4QoTPmQZKfJKX1Yi631/0CARBoC4ONVJ62v7Q+AXq7V+8HRHCdH+wDEuQBT/yuFHmD5ggzu
 Dsd14Ut/T0G6ZiSqk0WHM/eyPSy7CVZf/6/sDwXYnscYpwb3qGYFS/W6i7za0MWgNDPXJmn
 dYTkxVoIMsJVKYDJcyvwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cPk5MqerVn8=;A2MJQa25YynZmW8DMYbmq9F+2q2
 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
 gU/lunlUo0YzRv2vY/zIXSVN+/53Y=

=E2=80=A6
> Add a check and return -EINVAL when pdata is NULL.

How do you think about to perform this data processing
directly after the variable assignment?

Regards,
Markus
