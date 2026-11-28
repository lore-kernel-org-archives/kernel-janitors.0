Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795870119;
	b=vaT8PQ3vWFyphdtCFFm27+eH+vjjyQyrtnjZYYptjJ7fDV5c9swnIqccu/Eo1whGAkyP
	 jXYUNedTi3hdaWZZcq0cECJeJgF5eHOs3Bahz3JopbZBJiThD9rEzxoYF/0IRwPmuMfPk
	 0PatWbed4Yvs67IrxuFU8U0l3BtDRSfpWWcUAq3pmMcO4lSwcA74YG8jzAv2GPSxkRxjz
	 IjqtMwLPc93BS+BGahWLn3O9dLd86F8zogu4gSW3YSVIsesXMUFsMdW9JgZ9zdLxMyIxU
	 fBAwDVorPM+zIlYVfG+LY/OaTqH1bkY8gplmu9e9svI4VXlgLE8nXZiwHWqGoHZ3tOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795870119;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Subject:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=+yVTp7PIOgwv8sDMUFezhQ4qFltSlnuARHPkogeLbfM=;
	b=CbRMotE7tS4vScEbKKbe+uZYfInmxBvkRRYn6ZnwqSbuUxGTk8wx5t27asEBQ/o22VvS
	 NUTjsnEC5bEGvNi5DQVjwI5ZfV29AiNjLJ6EAYYF+fWeyCXzwC9xdDmw5IOpS0kphkfAL
	 FfcnB15mAnXQXHiHL1VPjvDdmRdw6q47oeHA9ciaGPDryXL4lGZP0+LwTIFPsCWldLbtS
	 T3J5k+pdkKmAlt23e4P+aNU+yGrl9NbsejR1i8UpjLhqXkSQSKcdyN2hcyxWQHMT1EVzW
	 XTPFXjiQTRGpjMAii5IVTcBuqUWt4o7vNvcG21oPV77zBFJt48+hvTZ/BbFJqBAcuXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=kKH3UZIO;
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB65606A31C
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Nov 2026 12:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB65606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=kKH3UZIO
DKIM2-Signature:  i=1; m=1; t=1795870116;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:aCXohDcP5I5ySPmfkGZwtcaxoizZ
   1ywIDaRKJUhn5QJS7J9YHEwGiE2qgApXMknOkqWNUw2C00C2TeuWpNEBmB72WB2RaAZ20BGYZ69
   AxA/v6bSl9MCTzSAsLO8FVY5udbzbOQaj90OTorlV1Kt+xZiRVVd/J0n57RsSa8niW0m1egYvqd
   7ks+mvcxfIn3qMcLHO+ijDQjuHad99ELS94wl+tnbawE5reVjI4eL2d+TgvUtGTvrzO/OfcdUYX
   V/qgJ+TlH0uBfBcpc4NNjcsvGI6khi3ZApi2dYL0V+HyWWtltrljFyZ8BoxyfufOIg40+MMeN0D
   RmPp2Gcnf/NydA==;
Message-Instance:  m=1;
 h=sha256:
   +WdBp/Jpp0rsAOtS01Up6DLUCVlvkFczqzVk2Cl0OjY=:
   +yVTp7PIOgwv8sDMUFezhQ4qFltSlnuARHPkogeLbfM=,
  sha512:
   bfbGO9Wgap+dbipPaxaYn1p/hBlE16uGMiNYEVcIeMtGZSN0ORkrQ6g6bN2IYQlvFyH8zgTrqxQOyux5s7DB+A==:
   TEW20fDUQAULiT2zrkMMzQE46KyI8PK2rwQGheWax0bQaDReVZEC0fFiIuiy6n7ZvpJvz9yO5bjsKblvPQIqqg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795870090; x=1796474890; i=markus.elfring@web.de;
	bh=+yVTp7PIOgwv8sDMUFezhQ4qFltSlnuARHPkogeLbfM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kKH3UZIOONWghfLG2pLLObzFTYAYqXZ1xJcmemid7ET8HFcnL/HsfiUt5lZO1xPO
	 2yTxzDSjBsFJLHpnardN1+15jXtbZ5YCQjriLgZ0vabpWbDB6L5EBJU51/r+jfxDr
	 ar2ZPEPywfrJk4CMeQMExxyJEUXwex9uPF4oupCrRkN+FYxWi81oqXlDvx6GTaLBJ
	 M3zVfUgmz+d3/q9Ox5JsQtYOXgpbJ8MX5tBxtwh/Vo3yik44XGrwTJXOdp+KhpVJF
	 kKOtB+WOEVsyl+XABE4omVhst239JkJrHM7J7XG520Lpl2ku5BHBaJbg6XJ2LS1fU
	 apJeyq0T26NrebwWTA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MS17v-1xvAWo3IPj-00SQCV; Sat, 28
 Nov 2026 13:48:09 +0100
Message-ID: <535add0f-1c79-4b88-ac03-115115f22e2f@web.de>
Date: Sat, 28 Nov 2026 13:48:06 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabio Estevam <festevam@gmail.com>, mfd@lists.linux.dev,
 imx@lists.linux.dev, Lee Jones <lee@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andy@kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Frank Li <Frank.Li@nxp.com>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
References: <20261127180709.315826-2-festevam@gmail.com>
Subject: Re: [PATCH v6 2/2] mfd: mxs-lradc: Convert to devm_clk_get_enabled()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20261127180709.315826-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bwtNmz8Uj2iqdZXGTxp2vMKdVBaaeKur2/uzSmerD9wg67O5Y0I
 i9sAEPyD3AjAB8pbOT24moqKg72lpgxNoht148rFnC9QEDAnYF6Ly2RlvjkW9OGZY+2V9aq
 IYtOcfWzz/OX+dttsMOexEYrUFDJbHBE8RfFPVxPcBT5jQyNz4h0dlhEXRD8o+o4QKGqZmh
 QDgIj8cstXqImgkYFjnRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FbvURh1KJ1g=;ZPb6Lg6rdXxggeMmZNVFbNJehHx
 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
 8512kBXJHfGZXZar

> The LRADC clock is acquired with a managed helper but enabled and
> disabled manually.
>=20
> Acquire the LRADC clock with devm_clk_get_enabled() instead of a bare
> devm_clk_get() followed by a manual clk_prepare_enable(), so it is
> prepared/enabled for the device lifetime and released on unbind.
>=20
> This conversion makes the code simpler.

Is it still required to store the clock object within the data structure?
https://elixir.bootlin.com/linux/v7.4-rc2/source/include/linux/mfd/mxs-lra=
dc.h#L150-L164

Would a local variable become sufficient after the proposed source code tr=
ansformation?
https://elixir.bootlin.com/linux/v7.4-rc2/source/drivers/mfd/mxs-lradc.c#L=
126-L231

Regards,
Markus
