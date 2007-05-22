From: walter harms <wharms@bfs.de>
Date: Tue, 22 May 2007 14:25:45 +0000
Subject: Re: [KJ] what's the value of "NORET_TYPE"?
Message-Id: <4652FD69.6000607@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705211425310.25535@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

a quick grep -r looks promissing:

most times it is used like this:
kernel/exit.c:fastcall NORET_TYPE void do_exit(long code)

my favourite:
include/linux/kexec.h:extern NORET_TYPE void machine_kexec(struct kimage *image) ATTRIB_NORET;

since all defines do "" and i see no #IF  ...  --> s/NORET_TYPE//g

In some cases  it is used in place of ATTRIB_NORET
some janitor may like to  replace it

re,
 wh




Cripps wrote:
> Yeah, it looks to me like it was meant specifically to support old gcc
> versions on pre 2.x kernels, so it's mostly a safe bet to pull it out.
> Best way to double check would be to patch it, test with "make
> allyesconfig; make -k > /path/to/buildLog" and see if anything related
> to that Macro fails.
> Hope this helps some ;)
> 
> -Aaron Cripps
> 
> On 5/22/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>> On Tue, 22 May 2007, walter harms wrote:
>>
>> >
>> > i have a (wild) guess
>> > gcc supports an __attribute__ ((noreturn)). To make stuff compatible
>> sometime ago
>> > someone decided he will need it.
>> >
>> > IMHO remove it look like ancient
>> >
>> > see also: http://www.ussg.iu.edu/hypermail/linux/kernel/9605/1957.html
>>
>> oh, gcc *definitely* supports __attribute__((noreturn)), for which a
>> short form already exists in include/linux/compiler-gcc.h:
>>
>>   #define __noreturn                      __attribute__((noreturn))
>>
>> i'm just trying to figure out if there was a reason to still keep
>> NORET_TYPE around, perhaps because it was defined to represent
>> something subtlely different from __noreturn.  i'll wait for a couple
>> more opinions before i submit a patch to rip it out.  and maybe i'll
>> ask on the main LKML, where i'm sure i'll be set straight in short
>> order. :-)
>>
>> rday
>> -- 
>> ====================================
>> Robert P. J. Day
>> Linux Consulting, Training and Annoying Kernel Pedantry
>> Waterloo, Ontario, CANADA
>>
>> http://fsdev.net/wiki/index.php?title=Main_Page
>> ====================================
>> _______________________________________________
>> Kernel-janitors mailing list
>> Kernel-janitors@lists.linux-foundation.org
>> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
>>
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.linux-foundation.org
> https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
> 
> 
> 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
