Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA1447819
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917373; cv=none; b=cE/aJjCK5H65Ihn/YbUtUQWzI7LVBdn2wdvd4Cke2cOEjsUxRMLLNgyyF/+dNmurSZ6Y9fnJ549TjlYa3OyyPh0jOEhWBMDLU64X8rsmqNNOsJdtY4DxDsc5aHDwAZ7fkwdJTWX8Rby5jNQ1Cgl82KUgXYsPO5SX+aKDOn4ibFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917373; c=relaxed/simple;
	bh=OdKKMm3Yz5jgeIXt27pNekmmJRk2cA8YKFQTXht5A0g=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=V/ozvRGTCqIEti2mMBYSClzRqIaVchSt1kb04z3/ih3mgXedWQRADWEUJvb6V/S6hsIayTtMXrGz0KGzAfiQyFVFp88PSh0hIJynXuy/q35uUfhz/49PMCYoXgVNC9IaucWB9PpZwByg/nKb8SugO9VUqoFj/GOkBE/wQp4Crss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lgG4ND7B; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lgG4ND7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787917364; x=1788522164; i=markus.elfring@web.de;
	bh=0uRhO5qYms3ADnFCm1UZ8ANHc4jjoXKfyrP3TyrSUwk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lgG4ND7BLN+8bFDy5Zb2+UwrlAnhqSc6plPZk7aj5YnH8+tpyOQOfklZsOwX2KmC
	 yh5ItGUV6pUgD7IPYQnxjgamM6EPY55aepiomiCjYBMq8PlAeyWAEg6fjQvQHqXFm
	 Jy6jqTeYuZONsRWWaxoytNc4CfiNQK16p5qbjhlNeEx7+Es0mqjiTHKwtY894W+Za
	 maqx1NjUCegwz2cMln6992Z/Sk/3f3tD4fbcGcdYpob0oRyqFZ8emD5jcsKx10TeO
	 ypZj0bZXjFUvxsnAH2/yPz16LpSguwMIluHPN/Gynw7uwUA/kUK7qSiHlaiYSDqp9
	 1Ky5I6+sCJUfXQQhHQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MI3p7-1x5djP3IbH-000QVB; Fri, 28
 Aug 2026 13:42:44 +0200
Message-ID: <03b6c464-5533-44e9-9514-99cb012a27ba@web.de>
Date: Fri, 28 Aug 2026 13:42:43 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Improving support for first columns of SmPL patches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:anys+wT3XUXcQBWfiRQx8DOipi4siaBDoVXeqGRpg+Bo+nkjmhk
 rO93s/Sl0J05Rk0f7CkAoTNfKzdOj10tj1QHVoGTiYV6kAKmB8Im2TCi+2L7tsUYUcO2xFn
 8sEDFwirwwBZ5gBK2rQ0sAJjW+7zBxa8d6M0DZLlx9J2Vx38v5HWcbO0fmAtdcOKscsu3Rf
 Bw5I1jGqhZXpe1q4Qu9RA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fWDkVASCX/s=;rrVqkp7Okt7u3SGRAl/1Fj/QGzW
 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

Hello,

Another SmPL script can occasionally be tried out.

// See also:
// https://elixir.bootlin.com/linux/v7.2/source/include/net/ip.h#L305-L308
@replacement@
expression cpu, mib, offt;
@@
-* ( ( ( unsigned long * ) per_cpu_ptr ( mib , cpu ) ) + offt )
+snmp_get_cpu_field(mib, cpu, offt)


Questionable test result (also according to the software combination =E2=
=80=9CCoccinelle 1.3.2=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/janitor> spatch --parse=
-cocci use_snmp_get_cpu_field.cocci
=E2=80=A6
lexical error: * not allowed in the first column for a patch
  File "use_snmp_get_cpu_field.cocci", line 6, column 1, charpos =3D 133
  around =3D '*',
  whole content =3D -* ( ( ( unsigned long * ) per_cpu_ptr ( mib , cpu ) )=
 + offt )


Would you like to improve any software components accordingly?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/78ac4072c68190fc929f2=
e3c7534350a5ef6496a/parsing_cocci/lexer_cocci.mll#L133-149

Regards,
Markus
