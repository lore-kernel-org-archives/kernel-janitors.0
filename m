Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2845327144B;
	Thu, 21 May 2026 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779381213; cv=none; b=Rl1zRJHAsqtOF/DfPW3YgQ1gEplF4UTfktV0nmXC5ei2xNzcv69sPoJc8jlwuA8+xTFT6KopCYy+s7TFvKwUxyEVYa+QFSwzhP3ow9D/i61nSOV5gS/EBZ3HgIbfGgZc2pvqr2ie1CsHCecjnrRhF8rummi965h3S8/xRBQBocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779381213; c=relaxed/simple;
	bh=NMqvX0XzGNzABtxfF6My97YobrBkluVTxdK2KsDCGCc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mziLKnHPF3vXnLS4WG6ZaYqoJAUlrGFHgO8HmnJr1K4uhI8wtbeKxKuXeo8QSFGLmk7xLJTmWBOaYeBJxxYyRh1TIMghKvI8NkOTNqEHAaK+S2Dxx1nghpzJmnduyiD/X7FhgW0Dd/dz9KQL/hkpr8szH/EnWAXJWomy+VqFn6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=PNA4zEuF; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="PNA4zEuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779381203; x=1779986003; i=markus.elfring@web.de;
	bh=NMqvX0XzGNzABtxfF6My97YobrBkluVTxdK2KsDCGCc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PNA4zEuFzZZT5Uh/81UOwWXi+z0md0Cn2CHtuoQvNWJ/7M1NEFj3f5D150XB4iWF
	 DugOLSjS6JpjGDYXxZqgd7UiA6KuM76upaQSLN0Z5Q6pPanNlngdFvfg3/gBabMAT
	 n7mEfUUuvK9IsY7+b6DhZrut5OkHaRHNPktKLLTHi/Trp7rAXhTgSjJ6CXgtlR1t3
	 hb2djWHYrejmT2VwjJiyJqEAnDVXth6seOi7LIUj5lM1SHCPtl68qgQ8td/+QyhEC
	 BAkBmZ8/17roRTks1mYnaLKtOoXMcA/1z2Jv2e32YkHBxDF1X/NAJ+X595s6Lklzz
	 1Ms3Iapnj1J4DrFTmA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGWc-1wYJXt1eEc-005KON; Thu, 21
 May 2026 18:33:23 +0200
Message-ID: <2bc78c8a-191f-4657-9ed9-a271c86a4b92@web.de>
Date: Thu, 21 May 2026 18:33:21 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dinh Nguyen <dinguyen@kernel.org>, kernel-janitors@vger.kernel.org,
 Tze Yee Ng <tze.yee.ng@altera.com>
Cc: stable@kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260521031415.3247663-1-dinguyen@kernel.org>
Subject: Re: [PATCH] firmware: stratix10-rsu: Fix NULL deref on rsu_send_msg()
 timeout in probe
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260521031415.3247663-1-dinguyen@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/ae7lDBbnfMYPpkMAUZPMjAdEtmir9yAsACrFfiIz4obC6iveTh
 tzMWGSA0BZTHXe6GpdlsJTSRT7Z7e30uHrplKBhgYEQXdBOQnVVwPk8rfwxLHAf474odLxo
 6e8DTh4+yvR6nCJNsVn5cGb8CYQ4XMuUJskSXTuctraZSWfMnp2faGKn6Oy6+XA3xA9zvvD
 ORAciPdPVzfk4CxUSLH9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a+UHtghOp/s=;kMSXLlbXw8Xanyai4hs1UfdiRpa
 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

=E2=80=A6
> Apply the same cleanup pattern to the remaining failure paths: remove th=
e
> async client, free the channel, and return early so no further messages =
are
> queued on a channel whose scl has been cleared.
=E2=80=A6

How do you think about to avoid a bit of duplicate source code
in the implementation of the function =E2=80=9Cstratix10_rsu_probe=E2=80=
=9D?
https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/firmware/stratix1=
0-rsu.c#L715-L807

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.1-rc4#n526

Regards,
Markus
