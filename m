From: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Nov 2014 11:18:40 +0000
Subject: Re: How to access Linux Kernel environment Variables ?
Message-Id: <545A0790.2050302@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOD=uF4L+jvR=ckMdo3o4wdSsRcGynQnv_KOpDeyJst74YOxuA@mail.gmail.com>	<CAFLxGvywuEox+2fYZ-+ZLop=Za7Kum8P+q1kHx3cFWF2nG6O5A@mail.gmail.com> <CAOD=uF6oBZ0cmNH4Jf9Hs4ZU3Y4WO-wfvc4k0b7Ezpo63S7Dag@mail.gmail.com>
In-Reply-To: <CAOD=uF6oBZ0cmNH4Jf9Hs4ZU3Y4WO-wfvc4k0b7Ezpo63S7Dag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Am 05.11.2014 um 11:56 schrieb santosh nayak:
> Thanks Richard for your response.
> 
> Is there any system call in Linux which can access and set variables
> in /proc/cmdline ?  (Similar to kenv() in FreeBSD which can access and
> set variables in /boot/loader.conf).

No.

> I would like to use that system call in linux C code, the  way I am
> using kenv() in freeBSD environment.

Create a wrapper function which behaves like kenv().
Should be doable in a few lines of code.

Thanks,
//richard
