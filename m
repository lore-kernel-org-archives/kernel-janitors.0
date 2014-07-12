From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 01:34:44 +0000
Subject: Re: [PATCH] reformat_with_checkpatch: Add automation to checkpatch
Message-Id: <20140712013444.GA30368@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
In-Reply-To: <1405128087.6751.12.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 06:21:27PM -0700, Joe Perches wrote:
> A simple script to run checkpatch --fix for various types of
> of cleanups.
> 
> This script is useful primarily for staging.
> 
> This reformats code to a more CodingStyle conforming style,
> compiles it, verifies that the object code hasn't changed,
> and git commits it too.

And 'git commits' it?  Heh, I should just run this myself to clean up
staging and beat everyone else to it...

I know some people already have private versions of these things, might
as well make it public for all to abuse :)

thanks,

greg k-h
