Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CC21CC5C;
	Sun, 30 Aug 2026 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788077749; cv=none; b=jrY5jGkrw61NxT7JQsGD6gNazC+WLK/+nfi4Oaf7vHcwKp9VQfG7e73UEu/yPK+R4exE99puJzXHtZmd/j2ckpgStEIegEGtdNmuSwobIGkjIeu2PBMwCJKE+yVhcTPTqrojJu2agmGKMflJfUBkE/I0dc5RuntP3aYg+SSEABg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788077749; c=relaxed/simple;
	bh=PoOVC/6+fp7RB2We+JgpUcS39O/SX3gLHichgEEAESk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=aOmUtb/J8XHGLe2cWigzGwtLQhRco8rgD+/IrnNvss2NRDq0V7c6PizRzAysPBnNy2GMW9TTZJaSMwhxXMwGWNn7IZJ+1zzCjewJDrrZLG911svtPzT7Pp3gbvlbhjoTMW4eCIgk+zOLYG3SPwB70WDOU1HVLTGWfROYrXONoOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QO5Syhm2; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QO5Syhm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788077740; x=1788682540; i=markus.elfring@web.de;
	bh=jd5ILdvlsR8N4ZbWZuPs/+mH3KH3MaIM/gvvRQl2NSg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QO5Syhm2FT40zZ0VA9pc+HiMbbqcyeyX7PKahlIvFSbCCFw6JZWEc56pUZ+HZKAz
	 jDu/xXWB3nTPt5uUsLCl9Nt0WWhidrM13a61qkE03nxjJC+xNAkFJK9pr5OHAkJl6
	 Amq1Sw00Pbb7cP5vsiHwv5vw8H8Cf+vudN8GL/Onv4C7Yb3llTrS7cFioLPXmWNCb
	 l4Wvzyq/KKqATCjYl6QwL2RidGlo6L50w/wtcBEKmlBGZNDzqW4PhAEv2J/hDR1qd
	 9yo5qmYdGlasOXMKwz+TVJUS9tYtroIifrQRXcwBBR0GN9O6tJ/0Z3ey5ZC+tRbMP
	 rZ1znrP2pIuGu7nw8A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N30ZL-1wua3y44b7-00yJ3j; Sun, 30
 Aug 2026 10:15:40 +0200
Message-ID: <fc7bba15-5116-4467-bce1-be8ff3859184@web.de>
Date: Sun, 30 Aug 2026 10:15:17 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: cocci@inria.fr, kernel-janitors@vger.kernel.org
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [RFC] Improved handling of member access operators with SmPL
 expression variables
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hHZLkL9s9DdHgcAJgSNcQr93LME+W80k94C7ZMMpRv/VAtLfmLs
 i05pypu0G9+u9PbsQEm5bDgPJWZtNi+6Xl63Ayf6whR5jA6fbhP3eN9VfsfKqsnEJUBHCe8
 4ENuhzw9o/dO6D4CYOSfaJP7DMlKfUFVI/9ViTrYPdhd78t8b6v1pbG4UhEosQ4bum7ShYk
 VJyecQn/oaRJZedjDtsSg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yqFF4XQ8xXI=;M6s3Qzh7loOSOx8A5E949LGC68J
 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

Hello,

I pointed out that some data processing can be achieved by the means of
the semantic patch language.

SmPL script example:
@display2@
identifier an_item, a_field;
@@
(
*an_item.a_field
|
*an_item->a_field
)


Extend support for data processing with member identifications
2020-09-28
https://github.com/coccinelle/coccinelle/issues/226#issuecomment-699787269


Another SmPL script example:
@my_test@
expression hint;
@@
*hint->hint


Questionable test result (also according to the software combination =E2=
=80=9CCoccinelle 1.3.2=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/Probe> spatch --parse-c=
occi show_expression_for_same_member_name.cocci
=E2=80=A6
minus: parse error:=20
  File "show_expression_for_same_member_name.cocci", line 4, column 7, cha=
rpos =3D 37
  around =3D 'hint',
  whole content =3D *hint->hint


How will development interests evolve to improve affected software compone=
nts?
https://en.cppreference.com/c/language/operator_member_access#Member_acces=
s

Regards,
Markus
