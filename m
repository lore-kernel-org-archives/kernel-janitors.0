Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDB42AE84;
	Sat, 28 Dec 2024 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735410167; cv=none; b=fFXFPoln1J/Zt++geFupL6Y2zbvbz20q+0xIlzQKB4qLPRtclyvEHk0S3tSZICu+PMGJKPJOgegMkoVpEkPh65Yt0OSs5kUtIV4dZEleSl0syTKqkYHb6C8JANnPawnNe1JB7EXksZQ7LYdhi02C/dbqJzcQdE/lqOyaRK56LMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735410167; c=relaxed/simple;
	bh=66FW2NlsoJ03Y6/EwNw5qJozgD8z/NJWRGzWPKKs63I=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=gJtNpRf78sYJulPgdXrIHUjrpl0Lyay7bADJF1k8EeBnS0tdxvVGXhunMtDlh3S4d9MGlczUsrBls3bOrkmTDkI0PiLE55uu0Im6sYYLhczQbOJUxJmnAgJjd4LfuYNpJI+bI/Sxn3jaJTs1SHh5UINDLbqKWlY1/uRmanI2QQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fLWEwN/o; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fLWEwN/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735410158; x=1736014958; i=markus.elfring@web.de;
	bh=PuzLHojk6/ufRic9Yw4SKby0HUtmoAyusdC3RCOS+GA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fLWEwN/oJ1ZAXxOpvugFzrqUU9Yh9+fEHe69Bg5qdDpmiSgwTTX14FSsFshooMgD
	 EgYnuZ25w/YoBJi1sF2I5v63rDy21RAl32I3S5iClv8a+iIkxt02WgsY5c1V36q7B
	 omsxjg7ggSI0h/4arCOJ6aWhYu6zASCQQKP4N/8iK5+0b1rrjctFyHOXgiz3Bq4h+
	 /cP0mNXYg6QXCgVgPDb2OXt987GS9qI84RzZcV3fVeRuZO3GfmCpdsH65jub0JFD3
	 lDh1LyGt3D6WZCYa4B1TvIi8iRLd7jcML6XsO4Md2SVq4vnxJ9q5wUGMDCFlRJqfh
	 y8KHLgaGoNRKNuZoaw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.93.40]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLRUX-1tAlGH16Pb-00OQFz; Sat, 28
 Dec 2024 19:22:38 +0100
Message-ID: <6b3a53ee-666f-4f1c-b00a-4bcacaf8cfb5@web.de>
Date: Sat, 28 Dec 2024 19:22:36 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tanya Agarwal <tanyaagarwal25699@gmail.com>,
 kernel-janitors@vger.kernel.org, Haren Myneni <haren@us.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Anup Sharma
 <anupnewsmail@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20241228074246.3572-1-tanyaagarwal25699@gmail.com>
Subject: Re: [PATCH] lib: Fix return check in 842_compress.c
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241228074246.3572-1-tanyaagarwal25699@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N4p2NDxZoMdXPz9lj9nQtQagmV5gTJEASueR1NWiCKIvMdpMKn+
 2KtDIOMz4Gxk4sU2+P1uP2+vLJ/7rNaadlxXMAK9vVpSE/cSylrMLM9wFM8rA0QfzaH+Dh2
 0gamhC4nSHR+ZwPIqQL4IpN3/0O1GKYKe2emtKuTrveMIKF9c+f3QZj13wW+J3rGDQzFhnE
 Tvf8fO+ikpzKX4Dldgl3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HCmnA1xsjBk=;jnI4AMwic5JoHHw25wmwIhVmP8q
 EDrOfEiCTigcIXVHfRSjNIs3pnIZNmqSz2ricjBIwCEinn2WKXVJQ6gvdr/T8i4/LgbJLOaxo
 AmUXH9HZh+nUFJ1/9b3wtGHrE95k1CZnOIKpUpxCw7AxqVbIpcChyfjRcJvYgQaq/jGWV+GS8
 APXpSR88E1hqKS1G1oWrR0laeGNUtsI0Phisg6fNSbOBLRG9tiEXWyAMgKA85MBCxH71Hqms2
 Qq8p4z+7U8GzRFSWXn/beEN6hbMTQhLBWHpTEBp+TNEb1fzI5SvVgWQ9IAM0v0x0ODOWUWdbV
 oAA6Kv5agwiUdsf4GG4oH7PMibOe1etnwwNhYkgjIBZ3pZOonLpxjNiS2+5YjI9RvqK9Use6n
 XpVp96Y3y4r981XJk70vl7zXEMFeeW38eIOuwho92CBsrZr9Kngailau9TdAhIuyZfRvEfG9T
 RBS+68a47yhbo1+wKbXSVTuXN33X9ij3AAmPIUreegjM+73oAEJqShjESBmgrSzbixgqz+Yiv
 bIKWLjlnmEcucYan3DwblLgN6MzsWVxvP6kp9yzGniAdXZkrZ0dxUzFo1+q5ESdL+v+eqxzvO
 HgsePYMZZD/h9B1yNyYy6YH3n+9d2YlVJN4CeeiOVlbVB6GvIK/0mk28StT3Ll6wSdPkd/BxN
 UonQ6kiB4rzgjvKcDoQplpyUTycX4pl2f2A001e/wKtCIIN1BMQXRvG7szpgLQjtckIAYaH45
 9ZjDWUavqxsdSLJ/VxXXlQh9Qw7E2s7rBzS3bxv8O9mJ0G1uR1tvrdEHMVWfqWaSkHiiFoXms
 5Mlo4VYkzvgJxatQBAuB3KwwwXpo+5aW7oMkLW6Kc2fyfnlLaeqRV70K3tZ/yuUlpFx3OPaXS
 L446rN0rf+nEWdKm4Lb0Ik+FAB8zGEWoHmNHt1yLJMKTFlW/9NdqLeciM17gVDDZ+bzzmBRzx
 MtMjdYRQoazpH2aCseexFjEFZJVwv3gDQISLDtLGei7mPGqleXUta0sOk8NZPIkXp/7EG8YBj
 abx31VjVoDx8tmbMOwldzByGdI3EiViJ6FUrxZu9pMIy4PMeN/xGUqB8HpRE1klWZ5Krlnajb
 cp+qMD92k=

> Add missing error handling for add_repeat_template() return value.
=E2=80=A6

* Would the summary phrase =E2=80=9CImprove error handling in sw842_compre=
ss()=E2=80=9D
  be more appropriate here?

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.13-rc4#n145


Regards,
Markus
