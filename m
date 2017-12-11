From: Joe Perches <joe@perches.com>
Date: Mon, 11 Dec 2017 02:05:31 +0000
Subject: Re: [PATCH] TC: Delete an error message for a failed memory allocation in tc_bus_add_devices()
Message-Id: <1512957931.26342.31.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bfb63956-346c-aa17-5b06-fbe19ff0a5e3@users.sourceforge.net>
         <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>, SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mips@linux-mips.org, Ralf =?ISO-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 2017-12-10 at 21:41 +0000, Maciej W. Rozycki wrote:
> On Sun, 10 Dec 2017, SF Markus Elfring wrote:
> 
> > Omit an extra message for a memory allocation failure in this function.
> > 
> > This issue was detected by using the Coccinelle software.
> 
>  And the problem here is?

Markus' terrible commit messages.

Generically, any OOM via a malloc like call has a dump_stack()
which shows a stack trace unless __GFP_NOWARN is used.

So this message is generally unnecessary as the dump_stack()
will show the tc_bus_add_devices function name and (now hashed)
value of the function address.

What will be different is the particular slot # of the tc_dev
will no longer be shown.

Really though, if there's an OOM on the init, there are larger
problems and the system will be unusable.

