From: Tejun Heo <tj@kernel.org>
Date: Tue, 19 Sep 2017 18:54:04 +0000
Subject: Re: [PATCH][V3] libata: make static arrays const, reduces object code size
Message-Id: <20170919185404.GA828415@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170919083952.5648-1-colin.king@canonical.com>
In-Reply-To: <20170919083952.5648-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Sep 19, 2017 at 09:39:52AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrayis on the stack, instead make them static.
> Makes the object code smaller by over 260 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   64864	   5948	   4128	  74940	  124bc	drivers/ata/libata-scsi.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   64183	   6364	   4128	  74675	  123b3	drivers/ata/libata-scsi.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to libata/for-4.15.

Thanks.

-- 
tejun
