From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 19 Oct 2016 13:53:39 +0000
Subject: Re: [media] winbond-cir: Move a variable assignment in two functions
Message-Id: <75f2acf2-bc93-04be-1331-242c5a85beaf@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b6de919-35a0-8ee3-9ea7-907c9b9a36f2@users.sourceforge.net>
 <566ABCD9.1060404@users.sourceforge.net>
 <1d7d6a2c-0f1e-3434-9023-9eab25bb913f@users.sourceforge.net>
 <ecd1ac487c0cfe2080c9477408258e25@hardeman.nu>
In-Reply-To: <ecd1ac487c0cfe2080c9477408258e25@hardeman.nu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> Move the assignment for the local variable "data" behind the source code
>> for condition checks by these functions.
> 
> Why?

* Would you like to set these variables only after the initial
  check succeeded?

* Do you care for data access locality also in these cases?

Regards,
Markus

