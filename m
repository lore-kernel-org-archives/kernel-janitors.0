From: Jeff Garzik <jgarzik@pobox.com>
Date: Fri, 27 Jun 2008 05:33:30 +0000
Subject: Re: [PATCH] drivers/net/r6040.c: Eliminate double sizeof
Message-Id: <48647BAA.8060308@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806232311570.13402@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806232311570.13402@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: florian.fainelli@telecomint.eu, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Taking sizeof the result of sizeof is quite strange and does not seem to be
> what is wanted here.
> 
> This was fixed using the following semantic patch.
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> expression E;
> @@
> 
> - sizeof (
>   sizeof (E)
> - )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

applied


