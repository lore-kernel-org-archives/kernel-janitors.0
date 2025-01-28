Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE21A59;
	Tue, 28 Jan 2025 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050202; cv=none; b=UV1mb5x4rOxb8Q9Sw5ep58xfRy/JF7PNDOx40grFR7zyk+48Xi+1yMChe3v2DASwk2NtbmzqQzb0ezabVPyglPTSItQDkTAYBitMpmwh91AMy626YOlVmxSS0unZVB63ZWkw6aq7mOavK7hCB495xprxKO7f+nkzm16vrOOlFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050202; c=relaxed/simple;
	bh=FD02n3gm6ctJ6uJVlklZhJUtbV4yGblE934DoBaJmyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9j+IXKNZ8TGzJ07sJWusCf7I46S72kedeP7KD2pt+7erNKpoKyxW95/1ub7R6QHvYeMnvWDDjZvhMrhGCwQQw38Cxqg2tyTEKX3sLAwb+a1BaZIMAkb9HK8NPSs1pWJJHubdWPGIyXKmfmhFTyHt4GqsPG30er1meM0GWRFMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=h2leAxWE; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="h2leAxWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738050153; x=1738654953; i=markus.elfring@web.de;
	bh=/U34p4w78yFndwcx+JBqEEAUiXBS7tyfZXTPxvR4u8Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=h2leAxWEsAxnS78Tsg/AoQ5qeIBHF0CafZIVEXBFKOc3CJo12fhSnfO3tiuNKrNj
	 CLyotDdXOWbKUZV985RK3QrVtGba7l8M9UmHUOkuS6RqXetmmeJ22ZYoCRqutQB7a
	 oFRQlVJAhuRZhzQjimORU/YC1o9+xjA0fsHzeoa4Kf0mm+eNZHEWmkHDSeoMZkpit
	 tLpErEV3c2hy6vJJ5IyhZ4x7J2RBqHrEKz8YwVEj9KLQ/vsDOaVcNuDS6v0G1Bvfr
	 cdg74TgimL6RYjnaxTVBrP5ua1UoB0IIrkarEYCAlPEOLb5S04BrobQaLSZxsdmla
	 jAu3euj0HQyhAUY5Kg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.40]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFrxl-1tgqpi34wx-00A5IV; Tue, 28
 Jan 2025 08:42:33 +0100
Message-ID: <761f0b1c-efd4-4002-95d8-f76edc23e4b4@web.de>
Date: Tue, 28 Jan 2025 08:42:32 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init: Unnecessary braces around single line statment.
To: Jeremy Dean Clifton <deaner92@yahoo.com>, kernel-janitors@vger.kernel.org
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
 <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
 <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bLEHAak0PvGroyh517sIP+PJBWC3X7EPYTV3lI8+2IKAQ+KVlEc
 p7D2kBnB2b5W2UQO/vm8sc4SfcGpoJpQz0iRmRveXcGm7IWGLb+L8XtqkNfjc2XmzpggcBV
 7rGcUWVonKVk3Mm8sLaZhULAEPKwTWxEIkCZG1QRIFvlt9BPOP/jBSjWrfHZB/KnP3gImjM
 CGKJp9TrFDTQfbyM2nBog==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:U0xL+DpWwxU=;C2aoeQhP3BVwvwAceOnIt5JmcLC
 GtLv42MBHm6SwICJ8ytHLHCV9/uy8BixW+lnWOMCC6fVHZ4eOHK8G1CBOadbUpOzXhM4eme5T
 ddLjo6xTpFpysosm5IE4GSiSgyoAKTL6dGBqqni881WmJ4kyyafQO0kCPP5L+AIr3E5hc+ywy
 iiI5EuzhLKhiC+62VikBJ512w4eaDwCfey5BAmDtm33CW/vv+5tW37aSZqD030srELatdEP0V
 KwDGJuwXCPTMQ9MrkDu3Y4HiISuS+5DxNJRqWQJXrhenq79lcnra6XohrqHQy8fp/upp/q55Y
 uheVUzMam0ldzOD+F+Ih9tmxR6vriFXGw/L5x7H3i327K02sfJEEDHiZpSwBPu/HRgc5Ef4Cu
 cRM4UNc1hs8d2rtxyQKKNiufF4Z5ZP2clvdbcY3+GeF09Oyp2/Fx/++YL73/WyAEzqGEm7rhu
 D+y7awq6Hk+etXkW3Ruq5vpe0XdxQytQsizePZRvx0jL/yB+08tgqxYyL2ocrWGqaS97Fjuzo
 TwRAgXkqDrZJo7LW4RFrLx+ZemkssOXb4Sjxrl00sBx98HQhosKUaBeDQ7rjs064O9DG8Q1tn
 VDAEKE76VvSOrqIdkwFPK+N8fPhh1jBrEYdg3sSeaUG3gSIO2Gr39V1DJdKkyFZ+2oU1pxYAx
 TdG4hqhEOe28GPEBhmPgpyfzdfsJDsSsyvk05L7sp+fSdoeuTEtTtRu1fckOKxuHmVBqdBqbX
 8sStdQGRYviTwaaJHO0SerXxlOak4fZmFUgsV+zb4mYefIqtMlriD3NrxmemK6RxHpLDyuULy
 Yhh8uh0bhaJMIbbyOXsHtn3W1o2VJrX+rl2x1hPxCZ1AQLgIesD0NuJTKczlzoFNxDavM7yIy
 mr0szSQykVHFBXHGz2UXAw9L0FiKNdo5CcTSBNWwcFCbeZRAD4gXZPzJtR34Xl4zVFJzuV1XM
 Ffo0Sy2lW1ncgMz3ZdEJRkgbf/FXKY9zKyjgBN+lz+B9WvsLMAAE6+OfFVhPnlWh0U2V7DCdc
 hytaqHjzoqr40GSqwoxN7ohY4HLcdDA5G8B/+Ce+OnfyhNvalp8J/Tvn5OrIUYAqMc/z0C10N
 NLC9N8WKJrIw8A67HjMAKcFx6j40r2X7GqG7elQRomR4sE2ZEwVghhME0Du360taus3szvWum
 DvwLeH5mkskIyG9NUXzPWT1Fdgtt4WB2K+ixPJ+37rA==

>> 2. Please avoid a typo in the summary phrase.
>>
> I will need to resubmit another patch to the mailing list.

Yes, please.


> How do I close this one?

It will probably be noticed that you sent a subsequent patch version.


> Should I reference this in the new post with  'Fixes?'

Unlikely.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.13#n310

Regards,
Markus
