From: Martyn Welch <martyn@welchs.me.uk>
Date: Wed, 30 Aug 2017 19:47:51 +0000
Subject: Re: [PATCH 13/14] vme: tsi148: Improve 17 size determinations
Message-Id: <CAEccXeea6760kaDw5pLEqDJuLwG3PbFvCKCxY2_PGAe3bJ-YxA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
 <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
 <20170825205721.GA11181@hades.home> <934e298f-596d-dc13-f3e3-797a49c74e84@users.sourceforge.net>
In-Reply-To: <934e298f-596d-dc13-f3e3-797a49c74e84@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel <devel@driverdev.osuosl.org>, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 26 August 2017 at 08:00, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>>> @@ -2363,5 +2364,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>              master_num--;
>>>
>>>              tsi148_device->flush_image >>> -                    kmalloc(sizeof(struct vme_master_resource), GFP_KERNEL);
>>> +                    kmalloc(sizeof(*tsi148_device->flush_image), GFP_KERNEL);
>>
>> This line is now a tiny bit too long
>
> Can you eventually tolerate a line length of 81 characters at such a source code place?
>

I think there's some irony here. On the one hand you are submitting
patches that correct coding style issues, on the other you are asking
whether we can ignore the coding style...

>
>> and needs to be broken over two lines.
>
> How would like to achieve this?
>
> * It seems that you would not like to perform such a tweak yourself.
>

To be honest, it is quicker and easier in this instance to do just
that. So that's now done.

Patches now in my testing branch:

https://gitlab.collabora.com/martyn/linux/commits/vme-testing

For future reference:

> * Do you expect a resend for the complete patch series?
>

Unless the maintainer has commented that they have accepted patches x,
y and z, then sending the entire series again is generally the right
thing to do.

> * Will it be sufficient to send another patch only for the requested reformatting
>   of a single line?
>

No, unless the patches have been accepted as-is.

Martyn
