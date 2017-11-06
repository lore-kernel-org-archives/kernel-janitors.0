From: Samuel Ortiz <sameo@linux.intel.com>
Date: Mon, 06 Nov 2017 00:03:43 +0000
Subject: Re: [PATCH] nfc: s3fwrn5: make array match static const, reduces object code size
Message-Id: <20171106000343.GC27831@zurbaran.ger.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919142515.23196-1-colin.king@canonical.com>
In-Reply-To: <20170919142515.23196-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>, Krzysztof Opasiak <k.opasiak@samsung.com>, linux-nfc@lists.01.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Tue, Sep 19, 2017 at 03:25:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the read-only array match on the stack, instead make
> it static const.  Makes the object code smaller by over 310 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    8304	   1084	    128	   9516	   252c	drivers/nfc/s3fwrn5/firmware.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    7894	   1180	    128	   9202	   23f2	drivers/nfc/s3fwrn5/firmware.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/nfc/s3fwrn5/firmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
Applied to nfc-next, thanks.

Cheers,
Samuel.
