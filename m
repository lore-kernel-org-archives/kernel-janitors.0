From: Andrey Utkin <andrey_utkin@fastmail.com>
Date: Tue, 11 Jul 2017 17:54:32 +0000
Subject: Re: [PATCH] [media] solo6x10: make const array saa7128_regs_ntsc static
Message-Id: <20170711175432.GA6230@dell-m4800>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710185103.18461-1-colin.king@canonical.com>
In-Reply-To: <20170710185103.18461-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Anton Sviridenko <anton@corp.bluecherry.net>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 10, 2017 at 07:51:03PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const array saa7128_regs_ntsc on the stack but insteaed make
> it static.  Makes the object code smaller and saves nearly 840 bytes
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    9218	    360	      0	   9578	   256a	solo6x10-tw28.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    8237	    504	      0	   8741	   2225	solo6x10-tw28.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Andrey Utkin <andrey_utkin@fastmail.com>
