From: "A Povolotsky" <pevnev@juno.com>
Date: Sat, 04 Sep 2004 16:34:44 +0000
Subject: Cerberus Test Control System on Linux 2.6 executing on PowerPC platfor
Message-Id: <20040904.093529.2741.672150@webmail17.lax.untd.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi - 

does any one on this list has the source code for Cerberus Test Control System on Linux 2.6 runnable on PowerPC platform ?

Thanks,
Alex

---------- Forwarded Message ----------
Alex,
We ran it last year on IBM Power system, PPC64 machine .  We had to make a few minor changes, mainly for where it checks the hardware it is running on. Sorry, we can't even find the changes we made.  We did report it to the maintainer but never heard anything back from the person.  The machine was a standard IBM p630. The hard drive would have
been under 14G.

Hope that is helpful
Stephanie

Linux Technology Center
 IBM, 11400 Burnet Road, Austin, TX  78758
 Phone: (512) 838-9284   T/L: 678-9284  Fax: (512) 838-3882
 E-Mail: sglass@us.ibm.com
09/01/2004 09:22 PM
Stephanie Glass/Austin/IBM@IBMUS    
Subject: Cerberus Test Control System on Linux 2.6 on PPC platform ?
 
A Povolotsky wrote:
                                     
Hi Stefanie,

We want to repeat on Linux 2.6 what Red Hat's Clark Williams did
for Linux 2.4 (" Improving Linux Scheduler Latency" white-paper)
using Cerberus Test Control System ...
But we want to run Cerberus Test Control System on Power PC platform ...
Could you share your opinion whether it is feasible and if yes how to
approach it - did anyone at IBM tried it on PPC running Linux 2.6 ?

Thanks,
Will appreciate your reply,
Best Regards,
Alex
---------- Forwarded Message ----------
Sam Flory  <sflory@rackable.com> wrote:

A Povolotsky wrote:
> Hi Sam,
>
>Jason deferred some answers to you - could you please reply and help?

>>
>>1. Could I cross-compile for MPC8270 (PPC diskless embedded board)
>>Cerberus Test Control System on Wintel's "Windows XP" using Cygwin
>
>
> Cross-compilation to any (linux) target should be possible, but the
>current Makefile structure is not cross-compile friendly.  Cerberus >was originally developed on a x86 machine but some time ago I did put >some work in on making the system run under Linux/PPC.  So you won't >be starting from scratch in this area at least.
>
> I should note that cross-compilation is rarely necessary as the CTCS
>default burn script requires so many binaries that you will be able to
>build it natively by the time you install all the prerequisites (see
>below).
>

   A couple things need to be complied.  The only really important one
is memtst. Things like crashme aren't very portable.  And burncpu is x86
only.

>
>>2. Could I run Cerberus Test Control System on Linux 2,6.8-rc4
>>(vanilla free) s/w distribution) ? (did any one tried Cerberus Test
>>Control System for Linux 2,6 ?).
>
>
> I have not attempted to run Cerberus with this particular
> connfiguration,
> perhaps Sam can give some input on this.

   It seems to work under Suse 9.1, and Fedora 2.

>
>
>>What other functionality and packages I need to have
>>cross-compiled/loaded/running on my MPC8270 (PPC diskless embedded
>>to act as board)? DoI need to use another computer (since my board is >>diskless) host/fileserver ? - I only have laptop running
>>Wintel's "Windows XP" (which I also HAVE TO use for cross-compiling as
>>mentioned above in 1.).
>
>
> I have not attempted to run Cerberus with this particular
> configuration.
> You will need a fileserver with various utilities mountable via NFS, > as well as a free scratch area for compiling kernels.  CTCS includes a
> "check-requirements" script that you can run.  This program will
> indicate missing packages that you may need, although it may not be
>exhaustive.  (For example, gcc also requires various programs in the
>binutils package, but the binutils requirement isn't listed since it
>assumes that if you have gcc working, you have binutils).  Among other
>things, you will need perl, bash, gcc (native), and binutils (native).
>

   It's been a while since I tried it on my ibook.  I've got no
experience with embedded PPC chipsets.

>
>
>>3. I want to repeat on Linux 2.6 what Red Hat's Clark Williams did
>>for Linux 2.4 (" Improving Linux Scheduler Latency"  ... In this
>>whitepaper on Linux Scheduler Latency, Clark Williams of Red Hat Inc. >>compares the performance of two popular ways to improve kernel Linux >
>>preemption latency -- the preemption >>patch pioneered by MontaVista >>and the low-latency patch pioneered by Ingo Molnar -- and discovers >>that the best approach might be a combination of both).
>>http://www.linuxdevices.com/articles/AT8906594941.html
>>Any opinion on that ?
>
>
> I would check the relevant kernel programming resources on this topic.
>

   This is one of those you're going to have to test for what you are
doing.  I've not done much in the embedded space and the default 2.6 is
good enough for my usage.

> (My comments are my own, not my employer's)
>

Uhh yeah me too;-)

--
Sam Flory  <sflory@rackable.com>




________________________________________________________________
Get your name as your email address.
Includes spam protection, 1GB storage, no ads and more
Only $1.99/ month - visit http://www.mysite.com/name today!


-------------------------------------------------------
This SF.Net email is sponsored by BEA Weblogic Workshop
FREE Java Enterprise J2EE developer tools!
Get your free copy of BEA WebLogic Workshop 8.1 today.
http://ads.osdn.com/?ad_idP47&alloc_id808&op=click
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
