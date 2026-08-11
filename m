Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52E9414A2F;
	Tue, 11 Aug 2026 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436146; cv=none; b=bzFwV79+Bh00QtU1uQO8Sask8mtk7igZCcKkbMAABZliKbqgep/XMfxWsJhVI2BhqWcPxlreEwkO+2M2SXTTEcsXhZ6/MK4uVwVNNiX3FNpQClQs8ZryAATDhmRMnaNSEqETSrjyJBJmVuRLqJe/5fz/rL/FCUiTStYnW+yA4/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436146; c=relaxed/simple;
	bh=bKyhpdiXE298JMbDv2r52FgxtNunsUdpD3BC28tvcQ8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=O/JaEJGAg03nbYOT5oBeTBIEDRNIKWnbSmlEap/t2qeoOO5MJ2+cGQXBtO7f0Rrz51CC/HBIl9OntJ8JvcKBXKowvKB7EPrK1rKPtj14V2P+osKJvKwbGMLzBkxa/voHqhtcNkknskVAsMbOXt9VfFdZ64IHi5SS56xXOd52PwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=FZW4Rkl4; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="FZW4Rkl4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786436134; x=1787040934; i=markus.elfring@web.de;
	bh=bKyhpdiXE298JMbDv2r52FgxtNunsUdpD3BC28tvcQ8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FZW4Rkl4HjR4I3ICTv+7xsHWvR2lY6txXn9/69KW3kl3GAKe02NRdXiqVtMaK2Ue
	 eEH/XZOaQJObwRM3AyjghHcXQtgkJ9z0+dSdk44LO0pJn4NbxaBs9ID6AxE/k47Pb
	 gbrH/EBjOWgYt9sefrknmcwiGFIAAlpweAzXhVRuJ8HvuGCwFYJvaGK8fq5KjOtYD
	 4ZMDmGHUuWP8gXx6QxoDri0+wSxQqFMtEIqbvPjntQW5NjpLP1FgAcb9ZnkqCUaW3
	 9rpk37mHsNp65//dpkL+6aSc+VSWrfUtNqF7O9nF52zO0XDch23uYsrnYlbXoe0wH
	 K3nxLf8nHYkmJTngtg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLzn1-1wcJNv1kdV-00PvFN; Tue, 11
 Aug 2026 10:15:34 +0200
Message-ID: <295006f6-067d-4d85-9604-c505db13cd5a@web.de>
Date: Tue, 11 Aug 2026 10:15:18 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Restricting SmPL disjunctions for identifier selections?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wisA5aY5Ht5FVxtaV8C2BP9/SIqrCWa3zdzmv6Q5vGnFW+AgWNW
 BkjLLGeDxHPs77weLIR/PbgsleGgn8B+4zUm05oYrssMquYNeDj25p9Grsx3irJwDBI6373
 0BBKteIcFTYhblKY1vq82z8SiWUggQ9X2qorIKQkREg3bnLTDwRdmp0u/VNIjShLaXXP5gs
 RRpxU+Tt2ljZ/CLDVEFJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YqhSBfeVNYw=;Dw00VW2U5Z0X7IZmEDUJVVetoyF
 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

Hello,

Another tiny script variant for the semantic patch language can eventually=
 help
to clarify special development ideas.


@my_test@
expression x;
@@
*x =3D
(kmalloc
|kstrdup
)(...)


Questionable test result (according to the software combination =E2=80=9CC=
occinelle 1.3.1=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/Probe> /usr/bin/spatch =
=2D-parse-cocci test-disjunction.cocci
init_defs_builtins: /usr/lib64/coccinelle/standard.h
@my_test@
expression x;
@@


(
*x *=3D kmalloc(...)
|
*x *=3D kstrdup(...)
)


Grep query
kstrdup || kmalloc



Would you get into the mood to discuss further data processing possibiliti=
es?

A)
The originally specified SmPL disjunction is expanded by the Coccinelle so=
ftware
so far.
It was indicated to perform a source code search for selected identifiers.
Would it be nicer to benefit any more from such a data restriction?

B)
The identifier selection was reversed for the construction of a grep comma=
nd.
Can filter ordering matter any more for efficient text searches?
https://en.wikipedia.org/wiki/Short-circuit_evaluation


Regards,
Markus
