Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728097;
	b=WPt9ZBdlkSJbvhEnO0mrPmURlSlIWRJsdKsbDtsT0CaKApb09nC07k+4ZNjKSdwukJGr
	 zirRGZTp5bnBvFxio8YEyOV7nuTJW7sJzXQFjBH/XZoWuLNqGBK1t4uojg3C8JjnteQvS
	 ippqkiYsrPrwE8xMH7apwDLvdnC7hCNdturR8RxUXEnWt72r/qM6Sv6u871m7cx7SFKf3
	 fQfaiO8rn6146N2qv2ojj6VERlM9mh+fyM6VykeyJ6MBAxmiCAmCQnK+mpZJl3hD9CSRl
	 dNufjw1VkYwcxDcBBc2JVg5y0jMRLmvLcATPl+8656vyisZxLoBtClIkV824LFPiSkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728097;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=taOA9UbDWUlC58AOCilW4/hn1kzjX1JE47yYJ1jUDdw=;
	b=BQGbCSOixkKIq+9zLQNb7wl51eZB7iCql1vi7uT1H+ys3I0tKeUh8oLfUUS009XkyOre
	 N/8QXYxMNN0ymBYfiJkbIKXWJgd56bPu6+ChCX6m8RQnOYeDK0x3gHQvLxbOGygysP8R2
	 erDZ/qAmWP5GiPYzy7Mr+Y9ESm3Up2KBgE4W3ZW3/0Ymz2jPnOxefrHinA8fIUTvppTxU
	 tk4lRKWv1lAC1IwwFEnHzLQw3cQo1WEgbFsFHXYwRw/sdgCcwNJQ62JNpfp4DpywVDa8+
	 D1mvkePrlTzQfsIGn1OPYHVuuHIaLDNmN9OEet6kaNNOtSbajhJUWWjvAh8KR8ujQ9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=exSJ7rC3;
	arc=none smtp.remote-ip=212.227.17.12
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD6B606A324;
	Tue,  3 Nov 2026 17:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD6B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=exSJ7rC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793728089; x=1794332889; i=markus.elfring@web.de;
	bh=taOA9UbDWUlC58AOCilW4/hn1kzjX1JE47yYJ1jUDdw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=exSJ7rC34/st85E7GY6MCIZUVb72cKgwihHbxBgIrArhXZAJbWzm7fiYbXFFHuhr
	 WFwMyxrCWTtje1vAflw9KOP7Iypc7vKIR/AMdTvh52BMYXXdClXQAC/KmvUn6xEL3
	 7FiNSEs0/or5FDb2Skevqgdo0AvXv0Mj7IIQM1h9108gZ875FASkqTImhMQjd8hoo
	 kMy+e8e7cW86NEUPiTM66CsUFOBrFb81pXsphzWKj7bug/QdksRso6g7oaR1fUVkK
	 H0nKSz/SolXMYD6M6NEUBIL5mXnU/u6rqoQUoChh/baQq72VDV+s9qyY3HYnN5DbD
	 jDsMXvI5FcQ7EhKmYQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvsq5-1wYWqM3Cdz-016gEz; Tue, 03
 Nov 2026 18:48:09 +0100
Message-ID: <aa076739-d573-43b7-85ad-d2a6e88db1e9@web.de>
Date: Tue, 3 Nov 2026 18:48:06 +0100
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
Subject: Re: [RFC] Replacing special goto statements by direct returns?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: tools@kernel.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
 <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+FmgXsgMq0TU4TV2pE/6jopS+3uxk/uaDUQq+AYZy9SgckjsTNB
 MEvDA/iKTB+6LPMZ1723ydpv0wLIcUFVEX9G3SuoMshdJ+LmnfLlbaP0D/xokFnAWcwUcbQ
 mEuWRIyOHr/zr0UdtowxRpxsg8dLXAnO4OwmWP+h5gorPiEbJx7EqkHf1gRhcGCb7AMqwGT
 riGfOXDR6aoLGxbkYBGWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LcFd1KGuBpw=;tkx6WxeHQdRAOHR26JoCGZJbbeW
 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
 1JXlDAzspepc=

> I think you can do:
>=20
> @useful@
> statement S;
> expression error;
> identifier error0;
> position p;
> @@
>=20
> S
> error0:@p
>   return error;
>=20
> @useless@
> position p1 !=3D useful.p;
> expression error;
> identifier error0;
> @@
>=20
> f(...) {
> (
> <...
> - goto error0;
> + return error;
> ...>
> &
> ...
> error0:@p1
>   return error;
> )
> }
>=20
> I have not tested this.

This is a pity.


> It might not work,

I got corresponding development concerns.

* You proposed to use a statement variable in the SmPL rule =E2=80=9Cusefu=
l=E2=80=9D.
  How safe is the control flow connection to the subsequent code?

* Another metavariable declaration is probably helpful for =E2=80=9Cf=E2=
=80=9D in the SmPL rule =E2=80=9Cuseless=E2=80=9D.


Questionable test result:
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/janitor> spatch --parse=
-cocci replace_goto_by_return-Julia.cocci
=E2=80=A6
minus: parse error:=20
  File "replace_goto_by_return-Julia.cocci", line 25, column 2, charpos =
=3D 400
  around =3D '...',
  whole content =3D & ...


Would you be looking for a better SmPL conjunction?


> or it might be very slow.

I hope that experiences can grow also for more desirable software run time=
 characteristics.

Regards,
Markus
