From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 11 Dec 2017 13:38:52 +0000
Subject: Re: [PATCH] TC: Delete an error message for a failed memory allocation in tc_bus_add_devices()
Message-Id: <b553c094-238a-663b-a374-a7075feb9f4b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bfb63956-346c-aa17-5b06-fbe19ff0a5e3@users.sourceforge.net>
 <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org>
 <1512957931.26342.31.camel@perches.com>
 <alpine.LFD.2.21.1712110244450.4266@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1712110244450.4266@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Maciej W. Rozycki" <macro@linux-mips.org>, linux-mips@linux-mips.org
Cc: Joe Perches <joe@perches.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>  However I would indeed prefer that a commit description is at least 
> exhaustive enough for such a dumb reviewer as I am to understand what is 
> going on right away.

I can follow your desire in principle.


> So please make it say at least:
> 
> "Remove an extraneous message that duplicates the diagnostic already 
> provided by `kzalloc' for a memory allocation failure in this function."

How much clarification can such a wording bring to the software situation
if the desired data structures might be still unclear for “the diagnostic”?


> or suchlike in v2 for me to apply a Reviewed-by: tag.

Are you interested in a safe description for a default Linux allocation
failure report?

How do you think about corresponding reference documentation
(besides source code)?

Regards,
Markus
