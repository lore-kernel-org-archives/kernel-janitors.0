From: Greg KH <gregkh@linuxfoundation.org>
Date: Sat, 12 Jul 2014 02:23:29 +0000
Subject: Re: [PATCH] checkpatch: Remove unnecessary + after {8,8}
Message-Id: <20140712022329.GA29482@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405128087.6751.12.camel@joe-AO725>
	<20140712013927.GA30781@kroah.com>
	<1405129612.6751.24.camel@joe-AO725>
	<20140712020114.GA12301@kroah.com>
	<20140712020520.GA18611@kroah.com>
	<1405130970.6751.37.camel@joe-AO725>
In-Reply-To: <1405130970.6751.37.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Fri, Jul 11, 2014 at 07:09:30PM -0700, Joe Perches wrote:
> There's a useless "+" use that needs to be removed as perl 5.20
> emits a "Useless use of greediness modifier '+'" message each
> time it's hit.
> 
> Reported-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> On Fri, 2014-07-11 at 19:05 -0700, Greg KH wrote:
> > Ok, with linux-next I get the same thing:
> 
> Thanks Greg.

Very nice, thanks for this:

Tested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
