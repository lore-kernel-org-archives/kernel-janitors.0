Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A4229D270;
	Sun, 30 Aug 2026 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788084616; cv=none; b=is/OCph2YdZx8faoBFEYh90vqvlP3u5ajTgQ/7GZbDdYAlvn0aXc2ro8oTd69nh+BTBAM3GqA4j2csXyTPVntqZZ/nCnXz20iAUilstdZ9L4zkljhVzuoper1oIVpPA78jHmWb+rdZ473Fo9xax7zJhbZpdxOUerM/SrVLxPjjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788084616; c=relaxed/simple;
	bh=oXfSgFjGifm5f3cWdPhnK4RMNDjAip0DJiWKEfyk7hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=M92Ptt13zq+EJIpE3uKsdwg64amQNUcffQ0u1C0i6uBamQlhZBWApApXWzDoJ1RN8u/EAmTGznm+ebE0wKVxXxuWt12Re5EFlMbw9u90R09OgkMT528ZSnwK/j5nY5ootC5bVbgfaKSD+1MS/Dvk2O6lWT9zOysHmKu0s25qJZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fc8u4WTo; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fc8u4WTo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788084611; x=1788689411; i=markus.elfring@web.de;
	bh=d+eit4ZYtbQWFmVitvO6WUQ2EVGzOElaLzC6BZF3wIs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:Cc:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fc8u4WTo4sGIgKC8NMGX75iEWif/G0INjX+eCFpsRIZtCO5NEk7+UXeh0lhgzMus
	 yvI2tNWbupjZTAIzrhQuI4DT4UqxNR90r5nAKBCr3qVIK/lpn4xfAijSRwH36rnNA
	 UFSfhgaTHeOKLNIg6/28yOla7+4/64ZILGHYYWQ4uE14JQ3si4G8zNFlpitjV9OKq
	 XbZzxzBAOY7fmzfg0R6HGulB8Ny60zqPCJLz5bfXtJdeC5FPwZKb8tZoMusw+b0ht
	 KJSP3iw8RKrzd+h2jnq+76oTiJtIe5fNh23RFOjRJdwq4mxVJJ6kRo6wl6xTUi05y
	 6dj6xu3rvzFJ9v2hLQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6Jxd-1wqA1q1yTB-015QEI; Sun, 30
 Aug 2026 12:10:11 +0200
Message-ID: <6974fddf-603e-4811-b03e-191eb0166b9e@web.de>
Date: Sun, 30 Aug 2026 12:10:09 +0200
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
From: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <a7ce1c69-a6d9-e535-2bff-d16627ecfdee@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2PliwKa0Ta8/09k9+PkGpk8WB7xnIDfmCLJyX0Q82egoinENfR/
 RQbpu/NOd3jIi89xjwTd84P1AgJ1mtKk09XsQdZapVUFjQZFPOzyXneRP2xugvlYmqLvisZ
 SWMRf7uhaJKq5wogng66C7sy2CwyOLQq2QdhHMauS+P0z16zp3V20jm7RlQtE6ieqSPA+QK
 uD5nny/CeUtJ4gWLBKbBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YukbtLtuGuU=;L4Qni4qFbXyLKaWbclwJKRY4ihh
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
=E2=80=A6
> They will not improve.  =E2=80=A6
>                   It is not in the spirit of the language.
* Under which circumstances would you get into the mood to explain the rea=
sons for
  the presented error message?

* Can collateral evolution become more interesting?

* How many member names can be handled by bigger SmPL rules?


Regards,
Markus
