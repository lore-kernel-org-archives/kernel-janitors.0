From: Borislav Petkov <bp@alien8.de>
Date: Sat, 13 Oct 2018 12:28:04 +0000
Subject: Re: [PATCH] EDAC, thunderx: memory leak in thunderx_l2c_threaded_isr()
Message-Id: <20181013122804.GB31650@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013102843.GG16086@mwanda>
In-Reply-To: <20181013102843.GG16086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Daney <david.daney@cavium.com>, Sergey Temerkhanov <s.temerkhanov@gmail.com>, Jan Glauber <jglauber@cavium.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Oct 13, 2018 at 01:28:43PM +0300, Dan Carpenter wrote:
> I found this memory leak with static analysis, but it looks like it
> might be pretty bad because it affects the success path.
> 
> Fixes: 41003396f932 ("EDAC, thunderx: Add Cavium ThunderX EDAC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> It's also possible that I have misread the code.  It seems like an
> obvious fix but I haven't tested it.
> 
>  drivers/edac/thunderx_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Jan, David, as a further cleanup, you could consider moving that
allocation out of the ISR...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
