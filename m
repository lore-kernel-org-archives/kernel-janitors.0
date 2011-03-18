From: Wim Van Sebroeck <wim@iguana.be>
Date: Fri, 18 Mar 2011 09:12:50 +0000
Subject: Re: [PATCH 1/2] drivers/watchdog/s3c2410_wdt.c: Convert
Message-Id: <20110318091250.GT1751@infomag.iguana.be>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1298738079-28893-1-git-send-email-julia@diku.dk>
	<002e01cbd72f$448ac150$cda043f0$%kim@samsung.com>
	<Pine.LNX.4.64.1102281110090.14560@pc-004.diku.dk>
	<20110318081140.GS1751@infomag.iguana.be>
	<Pine.LNX.4.64.1103180933590.2698@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1103180933590.2698@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Hi Julia,

> Actually, I later realized that one can also use the result of 
> request_mem_region in place of res.  Even though it is not the same 
> structure, it has the same start and end field information, which is the 
> only information that is used.  But I haven't had a chance to send a patch 
> that follows that strategy.  So if it is preferred to keep res, then that 
> can be done.

If you look at the driver then you will see that it will use wdt_base to control the device:
static void __iomem     *wdt_base;
...
res=platform_get_resource(pdev, IORESOURCE_MEM, 0);
...
wdt_base = ioremap(res->start, size);

So the memory resource is only used for:
1) requesting the memory region
2) ioremapping the memory so that we can use the registers.

My opinion: res can go out so that wdt_mem and wdt_irq get similar platform resource info.

Kind regards,
Wim.

