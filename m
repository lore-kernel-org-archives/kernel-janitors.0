From: Jan Glauber <Jan.Glauber@cavium.com>
Date: Mon, 15 Oct 2018 12:47:24 +0000
Subject: Re: [PATCH] EDAC, thunderx: memory leak in thunderx_l2c_threaded_isr()
Message-Id: <20181015124713.GA8017@hc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013102843.GG16086@mwanda>
In-Reply-To: <20181013102843.GG16086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sergey Temerkhanov <s.temerkhanov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Sat, Oct 13, 2018 at 02:28:04PM +0200, Borislav Petkov wrote:
> On Sat, Oct 13, 2018 at 01:28:43PM +0300, Dan Carpenter wrote:
> > I found this memory leak with static analysis, but it looks like it
> > might be pretty bad because it affects the success path.
> >
> > Fixes: 41003396f932 ("EDAC, thunderx: Add Cavium ThunderX EDAC driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > It's also possible that I have misread the code.  It seems like an
> > obvious fix but I haven't tested it.
> >
> >  drivers/edac/thunderx_edac.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Applied, thanks.
> 
> Jan, David, as a further cleanup, you could consider moving that
> allocation out of the ISR...

[-David who left Cavium]

Hi Boris,

the allocations happen only in the threaded function handlers, not in
hard IRQ context, is that still an issue?

thanks,
Jan
