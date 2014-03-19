From: Nick Dyer <nick.dyer@itdev.co.uk>
Date: Wed, 19 Mar 2014 16:02:05 +0000
Subject: Re: [patch] Input: remove a duplicative NULL test
Message-Id: <5329BF7D.8080007@itdev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140221085506.GB13185@elgon.mountain>	<e1cf3227a1484c3b931abb61b97391a6@BLUPR03MB373.namprd03.prod.outlook.com> <CANLzEktLFDcMpt7Gq19=7T1Ak2Be4qs3fmDPyswHUNrVJiGjSQ@mail.gmail.com>
In-Reply-To: <CANLzEktLFDcMpt7Gq19=7T1Ak2Be4qs3fmDPyswHUNrVJiGjSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benson Leung <bleung@chromium.org>, "fugang.duan@freescale.com" <fugang.duan@freescale.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Jingoo Han <jg1.han@samsung.com>, Daniel Kurtz <djkurtz@chromium.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> On Fri, Feb 21, 2014 at 1:14 AM, fugang.duan@freescale.com
> <fugang.duan@freescale.com> wrote:
>>
>> Agree, it is redundant. And if you have free time, you can convert
>> the driver to support devicetree.
> 
> Please check with Nick Dyer before you convert this driver to support
> devicetree. Much of the platform data this driver uses has been
> eliminated or consolidated in a patch series that he's been working
> on.

If you look at the "improve T19 GPIO keys handling" patch in the patch set
I posted to linux-input on 17th March, this redundant NULL test has been
removed.

I want to remove most of the existing platform data since it is not generic
across all chips - see "remove unnecessary platform data" and "read screen
config from chip" in that series of patches. It's high priority on my list
to implement device tree support for the remaining items, which will be
just irqflags and the touchpad key config.
