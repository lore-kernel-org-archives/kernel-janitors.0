Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF73346A6
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 13:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922028; cv=none; b=l/0Ad9p5/bOx1V0d7W6z7V3+VTUUD4XDO6Cci4fJo/vWMyIedxahnv8ZZp9LFnHkU2T8a9sG8SDvow/XzaOO6MWXAjthF8QB1S1eV4/dJT+fqm2Ms4tATkVizw7vveF+ecnyR6YEsmKDq+2wTUPywhkLe5Bv6mIgxItbJM8mTW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922028; c=relaxed/simple;
	bh=TTVqmujEK5jfv2fdIfDiYenGzIoZOWNF5sQ1ewwPWGI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=gPOJP4G8GcAEqxE/2ng5QiH53XyvVq/uXVY4JthrylceADz5YRGw3j9eFfGwADwfYNvnDT35zCHX0iE6NYH2ppOrHnCBPZPI6VjqrJrkGsIRFVP95LNrzFncvSTEsUgWW0Qljyk1klx2p+z5m+oujfmOS//BnZnuzhsG/GJitiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=b8Ac1hu2; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="b8Ac1hu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787922016; x=1788526816; i=markus.elfring@web.de;
	bh=TTVqmujEK5jfv2fdIfDiYenGzIoZOWNF5sQ1ewwPWGI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b8Ac1hu231AJiaPvkk3IxYinibB0//7PZmtmqWd4BXWmP7c5Wl8d3fmu7BDMt8yV
	 naXbn8m4zAFCYq1QJ9W5QcXwEGijJpw60ftCtUqJ6nkv/1zXTt9S8C+jVpLI8akhm
	 bI1+Qj0JJPmuDc8Hk3C69YpI5myqXqMHnFJ2nYJttcZV4lwKcQWp7jfq+qWMgsbsW
	 kpCRBuKusD5v39z7NSZLhFizbT3i6sboNInrNiUPEX/myZzeTrQ9MVLWxC3a72/u5
	 r/w8ckKyPa+t5hTnbVU+R3ukdjmDAffw3O6eSq/hnLctlb//MRY8W7G2NPbqQzNRH
	 +2KdQFpbkFQ/SuSRZw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1aDp-1x2Q6F2BWl-00Gxjn; Fri, 28
 Aug 2026 15:00:16 +0200
Message-ID: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de>
Date: Fri, 28 Aug 2026 15:00:14 +0200
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
Subject: Improving support for deleting selected macro calls with SmPL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rAQji7FsgSivFnhPmEj1tEzGsvgtdZYR1Elp9SLbwmqRbG/etvw
 37bOXEues3edbtsPtjCxrIizYB4sj1lcIaB9u3o0sH+q/EtCgso6Tk/APgamC/RWke4NpY/
 cPlaHHuZ1ebUImESkqgzxdcbjLDM4Xl9YK0OX47i9vkLgOd+WMUgdwta5WE2nPNKvv6j4oC
 gS11/lR6SxPsFdXo5Twww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l+wA5sgmpXE=;WMI+Ki5R+6hrtnuNbi5fauBlKEK
 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

Hello,

The data processing is still improvable also according to the software
combination =E2=80=9CCoccinelle 1.3.2=E2=80=9D.

Another SmPL script example:
@deletion@
@@
-READ_ONCE(dev->mtu)


Questionable test result:
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/janitor> spatch --parse=
-cocci delete_READ_ONCE_for_mtu.cocci
=E2=80=A6
invalid minus starting on line 3


Would you like to improve any software components accordingly?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/78ac4072c68190fc929f2=
e3c7534350a5ef6496a/parsing_cocci/context_neg.ml#L1419-1434

Regards,
Markus
