From: Lucas Tanure <tanure@linux.com>
Date: Wed, 10 Dec 2014 13:21:34 +0000
Subject: Re: List my Staging Drivers
Message-Id: <CAJyon0uUjeXWpaxmuOmMpvF8XOtGPU+aYSQ87w8PBbOn_pjTSw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAJyon0tny1BjTUDN3WF=cXAKQ5u6_jHUAfOuW6m7NzLsnxmGvQ@mail.gmail.com>
	<42976981.0zcCP3BMYl@mayhem>
	<CAK25hWMJJJ_ChunXcZEgbuo1EHQEPF+dWnp5CwXtxcz7=1QZWQ@mail.gmail.com>
	<CAJyon0u7J7x2+7syeEZUpwNHjemYO14Gp2LELcpm-dkrE3pEmA@mail.gmail.com>
	<CAJyon0vqHauxYxy0=efGr1Hpk6pE5mQUUTutDj5jMSf6u_Ysgw@mail.gmail.com>
	<72569.1418176247@turing-police.cc.vt.edu>
In-Reply-To: <72569.1418176247@turing-police.cc.vt.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Tue, Dec 9, 2014 at 11:50 PM,  <Valdis.Kletnieks@vt.edu> wrote:
> On Tue, 09 Dec 2014 22:18:48 -0200, Lucas Tanure said:
>
>> This command:
>>
>> $ lsmod  | grep -Eo '^[^ ]+' | sed 1d | xargs modinfo | grep filename
>
> Note that only finds stuff that's been built with CONFIG_FOOMOD=m,  Modules
> that were built into the kernel with =y won't show on an lsmod.  On my laptop
> at the moment:
>
> % lsmod | wc -l
> 34
> % ls /sys/module | wc -l
> 129
>
> Quite obviously, relying on lsmod isn't going to help.
>
> So you really want something like:
>
> % ls /sys/module | xargs modinfo 2> /dev/null | grep filename
> % echo the following are built-in; echo `ls /sys/module | xargs modinfo 2>&1 > /dev/null | awk '{print $4}'`
>
> The following *seems* to work.  I admit I haven't tested it against a distro kernel
> where the build/ and source/ symlinks may point different places, etc etc...
>
> find /lib/modules/`uname -r`/build/ `ls /sys/module | xargs modinfo 2>&1 > /dev/null | awk '{print " -name " $4".o -o"} END {print "-name null"}'`
>
> (And even the 129 entries in /sys/module doesn't cover the whole story.
>
> find /lib/modules/3.18.0-next-20141208/build/ -name '*.o' | wc -l
> 4257
> zgrep =y /proc/config.gz | wc -l
> 1072
>
> So there's *lots* more chunks of code that are builtin as options that
> simply don't identify as "modules".  At that point, it's time to re-ask
> what question you *really* wanted answered. "Find drivers that I'm using"
> is *not* the same thing as "what modules do I have"....
>
>


Hi,

I'm interested only in drivers that my machine uses, just because I can test it.
lsmod seems a good start.

In /sys/modules I can find more drivers to work too. With :

$ ls -l /sys/module/ | awk '{print $9}' | xargs modinfo > /dev/null

I can find drivers that are not modules. And for these I will need to
lookup for the source inside kernel.

Thanks

--
Lucas Tanure
+55 (19) 988176559
