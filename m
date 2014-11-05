From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 05 Nov 2014 09:14:37 +0000
Subject: Re: How to access Linux Kernel environment Variables ?
Message-Id: <CAFLxGvywuEox+2fYZ-+ZLop=Za7Kum8P+q1kHx3cFWF2nG6O5A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAOD=uF4L+jvR=ckMdo3o4wdSsRcGynQnv_KOpDeyJst74YOxuA@mail.gmail.com>
In-Reply-To: <CAOD=uF4L+jvR=ckMdo3o4wdSsRcGynQnv_KOpDeyJst74YOxuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh prasad nayak <santoshprasadnayak@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Nov 5, 2014 at 9:03 AM, santosh prasad nayak
<santoshprasadnayak@gmail.com> wrote:
> Hi all,
>
> Is there any system call in Linux which serve the purpose of  "kenv()"
> of FreeBSD ?
>
>
> In FreeBSD:
> -----------------
> Kernel environment variables are saved at "/boot/loader.conf"  and
> those variables can be accessed using "kenv()"  system call in C
> program.
> ----------------
>
>
> Is there any similar functionality available in Linux kernel ?

/proc/cmdline?

-- 
Thanks,
//richard
