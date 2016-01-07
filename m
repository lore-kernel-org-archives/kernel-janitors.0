From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 07 Jan 2016 19:56:45 +0000
Subject: Re: net-thunder: One check less in nicvf_register_interrupts() after error detection
Message-Id: <568EC2FD.9000702@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5685A273.6070607@users.sourceforge.net>
 <20160107110701.GE25086@rric.localdomain>
 <568EBCE7.4060502@users.sourceforge.net>
 <1452195846.4028.24.camel@perches.com>
In-Reply-To: <1452195846.4028.24.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

>> Is it a bit more efficient to avoid a double check for the
>> variable "ret" at the end of the current implementation for the
>> discussed function?
> 
> Before asking questions you could answer yourself,
> please look at object code produced by the compiler
> before and after your proposed changes.

* Do any more source code reviewers wonder about the need
  for such a double check?

* Which object code representations would you find representative
  for a further constructive discussion around this
  software component?

Regards,
Markus
