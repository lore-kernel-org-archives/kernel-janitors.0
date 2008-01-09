From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 09 Jan 2008 13:17:33 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <4784C96D.5030805@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <20080109103459.GC16462@skl-net.de>
In-Reply-To: <20080109103459.GC16462@skl-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Noll <maan@systemlinux.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com

Andre Noll wrote:
> On 17:40, Andi Kleen wrote:
>  
>   
>> Here's a proposal for some useful code transformations the kernel janitors
>> could do as opposed to running checkpatch.pl.
>>     
>
> Here's my take on drivers/scsi/sg.c. It's only compile-tested on x86-64.
>   
... and x86 with all(yes|mod)config. :)

Would had preferred:

if (x) {
    result = -Exxxx;
    goto out;
}

then:

result = -Exxxx;
if (x)
    goto out;

but it looks correct.

cu,
Richard

