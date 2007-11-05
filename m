From: Paul Mundt <lethal@linux-sh.org>
Date: Mon, 05 Nov 2007 21:22:31 +0000
Subject: Re: [PATCH 08/12] arch/sh: Remove duplicate includes.
Message-Id: <20071105212231.GA31411@linux-sh.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <472F79C4.5090301@gmail.com>
In-Reply-To: <472F79C4.5090301@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Nov 06, 2007 at 07:15:00AM +1100, Lucas Woods wrote:
> 
> Signed-off-by: Lucas Woods <woodzy@gmail.com>
> ---
>  arch/sh/boards/renesas/sh7710voipgw/setup.c |    1 -
>  arch/sh/boards/se/7206/irq.c                |    1 -
>  arch/sh/kernel/irq.c                        |    1 -
>  arch/sh64/kernel/process.c                  |    1 -
>  arch/sh64/kernel/traps.c                    |    2 --
>  5 files changed, 0 insertions(+), 6 deletions(-)
> 
Already did the same fix earlier today, thanks anyways!
