From: Borislav Petkov <bp@alien8.de>
Date: Mon, 15 Oct 2018 13:01:25 +0000
Subject: Re: [PATCH] EDAC, thunderx: memory leak in thunderx_l2c_threaded_isr()
Message-Id: <20181015130125.GC11434@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181013102843.GG16086@mwanda>
In-Reply-To: <20181013102843.GG16086@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Glauber <Jan.Glauber@cavium.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sergey Temerkhanov <s.temerkhanov@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi,

On Mon, Oct 15, 2018 at 12:47:24PM +0000, Jan Glauber wrote:
> the allocations happen only in the threaded function handlers, not in
> hard IRQ context, is that still an issue?

Nah, I take that back. I'm being told you can do almost everything in
threaded handler context! :-)

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
