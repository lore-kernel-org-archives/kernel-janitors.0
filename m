Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1993720010A;
	Sat,  1 Aug 2026 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785571855; cv=none; b=XGSlYg+NgoAJizu8iSBpFChnLk185OPHMWFDWjKOtWbZLDERppnXv0XKhwAFP6qwdeTWBrE9/oqXtyrpD1rjiGGJN9UN2spDzkg1lvQxhSciX+ggDW29P+2Uc8QjND5TBXAFzCvWUgSJsP7lL0cz18/GgiyPtSxbr1QxZ6ndlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785571855; c=relaxed/simple;
	bh=bhNruFLWqj1tTw9NgaK1mqt3cFRTQJAmJ4QjblAPJR0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=DcSeaUftIubqEmF5xLOFsHao39rbVcsjwlugiynbXTJ73yQZf9RAJyJv+pGM4+Wv6Avh48n91m3ycPPRfz0o05O8dkAdEye58S/22Fn5mAdMFGNm9jCWady51vk5OsEE8+LrljJGS09f2GxQSz9ukIq14yj3BxqyvoiYOPTGdww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qZuOGQNi; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qZuOGQNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785571841; x=1786176641; i=markus.elfring@web.de;
	bh=bhNruFLWqj1tTw9NgaK1mqt3cFRTQJAmJ4QjblAPJR0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qZuOGQNi8bU/SiW/O0/zOA6+FqwKSHXTFuGt7nOLvts9k49UITYGEIEF7mFBOed1
	 cTObHNaEwAk6ex7gtmjKT+psEBkWp15KILqG4BJQb4ajCODCFDLZczaLrxbM9QH9Y
	 ydoAJBeWwzu4q3neJrstmPlWTrn+U13WLlcxT8KHNvRzj7BPE1ocruGdn+rDUWpNN
	 0Oul02vsPqXCGvX7oGXYZKNoy6OGNRan+zJ81/wr5rnrO3zXlQ7zG2TlnLRZwYLOF
	 Nrgr/1ERhRvRXALrfpM9Ni307dDPK8Q6nPJC101ofIZtl/6ZAQv8bDZqBiO7b6l9I
	 ZsgUJOigB73y1EhFJQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M91LW-1wtwgx36s2-0022gN; Sat, 01
 Aug 2026 10:10:41 +0200
Message-ID: <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
Date: Sat, 1 Aug 2026 10:10:40 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving output for single characters (with SmPL)?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
 <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8ovucE9OUYZSdFBeX2oCGp37ahYex8dGEKJq8roXFB9+WNwD8x/
 4vCzkZoBTNZDUC1g5nOWwcNt6cbnUcmq2VZjTTrW06vHx9oXZLbV4vifl3/iGY0WyY6QmyF
 e8h9rv8cFKFXT1Hj5YwChMxmgE6FUhYjQg+bnHs5qulO/uKrU1l8nC1PXg+ADsu0a76AlnV
 UbBXSZMAU42yDM4BnNCfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:i1oaCSHmApM=;B5cdeFiSvJfFrLmHK5WN9Brspn6
 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
 SVS

>> Which implementation details should be reconsidered here for an affecte=
d macro?
>> https://elixir.bootlin.com/linux/v7.2-rc4/source/tools/bpf/bpftool/netl=
ink_dumper.h#L25
>=20
> The shown source code transformation approach can be repeated on demand
> for selected areas.

I would like to add that only a single diff hunk is generated for the foll=
owing script variant
of the semantic patch language (as it would usually be expected for the me=
ntioned software component).

@replacement@
@@
-fprintf
+putchar
 (
-stdout, "\n"
+'\n'
 )


> Now I wonder about the following information.
>=20
> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Linux/next-analy=
ses> grep 'diff -u -p a/netlink_dumper.h b/netlink_dumper.h' /home/altes_H=
eim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/u=
se_fputc-bpftool-2.diff | wc -l
> 2

How can the generation of duplicate difference output be avoided here
for other SmPL script variations?

Regards,
Markus
