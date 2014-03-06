From: Peter Hurley <peter@hurleysoftware.com>
Date: Thu, 06 Mar 2014 19:08:41 +0000
Subject: Re: My Kernel bug is celebrating 2 years. Can you help me fix it?
Message-Id: <5318C7B9.8040408@hurleysoftware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDrTNtAHKsiBHz=W4=eJRO=m9EK_HZ7zLxb=4fg5riUQeg@mail.gmail.com>
	<CAErSpo4wdYDgTUTBDLimbviLh54C9ELXKfQ2y5qeUR1FKN8fpw@mail.gmail.com>
In-Reply-To: <CAErSpo4wdYDgTUTBDLimbviLh54C9ELXKfQ2y5qeUR1FKN8fpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On 03/06/2014 01:27 PM, Bjorn Helgaas wrote:
> [+cc Stoney, Yinghai, Suresh, Joerg, Jiang, Pavel, Rafael, linux-pm]
>
> Let's add some folks who know about x2apic and VT-d.  It's hard for
> people to magically pick stuff out of the LKML firehose :)
>
> On Tue, Mar 4, 2014 at 2:26 PM, Peter Senna Tschudin
> <peter.senna@gmail.com> wrote:
>> I have reported a bug more than two years ago and it is still
>> affecting me. The bug report gives some information:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?idx7299
>>
>> I have tried basic debug instructions from:
>> https://www.kernel.org/doc/Documentation/power/basic-pm-debugging.txt
>>
>> And everything works as expected when:
>> # echo freeze > /sys/power/state
>> # echo disk > /sys/power/state
>>
>> I have asked for help for fixing it:
>> https://lkml.org/lkml/2013/11/1/186
>>
>> But I don't have a serial port. How can I debug this issue without a
>> "real" serial port? Or what else can I try? How can I explore the hint
>> about the problem only happening with VT-d enabled in BIOS? How can I
>> explore the hint about the problem not happening if the option
>> nox2apic is passed to the Kernel?
>>
>> Thank you,
>>
>> Peter
>>
>> P.S Yes, it works on Windows.

Windows 7 doesn't use x2apic mode.
Windows 8 does and this same problem happened with this model: see
http://forums.toshiba.com/t5/Windows-8-8-1/Resume-from-standby-issue-on-R830-PT321A-01K002/td-p/330110

Seems like your model was recently added to Toshiba's Windows 8
compatibility list: http://support.toshiba-tie.co.jp/windows8/list_au.htm

Check for a more recent BIOS update that may fix this problem.

Regards,
Peter Hurley

PS - kernel bugs are better filed on the kernel bugzilla https://bugzilla.kernel.org/
