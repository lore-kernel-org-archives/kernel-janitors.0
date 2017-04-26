From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Wed, 26 Apr 2017 08:01:47 +0000
Subject: Re: extcon: arizona: Use devm_kcalloc() in arizona_extcon_get_micd_configs()
Message-Id: <20170426080147.GH1594@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
 <1a203761-76b9-bf3c-c034-0bb81fe6006a@users.sourceforge.net>
 <20170424130039.GG1594@localhost.localdomain>
 <b5bb4d25-6cfd-5019-bfbd-dff90c1f9bc1@users.sourceforge.net>
In-Reply-To: <b5bb4d25-6cfd-5019-bfbd-dff90c1f9bc1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Apr 24, 2017 at 03:34:07PM +0200, SF Markus Elfring wrote:
> > Actually fixes a bug on the alloc as well looks like the type was
> > wrong before.
> 
> Does your feedback mean that the tag “Fixes” should be added
> to this update suggestion?
> 

I am happy with it as is, but there would certainly be nothing
wrong with a fixes tag.

Thanks,
Charles
