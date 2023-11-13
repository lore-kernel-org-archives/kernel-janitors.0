Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C72374C
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="F49on6hT"
Received: from smtp.smtpout.orange.fr (smtp-19.smtpout.orange.fr [80.12.242.19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B869BD56
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 11:13:34 -0800 (PST)
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 2cNFrerPZFh5i2cNGrKNZe; Mon, 13 Nov 2023 20:13:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699902812;
	bh=Qx9Wb3JjxD7eiWcTxsr6jlKCe3W7yE4hCauoq96xdrU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=F49on6hTzOlvqIjR4AMu8V0x13LboRAuPpKOKOO1NDGcdBdrzRp3iv5VhcYj3Lf8a
	 pHrLz8ryK/dbKnNjKsXM+xbBagEHwg++pLJjYTJ5Oa+pPHZm26dg7ZwIKFzPse7GJS
	 kFE4eggrD/vchwkTU3mVdw9ZQkMOxvoX0GDDbtfYHfklFp4MMLSZJ8kDRPrdKzdG9Z
	 SNJF+uN/kschGw9V66fsPEJxZZWfBcovvrAUMhvowIROT265CZ+lx5M8YR+91sigYx
	 HgvV5HOJ1ETmmOjAtR8DxDHb9zf7Xi/Yeio63+diLQtsj3U0I0IOepFz8NtMDDUPOv
	 9UOfUEGNu5ZwA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 13 Nov 2023 20:13:32 +0100
X-ME-IP: 86.243.2.178
Message-ID: <317750f1-c5df-4c2b-9211-b4199f88d248@wanadoo.fr>
Date: Mon, 13 Nov 2023 20:13:29 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: kirin: Use devm_kasprintf()
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>
References: <085fc5ac70fc8d73d5da197967e76d18f2ab5208.1699774592.git.christophe.jaillet@wanadoo.fr>
 <20231113095557.GA1583963@rocinante>
Content-Language: fr, en-US
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231113095557.GA1583963@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 13/11/2023 à 10:55, Krzysztof Wilczyński a écrit :
> Hello!
> 
> [...]
>> @@ -387,9 +386,8 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
>>   		if (pcie->gpio_id_clkreq[i] < 0)
>>   			return pcie->gpio_id_clkreq[i];
>>   
>> -		sprintf(name, "pcie_clkreq_%d", i);
>> -		pcie->clkreq_names[i] = devm_kstrdup_const(dev, name,
>> -							    GFP_KERNEL);
>> +		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>> +						       "pcie_clkreq_%d", i);
> 
> I think, the kirin_pcie_parse_port(), which is just below form this
> function, might benefit from the same type of a nice change.  Thoughts?
> 
> 	Krzysztof
> 

Argh, yes, I've not seen it.

I'll send a v2 with both.
Thx for seeing it.

CJ
