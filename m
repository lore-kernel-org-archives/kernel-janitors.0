From: Chen Gang <gang.chen@asianux.com>
Date: Mon, 27 May 2013 09:06:11 +0000
Subject: Re: [PATCH] arch: s390: appldata: using strncpy() instead of sprintf()
Message-Id: <51A32203.1090003@asianux.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A2CC07.5010100@asianux.com> <CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
In-Reply-To: <CAMuHMdXTW3QOxfAfqQXdbSpP4R83srFf7eMfu5fA-75S_Mujsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, jang@linux.vnet.ibm.com, linux390@de.ibm.com, linux-s390@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 05/27/2013 04:34 PM, Geert Uytterhoeven wrote:
>> Signed-off-by: Chen Gang <gang.chen@asianux.com>
>> > ---
>> >  arch/s390/appldata/appldata_base.c |    5 +++--
>> >  1 files changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/s390/appldata/appldata_base.c b/arch/s390/appldata/appldata_base.c
>> > index bae0f40..566ea87 100644
>> > --- a/arch/s390/appldata/appldata_base.c
>> > +++ b/arch/s390/appldata/appldata_base.c
>> > @@ -212,7 +212,8 @@ appldata_timer_handler(ctl_table *ctl, int write,
>> >                 return 0;
>> >         }
>> >         if (!write) {
>> > -               len = sprintf(buf, appldata_timer_active ? "1\n" : "0\n");
> Before, len was always 2. The string was zero-terminated but the zero was
> not returned to user space, which is OK.
> 

I guess, the original API did not treat it as a zero-terminated string,
it is more like a 'protocol' contents for 'write' or '!write' between
kernel mode and user mode.

At least the kernel did not treat it as a zero-terminated string, we can
reference the '!write' work flow to know about it.


>> > +               len = strncpy(buf, appldata_timer_active ? "1\n" : "0\n",
>> > +                                                               sizeof(buf));
> Oops, strncpy() doesn't return a size, but a pointer! So this doesn't work.
> I guess you haven't compiled this?
> http://kernel.org/pub/tools/crosstool/files/bin/
> 

Oh, it is my fault, I need compile it for a basic checking.

>> >                 if (len > *lenp)
>> >                         len = *lenp;
>> >                 if (copy_to_user(buffer, buf, len))
> What about creating a "uprintf()" that formats strings to a userspace buffer?
> 

Hmm... maybe it is a good idea for processing the zero-terminated string
from kernel mode to user mode, but I guess, for our case, it is not a
zero-terminated string, so...


All together, thank you very much for your checking, I should send patch v2.


Thanks.
-- 
Chen Gang

Asianux Corporation
