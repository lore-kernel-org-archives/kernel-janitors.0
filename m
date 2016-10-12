From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 12:04:45 +0000
Subject: Re: GPU-DRM-Savage: Less function calls in savage_bci_cmdbuf() after error detection
Message-Id: <bcbcc9ec-36c7-c0e9-f4e0-634c1475728c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
 <c97563c0-d463-8b15-5956-26d93641a54f@users.sourceforge.net>
 <20160819075021.GU6232@phenom.ffwll.local>
In-Reply-To: <20160819075021.GU6232@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org

>> Date: Thu, 18 Aug 2016 21:28:58 +0200
>>
>> The kfree() function was called in a few cases by the
>> savage_bci_cmdbuf() function during error handling
>> even if a passed variable contained a null pointer.
>>
>> Adjust jump targets according to the Linux coding style convention.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>=20
> Not sure this is worth it, I'll pass. Patch 1 merged.

Unfortunately, it seems that this selection of only one update step
from this small patch series has got unwanted consequences.

Will the update suggestion =93[patch] drm/savage: dereferencing an error po=
inter=94
by Dan Carpenter (from today) trigger further software development discussi=
ons?

https://patchwork.kernel.org/patch/9372127/
https://lkml.kernel.org/r/<20161012062227.GU12841@mwanda>


Will an update step like =93[PATCH 2/2] GPU-DRM-Savage: Less function calls=
 in
savage_bci_cmdbuf() after error detection=94 (from 2016-08-18) become worth
for related consideratons once more?

https://patchwork.kernel.org/patch/9289183/
https://lkml.kernel.org/r/<c97563c0-d463-8b15-5956-26d93641a54f@users.sourc=
eforge.net>

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
