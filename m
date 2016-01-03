From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 07:00:34 +0000
Subject: Re: [PATCH 1/3] NFC-mei_phy: Refactoring for mei_nfc_connect()
Message-Id: <5688C712.3070900@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56883849.2080304@users.sourceforge.net>
 <5688390B.3080800@users.sourceforge.net>
 <CAGRGNgWiHKLrHMUySnCpfiF1+C=QV-i4C4KNmziga3-E1CLfKA@mail.gmail.com>
In-Reply-To: <CAGRGNgWiHKLrHMUySnCpfiF1+C=QV-i4C4KNmziga3-E1CLfKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Calaby <julian.calaby@gmail.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>         r = 0;
>> -
>> -err:
>> +free_reply:
>>         kfree(reply);
>> +free_cmd:
>>         kfree(cmd);
>> -
> 
> Why are you deleting the two blank lines here?

Can they be unnecessary at this source code place
according to the Linux coding style convention?

Regards,
Markus
