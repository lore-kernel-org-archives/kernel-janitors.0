Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8083DBD64;
	Tue, 30 Jun 2026 17:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840167; cv=none; b=IHT36AtYZHC7xSYUU6N+wRVwNEBhs65+VhchcMmz2Aw0nrdN5h0lJu3JkjTDti4obCFlaWSWUhqqcyzf8/mUeZHrJPGnHSKY8BS38eSyZutKSgn3QPceAZqZDTbyCPrnYVrGJ1DIPtrh2v+13Sc+FMTnOVzfshNliolKR72pQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840167; c=relaxed/simple;
	bh=64baVP3gSQhIINhQkeFO4sPnC6euhTNqjHUz6JweEK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9jt2okjEAPUooQAxLoc+7FfEy/T5KdEoA1N52qsY3mshX6ophAZi2Cp6N/PDuTJdECGCQghMo/HTwT7QL+0ULEg/4zRwr7HwZ2kfd2SOVNyxQ2zuNgNIELo1Yk/V/9z1m+3CNc1UpfBbqHq61KaIhEMwZRniuW/6xbDd3fYfds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KMaqhUWT; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KMaqhUWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782840161; x=1783444961; i=markus.elfring@web.de;
	bh=6KxrEoraTauKBYtuuCpwilrfcDugoQ5e2+9KPveZSVE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KMaqhUWTVpmxFrqnc9DWD0jeKjsqhW3rdO6yaiTJjrKYP3XM8QmiFyoWFhYF3iVa
	 pmPmZ64bz46UR/TzVqA2ippQ5Z/vjnmszIqZO6RxB1Wuo559zVpoARUy+GLXzMsZY
	 6/SGkHBmZPobULhx2pZhbvt4gN+CTtMubSVJrMHzy9nal7BJPTtdQ+q17PEeeDDxg
	 K3tYf1JQ4SBi00QbC7NYnQCYGHOvQO7bX0zy3YdOUhpXkOvf0fwK9mBCsukgdweNt
	 aPR+L4i6W7MLYaEBWtFLe75opBSi/lqm8uXinRo+ELa+ImrXNBOOGjBUqW6gSZIJ0
	 20cUYAKI4hIln/zyLA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MZSFO-1waeDn3Iww-00UC0S; Tue, 30
 Jun 2026 19:08:49 +0200
Message-ID: <2811c5cd-f2a2-418e-a5ba-b1c68ef5f1b9@web.de>
Date: Tue, 30 Jun 2026 19:08:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: SOF: topology: Use more common error handling code in
 sof_link_load()
To: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
 <178281882519.79320.1939247511595511190.b4-ty@b4>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <178281882519.79320.1939247511595511190.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f9bOaoQVqAdv5dniga3385yNukv0emK575L0Qt5QjYSKAadmuf6
 IAzjiWE4UizzTO46vvhGG9vbXo8OUyQo5IA7hpb3j4Neq+pw3AhCe5MsHRQANQq+LDClGBa
 4X/ezOkeq2j6J6vK45HXERVv492EeMLk6DrAVBuvtluQSTCMCdJuuPKznQz/RFuNhh0wt0K
 m9K0AnQYKLmYg3YOOT5kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:owUkbHYTfXU=;cayVHqXlWEC4eD9X9UgB3I2TQPU
 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
 jwBo/0RA2VQ+bC78+GvLiw4gxzjR+gugWSv8Kje

>> ASoC: SOF: topology: Use more common error handling code in sof_link_lo=
ad()
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for=
-7.3
>=20
> Thanks!
>=20
> [1/1] ASoC: SOF: topology: Use more common error handling code in sof_li=
nk_load()
>       https://git.kernel.org/broonie/sound/c/a33e6fa400d1
Thanks for another bit of positive feedback.


Will the chances grow that further development ideas also from my change s=
election
can be integrated better?

Examples:
* ASoC: SOF: topology: Replace devm_kasprintf() call by devm_kstrdup() in =
sof_copy_tuples()
  2025-04-16
  https://patchwork.kernel.org/project/alsa-devel/patch/3e473ff5-1554-4065=
-a305-6b3661e0b941@web.de/

* ASoC: SOF: topology: Move a variable assignment behind condition checks =
in sof_dai_load()
  2023-04-13
  https://patchwork.kernel.org/project/alsa-devel/patch/46d8e10e-25dc-dfd7=
-3e39-92b86058126a@web.de/


Regards,
Markus
