From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Jul 2015 08:40:39 +0000
Subject: Re: staging: wilc1000: One function call less in mac_ioctl() after error detection
Message-Id: <559CE207.5000507@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <558EB32E.6090003@users.sourceforge.net>
 <558EB524.1050609@users.sourceforge.net> <20150707023150.GB22043@kroah.com>
In-Reply-To: <20150707023150.GB22043@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chris Park <chris.park@atmel.com>, Dean Lee <dean.lee@atmel.com>, Johnny Kim <johnny.kim@atmel.com>, Rachel Kim <rachel.kim@atmel.com>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> The kfree() function was called in two cases by the mac_ioctl() function
>> during error handling even if the passed variable did not contain a pointer
>> for a valid data item.
>>
>> * This implementation detail could be improved by the introduction
>>   of another jump label.
>>
>> * Drop an unnecessary initialisation for the variable "buff" then.
> 
> That's a different issue, please fix it in a separate patch.

I have got an other opinion here.
This update suggestion depends on a small source code clean-up
from the previous patch, doesn't it?

Do you want that I split the second suggestion from this series
into more steps?

Regards,
Markus
