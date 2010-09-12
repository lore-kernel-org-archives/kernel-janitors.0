From: Dan Carpenter <error27@gmail.com>
Date: Sun, 12 Sep 2010 20:52:49 +0000
Subject: Re: [PATCH] staging: keucr: check kmalloc() return value
Message-Id: <20100912205248.GE25351@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317808-4850-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317808-4850-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Al Cho <acho@novell.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 12, 2010 at 10:56:43PM +0400, Vasiliy Kulikov wrote:
> kmalloc() may fail, if so return error code.
> Also don't alloc 16 bytes from the heap, use stack instead.

I don't have ENE_SendScsiCmd() in my repo, but I think it's a DMA
function.  You're not supposed to use stack memory for DMA transfers.
This is documented in:  Documentation/DMA-API-HOWTO.txt

So the original code is correct here (except that there is no error
handling).

regards,
dan carpenter


