From: "Jaco Kroon" <jaco@kroon.co.za>
Date: Fri, 23 Feb 2007 05:39:17 +0000
Subject: Re: [KJ] Improve 'register_handler_proc()' and
Message-Id: <2673.192.168.0.30.1172209157.squirrel@hackerpages.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <004f01c752d7$2cca4c10$fa29145a@bureau>
In-Reply-To: <004f01c752d7$2cca4c10$fa29145a@bureau>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> On Sat, Feb 17, 2007 at 10:04:11PM +0100, Christophe Jaillet wrote:
>> In file /irq/proc.c, function 'register_handler_proc()' and
>> 'register_irq_proc()' memset a local variable 'name[MAX_NAMELEN]'
>>
>> I don't really see the point of this memset.
>>
>> In 'register_handler_proc()' :
>> > > > > > > > >
>>  char name [MAX_NAMELEN];
>>  [...]
>>  memset(name, 0, MAX_NAMELEN);
>>  snprintf(name, MAX_NAMELEN, "%s", action->name);
>>  [...] proc_mkdir(name, ...);
>> > > > > > > > >
>>
>> In 'register_handler_proc()' :
>> > > > > > > > >
>>  char name [MAX_NAMELEN];
>>  [...]
>>  memset(name, 0, MAX_NAMELEN);
>>  sprintf(name, "%d", irq);
>>  [...] proc_mkdir(name, ...);
>> > > > > > > > >
>>
>> Here are my remarks :
>>
>> 1) I think that both function should use 'snprintf', just to be sure.
>> Actualy only 'register_handler_proc()' does
>>
>> 2) I think that the memset are completely useless and could make s.o.
>> think that the 'name' variables are correctly cleanned and NULL
>> terminated. But,
>>       - In 'register_handler_proc()', the use of snprintf can lead to
>> name beeing not NULL terminated !

Hold up right there.  snprintf should _always_ NULL-terminate the
resulting string, strncpy, however, does not always NULL-terminate.  (Note
that this assumes that the kernel implementation of snprintf exhibits the
same behaviour as that described in the manpage of snprintf.)

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
