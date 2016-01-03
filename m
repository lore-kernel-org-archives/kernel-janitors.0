From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 17:00:34 +0000
Subject: Re: [PATCH 7/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_interrupt()
Message-Id: <568953B2.6010402@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688DF2D.6090204@users.sourceforge.net>
 <5688E229.4010400@users.sourceforge.net>
 <alpine.DEB.2.02.1601031348350.2053@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1601031348350.2053@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Pass the address of the data structure element "time" directly in calls
>> of the function "rtc_update_irq" instead of an extra initialisation
>> for one local variable at the beginning.
> 
> Also, I don't see anything related to time in this patch.

I should have referred to the data structure element "rtc" here.
Should I resend this patch series with a corrected commit message now?

Regards,
Markus
