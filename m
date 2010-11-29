From: Dan Carpenter <error27@gmail.com>
Date: Mon, 29 Nov 2010 12:59:06 +0000
Subject: Re: Tasks to do
Message-Id: <20101129125906.GE30799@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4CF31519.5030404@gmail.com>
In-Reply-To: <4CF31519.5030404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 29, 2010 at 12:51:05AM -0200, Jorge Merlino wrote:
> Hi all	
> 
> I'm interested in helping with the deveopment of the linux kernel and
> found this mailing list. I saw a few related todo lists but all of them
> seem quite old.
> I'd like to know where do I look for some task to do and if I neet to
> tell anybody I'm working on that in order to prevent duplication of work.
> 

There isn't a list.

One easy place to start is if you have any hardware which uses a driver 
from staging.  Just send your patches against linux-next and you won't
conflict with anyone.

Maybe pick a driver and do this:
1) Fix all the white space.
2) Use sparse and figure out what can be declared as static.
2a) Make sparse not complain.
3) Fix all the messed up naming for static functions and data.
4) Check that it always returns the correct error codes on failure.
5) Use ARRAY_SIZE() through out.
6) Use the kernel min()/max() macros.
7) Break up any really long functions into smaller functions.
8) Etc.

But it really helps if you have the hardware and can test these changes.

regards,
dan carpenter

