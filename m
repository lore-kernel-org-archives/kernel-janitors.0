From: Chris Mason <chris.mason@oracle.com>
Date: Mon, 09 Feb 2009 14:50:26 +0000
Subject: Re: [PATCH 5/6] fs/btrfs/volumes.c: remove useless kzalloc
Message-Id: <1234191026.1262.1.camel@think.oraclecorp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082245250.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082245250.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2009-02-08 at 22:45 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The call to kzalloc is followed by a kmalloc whose result is stored in the
> same variable.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 

Now that is neat.  Thanks for the patch, I've queued it up here.

-chris


