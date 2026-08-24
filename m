Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D413B42C9;
	Mon, 24 Aug 2026 05:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787550247; cv=none; b=jLAxv9wjLAGlg8B+FnwLDjjqFgtj9UHIOXUUuU6rpqW8RSQYy5j63gSdmCpMNXrNDCKOhVd66lUc2jPCAsHowpohVGyhDPvUQc2KjR3POP9VS0OSOzFRxnQVIubv2tim9avpjm0AXObTf/f3iwDuBWijHOxuubw6yhZOngMACl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787550247; c=relaxed/simple;
	bh=yhu8ZNPsil3TZAdxeJ1obBEGvKGg5WGvYLcUNAK60Eg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=H7W1v0aJnJNX9jdEt2LsKCPzAa/jwcUri6saRXAVh9h5dhnOBXf5XB3oAydhS7XvV7uNRMPYXYItNuxtIkzE467xZ6tUFxQmCO3P9z/b7KOvK+qm4TEl7s0iEjD8ynjZ9sMYs5OcN/pUmDoXxxhG/B4j7dL/lKdx/GsEdiqN06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RsqZE6zZ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RsqZE6zZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787550232; x=1788155032; i=markus.elfring@web.de;
	bh=yhu8ZNPsil3TZAdxeJ1obBEGvKGg5WGvYLcUNAK60Eg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RsqZE6zZiQ36YSOr5/6msdKrsRclzLdzbQNUM9Ba15OShM9QfWjATC2ykgAl8ehV
	 CvdKhrx0MRsbRZ9fyOq8fqajUwdh42a9gWCNvaA549ANmDctTChbKZcCmMwtlBAdQ
	 HYvUnTuydSj5OR9UJ7LCR4lqE3ohatpyihDI3T/zE4JD0cslpMRUzFMdXgrz5uoyF
	 9F+LlXe3nU+JABg9X75swuB4cWzWTX7nHLAsJb1GovrZx9KjchzEQIJmlJWsxEMCB
	 XxmKWhyM16FvJTCuwizS/ZpVOYnZ2wG7p8nHLvypaQlE9MCBBIe7OFiea0V54GViT
	 h1qeLmLy+9pcrZhqjw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MMGyK-1xGSac0xHy-00NYF6; Mon, 24
 Aug 2026 07:43:52 +0200
Message-ID: <caa6ad68-9f9a-45b0-81ce-cdbeceb8d454@web.de>
Date: Mon, 24 Aug 2026 07:43:36 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Manush Prajwal <manushprajwal555@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>
References: <20260823112321.2039-1-manushprajwal555@gmail.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: fix runtime PM usage counter leak in
 cmdq_mbox_flush
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260823112321.2039-1-manushprajwal555@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kkCJuvXbxsKqBP+qpyJUlh76+xw/Y2HjHlEYf9pXuvebnRLT8Sw
 mcgSSa7imIsZjhBZE8ZXS5meRZHjqaTUsIfPgI8yXA6YguTmzMKShNHtQZ7w81yV0o9sB47
 0hcAPE4Atf+ubS8aYryUcoBifCa+3K4UWRxJbq2hn9pm8iIoFzcYm0OKM36wfEYhBnFzKHC
 gr0azYiIZOPZfa/A0kJkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CPV262Z8SVU=;s8mU28Jwzchzf+EXxHO8pjwqPyF
 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
 ydJo0GPg7fIXU3Hv4915NJC6xyAM/zGd

=E2=80=A6
> Fix it by calling pm_runtime_put_noidle() before returning, matching
> the pattern used by other pm_runtime_get_sync() callers in the same
> subsystem (e.g. =E2=80=A6).

How do you think about to use the function =E2=80=9Cpm_runtime_resume_and_=
get=E2=80=9D instead?
https://elixir.bootlin.com/linux/v7.2/source/include/linux/pm_runtime.h#L5=
30-L540

https://elixir.bootlin.com/linux/v7.2/source/drivers/mailbox/mtk-cmdq-mail=
box.c#L557-L611

Regards,
Markus
