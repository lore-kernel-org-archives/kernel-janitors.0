Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091A17C9
	for <kernel-janitors@vger.kernel.org>; Thu, 15 Aug 2024 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723686393; cv=none; b=epJb5yaDfvzuJyu6Qzrv4Uf4c1POl9s8e1CVyWza2O7qkfbbEZSiLz7zqoTpiE2NV2NfkiOL7qS+vcZmVwtdiRlhvT8bWzuHedMax8EG3U2h7UJK52TqquH1AXqqrTY4JYOxNCvAhHvJ199y7R/OCxPwmSRJEzFalAuLHOp2VMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723686393; c=relaxed/simple;
	bh=JfNXTbN2vFBA4WbPegiGnNE5kdJG80WG624ogmB90wc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OaZVz7x6qZLKsjpymOQrpwg1zipO0OicJhX2vRc2SBoyyLnbMXIlOzGCk04meeqcrrimx19CBrs/X6JlwgJtKjQJG4if/dSIT4ived9F5ELX6mENZr/I4sgLoYIzS1rchLqrmKeOZpbPX/Ugzpj7R7rMA5od1jQTukkswzxUsNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=UDe3cKc5; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="UDe3cKc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723686388;
	bh=JfNXTbN2vFBA4WbPegiGnNE5kdJG80WG624ogmB90wc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UDe3cKc5KJJlKqWSL/NjS+MuyiwRB50kZTn99b6pgB9GiKGfTOYSdgq40fcnSx+MB
	 gQKGD3yLhs7l+zaQ9NSwmhnv8RGFhkdLePbeZ2Bid5zf8z516saYNcDhFkOZh12zWi
	 hEKneNyMapJOLfJryKLQ6H1mQ3ZQpzPfW6q4IXx/ESss4Du2MGAbC8VDxhYKC4WO5C
	 NthkcgmYGzZK8vmmViXCPrOsE5QLJjlOoWSrkx/WV+OY5JKIsk74hPEFHcfJ2a/SAk
	 SJqZnQ9qZmXk8mI0v8En25hByAzPI1kHllHTOdHLKIRc8VcU5CZHHkWjHjnJdArKCT
	 56kgoCmlmnPcA==
Received: from [192.168.2.60] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 21EF664C85;
	Thu, 15 Aug 2024 09:46:28 +0800 (AWST)
Message-ID: <770014ad705a6d9fb4fb22149743ca09886b05be.camel@codeconstruct.com.au>
Subject: Re: [bug report] mctp: Add route input to socket tests
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org
Date: Thu, 15 Aug 2024 09:46:27 +0800
In-Reply-To: <f8de2605-e21c-44d4-af5a-2fd139830ae2@stanley.mountain>
References: <f8de2605-e21c-44d4-af5a-2fd139830ae2@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgRGFuLApUaGFua3MgZm9yIHRoZSByZXBvcnQuCgo+IENvbW1pdCA4ODkyYzA0OTA3NzkgKCJt
Y3RwOiBBZGQgcm91dGUgaW5wdXQgdG8gc29ja2V0IHRlc3RzIikgZnJvbQo+IE9jdCAzLCAyMDIx
IChsaW51eC1uZXh0KSwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggc3RhdGljCj4gY2hl
Y2tlciB3YXJuaW5nOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqBuZXQvbWN0cC90ZXN0L3JvdXRlLXRl
c3QuYzozNjkgbWN0cF90ZXN0X3JvdXRlX2lucHV0X3NrKCkKPiDCoMKgwqDCoMKgwqDCoMKgd2Fy
bjogJ3NrYicgd2FzIGFscmVhZHkgZnJlZWQuIChsaW5lIDM2NSkKClsuLi5dCgo+IMKgwqDCoCAz
NjMgCj4gwqDCoMKgIDM2NMKgwqDCoMKgwqDCoMKgwqAgaWYgKHBhcmFtcy0+ZGVsaXZlcikgewo+
IMKgwqDCoCAzNjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBLVU5JVF9FWFBFQ1Rf
RVEodGVzdCwgcmMsIDApOwo+IMKgwqDCoCAzNjYgCj4gwqDCoMKgIDM2N8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNrYjIgPSBza2JfcmVjdl9kYXRhZ3JhbShzb2NrLT5zaywgTVNH
X0RPTlRXQUlULCAmcmMpOwo+IMKgwqDCoCAzNjjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBLVU5JVF9FWFBFQ1RfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIHNrYjIpOwo+IC0tPiAzNjnC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBLVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2ti
LT5sZW4sIDEpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeXl5eXl5eXgo+
IEkgd29uZGVyIGlmIHRoaXMgd2FzIGludGVuZGVkIHRvIGJlIHNrYjItPmxlbj8KClllcCwgZXhh
Y3RseS4gR29vZCBjYXRjaC4KCkknbGwgZ2V0IGEgcGF0Y2ggc2VudCBzb29uLgoKQ2hlZXJzLAoK
CkplcmVteQo=

