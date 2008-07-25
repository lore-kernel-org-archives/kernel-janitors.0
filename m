From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 25 Jul 2008 21:28:20 +0000
Subject: Re: [PATCH] fs/suse/inode.c: Add missing fuse_request_alloc
Message-Id: <E1KMUpo-0007h4-P8@pomaz-ex.szeredi.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0807252131280.1602@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0807252131280.1602@ask.diku.dk> (message from
	Julia Lawall on Fri, 25 Jul 2008 21:33:25 +0200 (CEST))
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: miklos@szeredi.hu, fuse-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 25 Jul 2008, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The error handling code for the second call to fuse_request_alloc should
> include freeing the result of the first one.

Thanks, queued for 2.6.27.

Miklos
