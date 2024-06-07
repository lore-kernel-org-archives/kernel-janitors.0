Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04145199E89
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717771843; cv=none; b=IH9f+dZYbjNne6TPwN5A8mH4iyFLHnTovyjze2neSaaVmfZvIH4MQfU9X/HQKsnDm0Lb0AQ14THbCWwjSYZEGEHURZ+0TXfTlRCdTQwXJypvlP2TTOrLYzV4KWo4zlTxpsUpcOK2EBuZEbku/aU9QiTKviGcJbg6qJY42R0b3FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717771843; c=relaxed/simple;
	bh=bw48hkCXuzijbQuhV2rjxZ95PXUwMCrQtNy5mmsSCDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SjoSGVp+24SZmmg2M+0t8E7m9bqFOixsc5u63bifHvGVsqtui3yiH9a7QjKNJrE47FsYoR550I2ZOLDbVgxssSh9dLwy2upgPr9JyVwEjWucO89hZcQpk7hs1RykPbPxchHy7OC6t9siZFev/weDfTmoukMCP61hj5RyMVrz9X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YhAnR+87; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YhAnR+87"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1717771831; x=1718376631; i=markus.elfring@web.de;
	bh=V7r6gaZSRszhdI50Z8LDoyoHE+dr+ClzBMFz+UKK0iQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YhAnR+87KAuiGMGm620ZkZ45GiTsRd3I8m8jndPKwZWSCyYGDNw6C3zJmn5BAUyW
	 QgzeRI4YnRa6zX5oWU5nVuZ2WhEOLR4XWN9uccQZdjGlgzQnsf8MVpbezaUs5sPZ2
	 XYt7uTk+TkKwUweZTNX0HHevYU1axBe2zcSm/qHfBZsKWx0eHBMdTsxahDtyimOsn
	 GD/9zBMLFuUazhUG7h2r39LjxhYTBY0cNbg/edMvMS5IWVK3DtRH6f/i/FHupj9IQ
	 7SDKqaEpYnIAeKTS+0FnjCxXNPHqWByIn2C5m7nuU6O30fqn3LbABok87/A5Ddlah
	 JIODMtnlb0OrNvlfEA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWzD3-1rvbDi0hz7-00MbP6; Fri, 07
 Jun 2024 16:50:31 +0200
Message-ID: <426a5742-6180-4dea-8aca-58794dc299f5@web.de>
Date: Fri, 7 Jun 2024 16:50:18 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Increasing usage of spinlock guards (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr,
 kernel-janitors@vger.kernel.org
References: <7eb9626c-da7b-414d-bf50-da1eed27be31@web.de>
 <alpine.DEB.2.22.394.2405261847380.16852@hadrien>
 <9d79a2de-10fa-479c-b720-1c4a2f51782d@web.de>
 <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4bad748-afee-713a-a2d7-30b6e5c1cb28@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OkCI0vGgf/1Arh8QyYpVw/3XmTEpoL8TxKU8aV81XNQJorxymFS
 11Dugi7mL3zOX8b14jxAQmgqCjOkCKUrfyByxsM8NJCvImyB5kX+sykH372RaRsxIMPlnu/
 ZuqrPEEhdZ20oZ9frU7eWMz+qmkosO+MqqEiSGB+hpc7ewEqLLkkg94GYvA6aeMjz9l4Atl
 sW/4v3RZGEBPMp++zKkDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y6SQlXsOfsM=;zJdsZx/xyEDrtXjs7ATmCkJFTe9
 Fibe+MxjHQ1Ak19HgsTThpT2qeEa7zGQfaKg/to11uQfluv71CWVPg6jyyZurSZSMCpIGABFr
 gHB7g6XWRM/80IFIBTtaUQHCHwlvOPKxAVvQzkLMkpCCqmJEnjSQghtg2i457j1/1O4lCT8lF
 1QqKg0T2DznxQybGuHTXiBda6uFEq4R7CPvpATJi99AVDb3UQfv6EWvYZASFtvY7Irv3212wc
 k+BVS4W8zqEWNa6lRSKrrKv+Jc5naVxSzCGyzvKs1oxTCpGg8d0vNFs2CW7cD5w6kls1eZ8zC
 R2d5x5AjtEqmsERL4mR3wPebz77Nza8MUjhuuiTSrG6tAKImCw+vu9OFQbWhzs5yiBscFU3j6
 iRh3s8swDlUugkoCty5BkWmRAQMP8zgifEqNE0aT84VD1OBgxVAOxnNNTfXhfVVsV33yorOnl
 U1X3gOwW10FPUZrHfsb6damsgt1JwxojhDqj4VctyJqEFMoaGeo1AJa17HdvpgBvF9wxuwaYP
 FVR+JlbBeaW0VgEe/1LC4K8GqIJI1bWF/XiKjQ9elihpcCtyQlvIS8AFZwjzFZu/4EDlQdTW5
 iW/Q358JWtTOvmYMY4Fp0gYDe3vJbSdC9zQFSv9xy2JQXP70nJMBg3Dvqm6gCjVp9aSjUA1YW
 Wbrik+hcQnCp7gq55EerlQrVdLdRKtAl5/TBsZFT2t6FY3V8oX5D2z1+r2iuRyOFzEjlfVHjU
 UZWwKFW1e7JTpZmmIHRUlv/SSAMGSJMSGgGsrlZB5m8KqBejS9lPMd62UWunpzb5SRhWrXDz6
 L2vRIW1uH2oQ9fXtUGw7OwZxDcUQLiLlYZeMbsrh1nIhg=

>> @replacement@
>> expression e;
>> @@
>> -raw_spin_lock
>> +guard(raw_spinlock_irq)
>>               (&e);
>>  ... when !=3D e
>>      when any
>> -raw_spin_unlock(&e);
>
> What exactly is the problem?

There are several development challenges remaining to make the application=
 of similar
SmPL script variants really safe.
https://elixir.bootlin.com/linux/v6.10-rc2/source/include/linux/spinlock.h=
#L537

The discussed guards combine two actions.
The shown transformation pattern depends on the deletion of the first acti=
on identifier.
This identifier should also be usable to determine a corresponding guard p=
arameter
and the companion action.

Action pairs can eventually be stored in special data structures
so that a mapping can be automatically performed (on demand).

See also:
Working with variables for case match identification by SmPL disjunctions
2019-02-19
https://github.com/coccinelle/coccinelle/issues/159


Regards,
Markus
