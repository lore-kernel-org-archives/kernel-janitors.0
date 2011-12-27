From: Oliver Neukum <oliver@neukum.org>
Date: Tue, 27 Dec 2011 21:56:39 +0000
Subject: Re: [PATCH] drivers/usb/class/cdc-acm.c: clear dangling pointer
Message-Id: <201112272256.39617.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324645375-3535-1-git-send-email-julia@diku.dk>
In-Reply-To: <1324645375-3535-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Oliver Neukum <oliver@neukum.name>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Am Freitag, 23. Dezember 2011, 14:02:55 schrieb Julia Lawall:
> From: Julia Lawall <julia@diku.dk>
> 
> On some failures, the country_code field of an acm structure is freed
> without freeing the acm structure itself.  Elsewhere, operations including
> memcpy and kfree are performed on the country_code field.  The patch sets
> the country_code field to NULL when it is freed, and likewise sets the
> country_code_size field to 0.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by: Oliver NEukum <oneukum@suse.de>

This is in principle oopsable and should go into stable.

	Regards
		Oliver
