From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Mon, 11 Dec 2017 13:17:05 +0000
Subject: Re: [PATCH] TC: Delete an error message for a failed memory allocation in tc_bus_add_devices()
Message-Id: <alpine.LFD.2.21.1712110244450.4266@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bfb63956-346c-aa17-5b06-fbe19ff0a5e3@users.sourceforge.net>         <alpine.LFD.2.21.1712102140570.4266@eddie.linux-mips.org> <1512957931.26342.31.camel@perches.com>
In-Reply-To: <1512957931.26342.31.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-mips@linux-mips.org, =?UTF-8?Q?Ralf_B=C3=A4chle?= <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, 10 Dec 2017, Joe Perches wrote:

> > > Omit an extra message for a memory allocation failure in this function.
> > > 
> > > This issue was detected by using the Coccinelle software.
> > 
> >  And the problem here is?
> 
> Markus' terrible commit messages.
> 
> Generically, any OOM via a malloc like call has a dump_stack()
> which shows a stack trace unless __GFP_NOWARN is used.
> 
> So this message is generally unnecessary as the dump_stack()
> will show the tc_bus_add_devices function name and (now hashed)
> value of the function address.

 Fair enough.

> What will be different is the particular slot # of the tc_dev
> will no longer be shown.
> 
> Really though, if there's an OOM on the init, there are larger
> problems and the system will be unusable.

 Well, the problem may well be the caller doing something silly, so we do 
want to have it identified, hence the extra message.  Given that, as you 
say, `kzalloc' already provides the necessary diagnostic I agree the 
message can go.

 However I would indeed prefer that a commit description is at least 
exhaustive enough for such a dumb reviewer as I am to understand what is 
going on right away.  So please make it say at least:

"Remove an extraneous message that duplicates the diagnostic already 
provided by `kzalloc' for a memory allocation failure in this function."

or suchlike in v2 for me to apply a Reviewed-by: tag.

 Thanks,

  Maciej
