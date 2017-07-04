From: Dou Liyang <douly.fnst@cn.fujitsu.com>
Date: Tue, 04 Jul 2017 07:29:20 +0000
Subject: Re: [PATCH] x86/platform/uv/BAU: minor cleanup, make some local functions static
Message-Id: <7bc9c995-df1e-7b0f-4431-a0ae53080afe@cn.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170703142258.18240-1-colin.king@canonical.com>
 <86c2556c-cc0e-b221-b81e-4433b61f0f82@cn.fujitsu.com>
 <alpine.DEB.2.20.1707040918070.9000@nanos>
In-Reply-To: <alpine.DEB.2.20.1707040918070.9000@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Colin King <colin.king@canonical.com>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <sivanich@sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Thomas,

At 07/04/2017 03:19 PM, Thomas Gleixner wrote:
> On Tue, 4 Jul 2017, Dou Liyang wrote:
>> At 07/03/2017 10:22 PM, Colin King wrote:
>>> -int normal_busy(struct bau_control *bcp)
>>> +static int normal_busy(struct bau_control *bcp)
>>
>> In my opinion, there is no need to mark *normal_busy* static, remove it
>> directly.
>>
>> the commit c5d35d399e68(x86/UV2: Work around BAU bug) add it to
>> handle_uv2_busy(), but the handle_uv2_busy() is rewritten now. the
>> normal_busy is unused, can be remove.
>
> Correct.
>
>> By the way, there are also an other function named
>> uv_bau_message_interrupt() can be remove.
>
> Not so much.
>
> # git grep uv_bau_message_interrupt arch/x86/
> arch/x86/entry/entry_64.S:apicinterrupt3 UV_BAU_MESSAGE                 uv_bau_message_intr1            uv_bau_message_interrupt
> arch/x86/platform/uv/tlb_uv.c:void uv_bau_message_interrupt(struct pt_regs *regs)
>

Oops, Indeed! you are right. ;)

Thanks,

	dou.

> Thanks,
>
> 	tglx
>
>
>
>
>


