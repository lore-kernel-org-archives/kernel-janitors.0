From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 Jan 2016 16:59:45 +0000
Subject: Re: [PATCH 7/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_interrupt()
Message-Id: <alpine.DEB.2.02.1601031757380.2074@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <5688DF2D.6090204@users.sourceforge.net> <5688E229.4010400@users.sourceforge.net> <alpine.DEB.2.02.1601031348040.2053@localhost6.localdomain6> <56895246.3080302@users.sourceforge.net>
In-Reply-To: <56895246.3080302@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On Sun, 3 Jan 2016, SF Markus Elfring wrote:

> >> Pass the address of the data structure element "time" directly in calls
> >> of the function "rtc_update_irq" instead of an extra initialisation
> >> for one local variable at the beginning.
> > 
> > Why is it better?
> 
> I suggest to refer to the data item "rtc_data->rtc" directly because
> the variable "rtc" was read only in two if branches.
> Does it make sense then to reduce the variable allocation?

No.  That is the job of the compiler.  For a local variable whose address 
is never taken, the compiler can easily detect its live region, and place 
the initialization in an optimal way.

julia
