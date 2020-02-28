From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date: Fri, 28 Feb 2020 11:45:44 +0000
Subject: Re: [PATCH -next] MIPS: pic32mzda: Drop pointless static qualifier
Message-Id: <20200228114544.GA10905@alpha.franken.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227070502.106762-1-yuehaibing@huawei.com>
In-Reply-To: <20200227070502.106762-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: ralf@linux-mips.org, paulburton@kernel.org, tglx@linutronix.de, sboyd@kernel.org, geert+renesas@glider.be, f4bug@amsat.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 27, 2020 at 07:05:02AM +0000, YueHaibing wrote:
> There is no need to have the 'struct device_node *node' variable static
> since new value always be assigned before use it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  arch/mips/pic32/pic32mzda/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
