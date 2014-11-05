From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Wed, 05 Nov 2014 10:56:52 +0000
Subject: Re: How to access Linux Kernel environment Variables ?
Message-Id: <CAOD=uF6oBZ0cmNH4Jf9Hs4ZU3Y4WO-wfvc4k0b7Ezpo63S7Dag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOD=uF4L+jvR=ckMdo3o4wdSsRcGynQnv_KOpDeyJst74YOxuA@mail.gmail.com>
	<CAFLxGvywuEox+2fYZ-+ZLop=Za7Kum8P+q1kHx3cFWF2nG6O5A@mail.gmail.com>
In-Reply-To: <CAFLxGvywuEox+2fYZ-+ZLop=Za7Kum8P+q1kHx3cFWF2nG6O5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Thanks Richard for your response.

Is there any system call in Linux which can access and set variables
in /proc/cmdline ?  (Similar to kenv() in FreeBSD which can access and
set variables in /boot/loader.conf).

I would like to use that system call in linux C code, the  way I am
using kenv() in freeBSD environment.

Regards
Santosh

On Wed, Nov 5, 2014 at 2:44 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Wed, Nov 5, 2014 at 9:03 AM, santosh prasad nayak
> <santoshprasadnayak@gmail.com> wrote:
>> Hi all,
>>
>> Is there any system call in Linux which serve the purpose of  "kenv()"
>> of FreeBSD ?
>>
>>
>> In FreeBSD:
>> -----------------
>> Kernel environment variables are saved at "/boot/loader.conf"  and
>> those variables can be accessed using "kenv()"  system call in C
>> program.
>> ----------------
>>
>>
>> Is there any similar functionality available in Linux kernel ?
>
> /proc/cmdline?
>
> --
> Thanks,
> //richard
