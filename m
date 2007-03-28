From: "Guanqun Lu" <guanqun.lu@gmail.com>
Date: Wed, 28 Mar 2007 08:28:29 +0000
Subject: Re: [KJ] What do "#if 1" and "#if 0" do?
Message-Id: <e57070790703280128o52bf56a1pbd4f58f8aba8d5b5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
In-Reply-To: <e57070790703280024t4df3694cu8babcd12053779eb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 3/28/07, Cong WANG <xiyou.wangcong@gmail.com> wrote:
> 2007/3/28, Guanqun Lu <guanqun.lu@gmail.com>:
> > On 3/28/07, Cong WANG <xiyou.wangcong@gmail.com> wrote:
> > > 2007/3/28, Guanqun Lu <guanqun.lu@gmail.com>:
> > > Maybe for debugging. ;-p
>
> That's another way. ;-p
>
> Consider that you are programming for a large project, such as linux
> kernel. Makefiles are already well written. If you want to add -DDEBUG
> to gcc, you must modify the corresponding makefile. But if you use
> '#if 0' for debugging, you can modify the code, change '#if 0' to '#if
> 1', to do debugging.
>
>
> --
> So Dark The Con Of Man.
>
Oh... I see the point.

Thanks a lot, wang and Yoann.

-- 
Guanqun
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
