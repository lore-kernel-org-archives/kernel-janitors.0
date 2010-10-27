From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Oct 2010 08:11:21 +0000
Subject: Re: [PATCH 8/14] drivers/platform/x86/thinkpad_acpi.c: delete
Message-Id: <20101027081121.GC6062@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk> <1288088743-3725-9-git-send-email-julia@diku.dk> <20101027010908.GA29299@khazad-dum.debian.net> <4CC7D238.9010903@bfs.de>
In-Reply-To: <4CC7D238.9010903@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 27, 2010 at 09:18:16AM +0200, walter harms wrote:
> 
> IMHO that goes beyond what to expect from a kernel janitor.

No way!  Of course, we don't mindlessly remove the second assign without
trying to figure out if maybe something else was intended.  Frankly, I
was a little offended by idea that we'd do that.

Of course, we do make mistakes, but they're _honest_ mistakes.

regards,
dan carpenter

