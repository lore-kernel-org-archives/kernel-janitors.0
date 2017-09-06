From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 06 Sep 2017 08:59:04 +0000
Subject: Re: [PATCH] HID: hid-lg: make array cbuf static const to shink object code size
Message-Id: <nycvar.YFH.7.76.1709061058560.4077@jbgna.fhfr.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825171250.23988-1-colin.king@canonical.com>
In-Reply-To: <20170825171250.23988-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 25 Aug 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate array cbuf on the stack, instead make it static.
> Makes the object code smaller by over 110 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   15096	   3504	    128	  18728	   4928	drivers/hid/hid-lg.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   14884	   3600	    128	  18612	   48b4	drivers/hid/hid-lg.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

