From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Dec 2017 20:45:33 +0000
Subject: Re: ps3: Improve a size determination in five functions
Message-Id: <37ac8110-057a-9f07-841c-03e49d48f317@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b6464bc-a408-de2a-1b54-cb7794b92506@users.sourceforge.net>
 <7aed1208-aa55-edb6-54be-f47fb1498bfd@users.sourceforge.net>
 <128a40fe-0998-2d6c-ad56-e7b63fce7f12@infradead.org>
In-Reply-To: <128a40fe-0998-2d6c-ad56-e7b63fce7f12@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Levand <geoff@infradead.org>, linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Replace the specification of data structures by variable references
>> as the parameter for the operator "sizeof" to make the corresponding size
>> determination a bit safer according to the Linux coding style convention.
> 
> This would be OK,

Thanks.


> but you are also removing empty lines and changing the coding format.

* Why do you not like such a change combination?

* Do you really want to integrate further update steps in this case?

Regards,
Markus
