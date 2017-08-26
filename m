From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 26 Aug 2017 07:00:43 +0000
Subject: Re: [PATCH 13/14] vme: tsi148: Improve 17 size determinations
Message-Id: <934e298f-596d-dc13-f3e3-797a49c74e84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
 <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
 <20170825205721.GA11181@hades.home>
In-Reply-To: <20170825205721.GA11181@hades.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martyn Welch <martyn@welchs.me.uk>, devel@driverdev.osuosl.org
Cc: Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> @@ -2363,5 +2364,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>  		master_num--;
>>  
>>  		tsi148_device->flush_image >> -			kmalloc(sizeof(struct vme_master_resource), GFP_KERNEL);
>> +			kmalloc(sizeof(*tsi148_device->flush_image), GFP_KERNEL);
> 
> This line is now a tiny bit too long

Can you eventually tolerate a line length of 81 characters at such a source code place?


> and needs to be broken over two lines.

How would like to achieve this?

* It seems that you would not like to perform such a tweak yourself.

* Do you expect a resend for the complete patch series?

* Will it be sufficient to send another patch only for the requested reformatting
  of a single line?

Regards,
Markus
