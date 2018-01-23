From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 Jan 2018 16:49:59 +0000
Subject: Re: mfd: Patch management?
Message-Id: <4b525322-424d-328b-a348-626a26da8f61@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9c50fe6a-21cc-e49d-1b10-5d2457ed4e2a@users.sourceforge.net>
 <20180123125851.ysypf7375sjlgsc6@dell> <20180123130130.powyttapsx3djawx@dell>
 <f8900a77-eea4-d244-37e1-44d22484f826@users.sourceforge.net>
 <20180123151419.prwq62c7gpsnpbx3@dell>
 <ef7a4d25-d4f1-77e3-5489-bbc385de3e5d@users.sourceforge.net>
 <20180123163130.h6ygmzig7syafxbh@dell>
In-Reply-To: <20180123163130.h6ygmzig7syafxbh@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Lars_P=c3=b6schel?= <poeschel@lemonage.de>, Samuel Ortiz <sameo@linux.intel.com>

> What I should do really is ask you to take all similar (remove error
> message, don't use sizeof(struct X), remove '= NULL') changes and
> squash them into single patches.

I would try such an approach more often if I would get also more
promising indications of corresponding change acceptance besides
other software development “surprises”.


> However, I realise that you might want the "upstream creds",
> so I won't do that

I find this view interesting somehow.


> -- but not at the expense of my time/effort.
> 
> The two choices are to squash or to create a set.

This information triggers recurring difficulties around differences
in the preferred patch granularity.

Regards,
Markus
