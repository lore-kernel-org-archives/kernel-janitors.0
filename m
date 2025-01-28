Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21C71A8401;
	Tue, 28 Jan 2025 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738071672; cv=none; b=pQQgfknsndG19BnYF7WiAmvxZVahQAiK2rrPNMo4yQXmOCT0nJ5sfMNEN0Zu20J52LaXS/niFsAjZ6eBfDLg6sS+ZIQ9w/cJzEmomWNV3z5VjzztLCKrpMnwbXxSaEFaldWZTu1qZvUkI+a2FrryZgBNCFdhSllYbKyWnqQugGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738071672; c=relaxed/simple;
	bh=IjQJqJ91QhTr8vjD/8vwy4Ss7qhgsOdb0zvelMfLU2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yz5imTCW1MQb+My9nHX1H3SetwgvZrvWqnxF6jZEHFhlE6q2OfxW2uFDaLTb1tG2gDIbQZdQUgp4xjSdOA/l7Y8rFH3fJctQVjBqK/edxrMf9aWmDZ9Qy6sLEfWsoMwMY8SHuUzOIDKWATwWGSWrDl0XvQqVRFM0oG+7fxLF0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=b/t0RwRK; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="b/t0RwRK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738071665; x=1738676465; i=markus.elfring@web.de;
	bh=IjQJqJ91QhTr8vjD/8vwy4Ss7qhgsOdb0zvelMfLU2o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=b/t0RwRKaElNA2Kk4OBtnOWHTLPICeVdglsFwK6CpQVGZcdfhHNieC5I4NwceBtL
	 vWf7VBP95DQ7JoHDdS4mkxSeSGlG28JFVLJnSg5FBUbr54GNL+TFDPsoOUS7OyiBr
	 3Y0Cdo59b9deHfb/ToJksQYcwIa74N4FxfHuQwwzfNFGE9+m7P72SXnswpanUyczL
	 a/bwhYq4bKF1AetXUwCuNGLJVUQVBwxBR4Q4ShLyWxnASMilM46SGHjrmVh+ia6Hz
	 4ukDl0wIG01gP1MhRgEDL6rKyTNaAupA+6mhga/KHabZSKf9qvIwlwbiWItLzb+tJ
	 w8zMNIUlSIwQOHBNNQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.40]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGgNU-1thjpg2TeU-00BRsv; Tue, 28
 Jan 2025 14:34:58 +0100
Message-ID: <d55609a5-0c8a-4804-90de-3ce8aa8848e7@web.de>
Date: Tue, 28 Jan 2025 14:34:57 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init: Unnecessary braces around single line statement
To: Petr Mladek <pmladek@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jeremy Dean Clifton <deaner92@yahoo.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Huang Shijie <shijie@os.amperecomputing.com>, Ingo Molnar
 <mingo@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Raul Rangel <rrangel@chromium.org>, Tejun Heo <tj@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Yuntao Wang <ytcoode@gmail.com>
References: <20250125154139.7565-1-deaner92@yahoo.com>
 <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
 <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
 <5033d386-0765-486d-bf5a-68fe790ee455@csgroup.eu>
 <2ee90f45-0ef2-4c9b-8b0b-79d8c6cde1de@web.de>
 <55498563-eb4d-4475-bf85-1543a59aed20@csgroup.eu>
 <Z5iiX9clA62t8Llf@pathway.suse.cz>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Z5iiX9clA62t8Llf@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l1GwEhsuZG2bb8B6SRBzbaHfwKgznT0kZQYWHiLitKl9wO2guLF
 PRwxLggIExodxLvR1UPfhNKZBPNzT5EsH15hr4e1WfJWGOrzN4oGjTnpCgERtFsMRKpHBEe
 IQqL2Jo9eut1JFnrZNVZArwwaC24ZY+jijBhNe6Cq3M/DOxPbt5AQaAZg7XZZKwAgXSXtp+
 0q+b3eL9koQBSDW4CE1Lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T3a9L/4RdAQ=;oYzyUC0KfehV6oQuEJgFstPRnkJ
 j0A+t44ssv4spoP8nxOE/X23073cKezSiOrSQxct/SZax2prFDmxLMOhLF9EX8YuLtkeK15Mf
 DI15dR5Iu994tY2uzTaN8PuyayMNGlP+92kUZK2pORs4xKIS5xv+QXQzMnbRhbufLQ4jiuHpf
 L5vylGMbdFOELjrTqVqngjj2VXBqVRbC09LGsANnmq4SzuXLozIxG8mUSBnvKwK/6176KvfDB
 970dPcU3n+ZHGgsybhz+vzDZ2DDzBsizjRfFUedK5EmUWz7xXiPGWK+x/mjVGRh7r8ufIhVc8
 pmnNUJY/ydYVk2ElPkT5ZuioEWRbuM2TwRKvTEpbtUy2hsPoc6ThLB2SL5Qo2MUy3DxuijKNh
 0lwbq/vkkOxtWwJ6tawFI6oeAYINoXiZrvtpPdTQO/+3mUDXxc7+zRAsI1iNoQfAce8tNWWoh
 dUMOB7vvYxmAgO2QJPQ7gtanukYT6MO1xPdyZh0AXp1rmXiRS5Mv5ajRp7weD9pHsPNKnCOWf
 Ev0kBTGjFZHWIFMKdBCW5cM0btfq1F5RND5skQvrN53GiBX1yeVH2fF3RlaslIXZ3Tqg0iq4Y
 9pT3xIijY/Mg24FhwV9LlID3kdgCoZySCJ/3BJUK40fZhj0wvBf7DyiGl3QFgxC/aSrBHZm9p
 6jm2jTsJ7FXOQ5lHPjvXlUFOb/7G1QMEmP9oRNEy2EEd8VpBMelCeW3XLmhDrakzehUUi860B
 biLa7Tmmzy4/kiC+FqtDpE0W8ycMoCM5fyYY79mabL/l418P2tnSqhEYmyZHhP6sFbhBSk+Iw
 2co28v9jpUwTpIWK7HbGeVzQfy9wvz34i31bwRhWUb99EYwqeHIlUdpIUCHHR0/KjkOQs5lG9
 VxJgiOb3dSLIc2xmxGlElIPVr/Hz5rvAuBZu0uX0EFq7+mtHOP8UDY5Q49vIdqANe/bNfRX54
 K+BUWO/fLVilb6pvPO9GqyQxdj9DsiS33rk2venkIajryUFHBhy3NbBIWOhNYhZ1TeBgNxwfG
 RWUoRQ2im12DaYdyZvuyVvWEYVJzSuOjScseldgYdfFfNEHg1+XwAYD7lMUM5eEwtR6gFXY/Z
 Fg2AJe9E+AlWJ1+eZ9iWwtuEYku8K11N1CIDdWDfwosh2rWidE1HR8KQUaDcznzEW+tZ92qS8
 0ATOdnXyncMmceM+q88Qx

=E2=80=A6
> 3. The authors of cosmetic changes will not learn much by this.=E2=80=A6

Would any contributors wonder how many efforts may be invested in coding s=
tyle improvements
for selected software components?

Regards,
Markus
