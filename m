Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B16D1D4606;
	Sun, 30 Aug 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079572; cv=none; b=X8js4Ogyh4b+ycrxlREuNpNxIR/qd3QIEvulCExl8shfJtiIngigcOmjhEDtrHFapw8V01nAs2WEEzTqipH4A6vYxh5l1GIZf5z2qJnlB5MKjtKXo2rOL+7iNnKWOlInxKGlsaInEfOMBW1C0IIseof+WLTBVOoQx+0ci9pvZW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079572; c=relaxed/simple;
	bh=CCGnsUVApThmOuCpySccaYj8+6bENnhGbQv+TAvFSz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=kTnrRG5EOlSz+fYT1yPMcMNqaH6eN3SqTxbDLgJMXeIzCr9LgYqnjel6fxzYtGNpx8vj4TjUhMecvtrURtfoevg7SY1WGPICyn4PvhFqjBaSeXlTSUopJEbLeNl3Zo/keeMX2cCERS2WLPld+KBgJObTapA7Xjv6cobs7YWJEIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JZjsHR2g; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JZjsHR2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788079562; x=1788684362; i=markus.elfring@web.de;
	bh=sxaH6REMH28xHK3pNmxk0EOuQJIGCshNf7WVOvhcqx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JZjsHR2gDD8ohkv5TxxVeviVKnzAQJvLfc70Smfl52Vyrp9Mfjo/Ey6I1l0RurWV
	 rlx4UkMbTPDrwlKRKz9LrdDirB8uj5/pwjKL+mURX7lociVQfGUApcPdpUbZyU6Ha
	 B2wm75z174Zccyl+DBLmZG5lvPeYeqK9T3ydE5hQWG1UB3eIYrKqJgnbI9QDStLd3
	 X7T9g6aW7fA+rHpnBPaLDy1GTWlGmLWoAg06UnnxQouVIzTPkcHvSVZ5QDRH9ZaHM
	 X9279Bcy9bPCNtgICY3sEJ58nbbm+xb4ZhiFGN6IfXC8G2vXaRpiNVrYjmANOznz+
	 r9T9Dwn5tnhyBBK2ZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjBRZ-1wNhSZ3EEH-00gAgG; Sun, 30
 Aug 2026 10:46:02 +0200
Message-ID: <30b81b65-77cf-4a3f-b384-e622954564a3@web.de>
Date: Sun, 30 Aug 2026 10:45:59 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Improved handling of member access operators with SmPL
 expression variables
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
References: <fc7bba15-5116-4467-bce1-be8ff3859184@web.de>
 <a7ce1c69-a6d9-e535-2bff-d16627ecfdee@inria.fr>
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a7ce1c69-a6d9-e535-2bff-d16627ecfdee@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eewkCCiaNInTX5Yhy09QLZ59AxIe1McwdJzm5YRi3zWo9EB6cey
 UQOsQ5HapTP5+1EcRkIu/1tJMbgdZxEq3SUL+K5pPQQWihYct0MFVwRQbzhYWE2s40Qi+Zi
 KPYaPiIBitNpP5e62aoHDrjWeQ2nKj+bkiq7oQ22AptuDqz3/XS1laNPutug0AYf6cRXGw7
 ZACZ3f2dqn1n2z2zhPLIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oWM2AgTckmg=;Ldy1g6Nr/9vlGzqaVxM1LzPUNwx
 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

>> Another SmPL script example:
>> @my_test@
>> expression hint;
>> @@
>> *hint->hint
>>
>>
>> Questionable test result (also according to the software combination =
=E2=80=9CCoccinelle 1.3.2=E2=80=9D):
>> Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/Probe> spatch --pars=
e-cocci show_expression_for_same_member_name.cocci
>> =E2=80=A6
>> minus: parse error:
>>   File "show_expression_for_same_member_name.cocci", line 4, column 7, =
charpos =3D 37
>>   around =3D 'hint',
>>   whole content =3D *hint->hint
>>
>>
>> How will development interests evolve to improve affected software comp=
onents?
>> https://en.cppreference.com/c/language/operator_member_access#Member_ac=
cess
>=20
> They will not improve.  Proposed changes will be NACKed.  Please stop
> asking for this.  It is not in the spirit of the language.
I hope that I can convince contributors for further development possibilit=
ies.

Regards,
Markus

