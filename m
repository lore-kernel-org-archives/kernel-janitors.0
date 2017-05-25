From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Thu, 25 May 2017 06:20:33 +0000
Subject: Re: [PATCH] MIPS: Alchemy: Delete an error message for a failed memory allocation in alchemy_pci_pro
Message-Id: <CAOLZvyH-DF_r77kzcVcn+A-tTov+aNZ1oGNQLnGWXE35UODqtQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
 <CAOLZvyHq-7q0XxiBsyX3q0g0J3kjfFv4SU7amX1hpjRDyK+feQ@mail.gmail.com> <796029e7-60a3-a94b-8b5c-4686a0656560@users.sourceforge.net>
In-Reply-To: <796029e7-60a3-a94b-8b5c-4686a0656560@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?B?UmFsZiBCw6RjaGxl?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, May 24, 2017 at 8:15 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> +++ b/arch/mips/pci/pci-alchemy.c
>>> @@ -377,7 +377,6 @@ static int alchemy_pci_probe(struct platform_device *pdev)
>>>
>>>         ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>>>         if (!ctx) {
>>> -               dev_err(&pdev->dev, "no memory for pcictl context\n");
>>>                 ret = -ENOMEM;
>>>                 goto out;
>>>         }
>>> --
>>> 2.13.0
>>
>> Why are you removing just this one dev_err()?
>
> How do you think about to achieve a small code reduction also for this software module?

Generally speaking, sure.  But why remove just this one?  Is it
because it loosely follows a
pattern that was deemed removable in that slidedeck you linked to?
(the "usb_submit_urb()" part)?


>> What issue are you trying to address?
>
> Do you find information from a Linux allocation failure report sufficient
> for such a function implementation?

Yes, I wrote that code, and in case this driver doesn't load, I'd like
to know precisely where
initialization failed.  I can happily spare a few bytes for that.

Manuel
