From: Emil Goode <emilgoode@gmail.com>
Date: Mon, 23 Apr 2012 18:17:45 +0000
Subject: Re: [PATCH] staging: android: binder: fix some sparse warnings and long lines
Message-Id: <1335205065.2570.10.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1335201824-17879-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1335201824-17879-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan,

Sorry will look at it again and send another patch, perhaps tomorrow.

Thanks for catching my mistakes!

Best regards,
Emil Goode

On Mon, 2012-04-23 at 20:57 +0300, Dan Carpenter wrote:
> On Mon, Apr 23, 2012 at 07:23:44PM +0200, Emil Goode wrote:
> > This patch silences some sparse warnings and adds some line breaks
> > to take the 80 char limit coding style rule in consideration.
> > 
> 
> Don't mix long line changes and sparse changes.
> 
> You missed some fp->binder casts so there are still Sparse warnings.
> Anyway, these sparse annotations should probably go into the
> struct binder_node definition in the .h file instead of always
> casting.  (I haven't verified.  So be careful).
> 
> Don't forget to get to run your patches through checkpatch.pl before
> sending them.  (There are whitespace problems in your patch).
> 
> regards,
> dan carpenter
> 


