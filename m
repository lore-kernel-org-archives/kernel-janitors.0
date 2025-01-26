Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88D2AF0E;
	Sun, 26 Jan 2025 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737901444; cv=none; b=lDi+VgKHwJrLamYIG/u9p6QOeZI1O20sbJky6jhir6o+QrrCNFUdVlWRWlmq5tdvFm82o1KuScVwc4SUkgmFF1iCH2dDFUxW4+oeIs3XKrXRLQudbYZBOgecQFrqQOnBDSPBR7b4S16LatLO+9rskAm/NmgtUtvmzlOmqOdqVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737901444; c=relaxed/simple;
	bh=8qllBG8/dgA3NYvB54Omyj49+tPPSGlmDMFsMARWX1Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=mqJgeHl4AgsKGQ8UDQ58F82x4DCIzZTb+w7ZRQTenNgbvPrWTsFK5rObzm+Ci3mQ1jFJrit3QyiIYHB73Rq6Fas0nlDu46+/T9sKH1ulL2oFVvi+6HNtxhULup+8IHidE7BcYKNErS/fVyCEKwcN3Bejk3qL5dBJsLh2Je+OmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GCP2JRii; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GCP2JRii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1737901409; x=1738506209; i=markus.elfring@web.de;
	bh=2bawKp9y2VIgFf+zVOz2VvlYltJx/ym2h/pDLuep0cU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GCP2JRii0romGOcJZydGxqCkKZXTG7QNadaKDoGwinFzx4A46+4drEXEOoDRvcZu
	 Ip8YuIwfHQghADjdOLjZfCusEhUe25ulbKr3PTpZHaWQR6bq+F0M0pNN+P4t1qx8O
	 CuZKle9UwvMU5AHIQxcXcYshLFoLZzHWanB5HAbuOlpJ8p8weSKBHnIe3EZGyxYdo
	 bQn71JPv7bLKsNtHJt8+oNNyMzbGotmnrDVOWugwsLMKY4/zZadKYM9k4Th0bCd6W
	 wvO9YvIU74QA+Z+dUwcgPX285dhubGjxyfvPZAuLw7Gl9borJyih+dfPfqg96Xh2X
	 hTD3n+PCa+FSkEssJQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.80]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MsrdC-1tMjcX0vai-00u7HB; Sun, 26
 Jan 2025 15:23:29 +0100
Message-ID: <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
Date: Sun, 26 Jan 2025 15:23:27 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeremy Clifton <deaner92@yahoo.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Huang Shijie <shijie@os.amperecomputing.com>, Ingo Molnar
 <mingo@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Petr Mladek <pmladek@suse.com>, Raul Rangel <rrangel@chromium.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Yuntao Wang <ytcoode@gmail.com>
References: <20250125154139.7565-1-deaner92@yahoo.com>
Subject: Re: [PATCH] init: Unnecessary braces around single line statment.
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250125154139.7565-1-deaner92@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:g1NjTmQ6bs5ODEDcqVnJHqrksBerl4A6BL02L9Xg+3kNLk848zF
 BRu4Y15e5KQdpJgtV84aFXDasGm+TKDdWQremUoiDb1DZB+lwY9uyVN8IGv5zvxy4EoHwZm
 Kioa84svAmMWXhjmDawa36o1D+v/lI/3NGFejs9Tp899CmDVHCEz5SI503iEaEfUqIhxXMU
 /utmGRKo2G2qvjAnYK70g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8rvb3iqOz/M=;9UEwVTyvcRFC2QBeChfXEedy0WB
 VLGH/j1Byc919GFkv1XozNsOPqWPdNxRZCt8isVanY05IBB8eL1kn3vrlsMnjlodKpEboxs1D
 lHnioKt+2w/1Fl58XLYncVglYsRJnvohg21d7bCZMAQTjo4LAIg2WmWZFBxgQYW+Gpy4z8dkp
 IpU8FOdDHQgoPRalNehgM9eDURJWrfiMWWjmBu1lUEZ66MmdwZFM7T1c1cqw/phLTVSFTvkMS
 ilqKQzKU9AqEpBgQ6NX+B3sOMNNfV92Uy0wZ7cqdmUamDGB5G2HhIUq6zkGrMmN0u8rLj01vF
 WXtCz089nMia5ZXVeZia3aGpss7+sDIgJ8eM1s5m7FLyuAYTsU5ObXQ338bfTtWEan6KC7zan
 RiJXckWouEIDzWfOPlYyeLG7et8h3dXP4D2lHL1gIYmfz28q16UnSdD6rFtNwZpKpUgAMpQSa
 ngENsnRjzLbbToEkhSNE8v/Wxg7UmBauv955R+zL7uZ46/kMsKu4M8vm/fpqOvMwAtC3NGEkJ
 HTwaM3RIUAo9mgbbjgj1jvfgIgQiNe67e8StrUhFPgoiOvG4ABBUoBJrul2QO/QEFSrokRRIs
 62N0qKaAhsSv9+YGipD1qx56yHa1jiMnMH8le7Gy121GinqCHlRS1pvKbWZAqGUQPXdYfKf3z
 e2on5pJbbnZbwcof7zhtHU73fcfsj8mV/C8950FuPVK2lGtsq4yxyMUg1A1SNh4EHfrVFRTMw
 I1obqZ3op7yLpsFTwwtq2zy+738eDZ540fY4JyslnfPBDs2civOB+ja04aCor+utZOJHd/NOi
 +0RKbHflHwN4/CjCsjhUQICcEgd4UwBigeqs1Ltngv02zl1chxMl3BZh1DPPkyensrMu1JBMX
 zjnM8RPQBUb2FUS3bVIkb2RYJpIrbFs8e6z4pGGEEMkTP+d0GwJDAsNELnJbrsrhqVoxssO7Z
 cH5NdpGsxaif9PbmysUNEcjD9mXLVESWPql9+o9Me4G5U6gNTI2vt5PD5Tq4uzhzUQZlwvCF5
 vifzL2cb+2bNC8ztOX3lqh0wmR4D8g5WFDKfhd617uB/Fq8yZ+b9x3QZbOnEmcvjD5cC0BOK9
 hg3KNV7t35bjXBMCw40RD5Y9YLGk6+VBOSUS3RLn+jyvoIuAdkleoJE0PiUPgQF16bBDdVhZW
 vN6JjeqthjjS5a7XmtZG6pdqpSTuiKtqIG+OiCY58Nw==

> Warning found with checkpatch.pl script. Removed unnecessary braces.

1. An imperative wording can be more desirable for an improved change desc=
ription.
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.13#n94

2. Please avoid a typo in the summary phrase.

3. It is probably helpful to specify selected email addresses also in the =
message field =E2=80=9CTo=E2=80=9D.


Regards,
Markus
