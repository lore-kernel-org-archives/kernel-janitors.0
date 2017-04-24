From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 13:34:07 +0000
Subject: Re: extcon: arizona: Use devm_kcalloc() in arizona_extcon_get_micd_configs()
Message-Id: <b5bb4d25-6cfd-5019-bfbd-dff90c1f9bc1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
 <1a203761-76b9-bf3c-c034-0bb81fe6006a@users.sourceforge.net>
 <20170424130039.GG1594@localhost.localdomain>
In-Reply-To: <20170424130039.GG1594@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Actually fixes a bug on the alloc as well looks like the type was
> wrong before.

Does your feedback mean that the tag “Fixes” should be added
to this update suggestion?

Regards,
Markus
