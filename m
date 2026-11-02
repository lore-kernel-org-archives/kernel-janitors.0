Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612056;
	b=kegPwl5HLx+MrbnvkPz2b6sz/QrXG+3AZfeGe1E37qDrw+Qle/NXwu7h5uUap+/GO3CR
	 2eW/j/CWYnpzkTT79ZKHwLC75aD2wEQp4VfKpx9G1go5UKv+cbFogfEPlCXJ6ed0BiAPx
	 suTtnb8GdT1JYxejqBHFQKmQMggM0tq/IfnqA/OCEWTLshcSb5CCT3PbpybeHrj9YX1g3
	 133jL8Nrm+rffi8VG2UxKCIqRycoPq0brEdtDnv6gdjkfpTaFRAaicsR8H7yb9gqT+T+Z
	 iEogjM1/NmgKyBHdUQEAv8DbRV62NhIK29tKNmizjsZW8iSg8RPDPWNWKqqHBhKHUGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612056;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ns1CwBUJxze9256gcbwyclT1GC4r57u33UNeieRrAs4=;
	b=nDpRp8/VJtOl3c1b5tRqVI1xHa7h6baIR8eDsPiEe7In1n8jsq3QV8YVYMeE2poqNMeH
	 6fIEufgapxfaAmuNuawK6RTuPoIRDRcCPUm5ZspdPjTtM6vNUsg404zCwTve3GkppWGC3
	 APNCDZtFJSWziVIriY60k7vcZlDMvWpyjlhMmnSwuzFevJUFMHc8YqkWg6LKRtBSIFBkt
	 rJLixnQcjFUFy1DStXQuJMPbLXP6QZmQj4HuYhHJrBxKpu/n2rgQzPNVNLjDwnha0z+jv
	 LFCoBBZ9PZ9j7ek3GxSUVbjmH28chq1g8+O3cJJcKEO4ivDykxnhGKpQMwen4sznUKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VrL+BxmJ;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D42606A324;
	Mon,  2 Nov 2026 09:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D42606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=VrL+BxmJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793612052; x=1794216852; i=markus.elfring@web.de;
	bh=ns1CwBUJxze9256gcbwyclT1GC4r57u33UNeieRrAs4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VrL+BxmJ6nt9iPOXpYErOQr9BBrIZZZ8WLQguLUvV3y9AoBIEr0VTGodFO1iwDdE
	 wd08/Y2lOkIETGykGX453/JTGo69wmjKLZW+PEa708i1oBDA6TmOIDIEF0www/din
	 +8iZPbQsFkKo3X/7nP6F3ICubr2t+T4AbCo1fmp/vSEmTOJqouMrDEh4DFItJB137
	 vteugKldZUFJXU7UeNWhOXZ8382myZKwX/c0juBz7JKcYXcs8jAnZ4pe0aPpjiPkl
	 JL1BvniUdPF14fQ/OTsg5UKBCtgP3U65wUHbNOq0CtGiyIjdwKW/RmIjKyH/OvKWc
	 wp0ZyOgMf+VmLOAwaQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Melf5-1wq8Ag3y6v-00pYmJ; Mon, 02
 Nov 2026 10:34:12 +0100
Message-ID: <7a14fdbc-fefe-4c7e-8b57-3c42b5d1a453@web.de>
Date: Mon, 2 Nov 2026 10:34:02 +0100
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
Subject: Re: [RFC] Distributed data processing for SmPL scripts
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr, tools@kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
 <b55ad049-86e0-f737-a96a-f3151db5012@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <b55ad049-86e0-f737-a96a-f3151db5012@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QWbbZ5y+Q0skZNLqWL1P+CN2/LAG52/P/lCgURyNxWbgfJoqkKi
 X/RdhdOOWQdjthUQCh17gqF191hm+/HQo3PrT1JT6UQHpzJ53UtNYWlgYQuNCgDFhiR/km5
 Z9fD9DVPwWoxbzYhR4HpqT5Gw1RIIXg1JWLOb6PwaGPXCvz9bpBW26T9rNCbN3TlpbQsB/F
 FNcZwFX9a2PEs8cpBWapA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hBeRhHUrv3A=;f1btxB4m5cVqyQjTOFT9Rcitv85
 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

>> Some developers got used to tools which support distributed data proces=
sing
>> for compilation tasks.
>>
>> Examples:
>> https://www.distcc.org/
>> https://github.com/icecc/icecream
>=20
> Maybe such things can just be used off the shelf, since Coccinelle can b=
e
> invoked from make.

Did you notice how such development tools were implemented?

How would you distinguish single programs from a service-oriented architec=
ture?


> In any case, I have no intention of working on this.

Under which circumstances would you become more interested in related topi=
cs?

How many components can eventually be extracted from the OCaml (and Rust)
implementation for better reuse with other programming languages?


>                                                       If you want to
> contribute something, please go ahead.

I would appreciate additional development resources also for advanced
source code analyses and transformations.

Regards,
Markus
