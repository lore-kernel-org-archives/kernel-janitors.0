From: Paul Burton <paulburton@kernel.org>
Date: Thu, 09 Jan 2020 18:52:49 +0000
Subject: Re: [PATCH -next] MIPS: Loongson2ef: drop pointless static qualifier in  loongson_suspend_enter()
Message-Id: <5e177682.1c69fb81.b79ec.61f3@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204010851.160284-1-maowenan@huawei.com>
In-Reply-To: <20191204010851.160284-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: jiaxun.yang@flygoat.com, ralf@linux-mips.org, paulburton@kernel.org, jhogan@kernel.org, gregkh@linuxfoundation.org, tglx@linutronix.de

Hello,

Mao Wenan wrote:
> There is no need to have the 'T *v' variable static
> since new value always be assigned before use it.

Applied to mips-next.

> commit 11d06df7b9f2
> https://git.kernel.org/mips/c/11d06df7b9f2
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
