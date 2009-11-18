From: Joe Perches <joe@perches.com>
Date: Wed, 18 Nov 2009 18:40:15 +0000
Subject: Re: [PATCH 1/16] drivers/net/atl1c: remove exceptional & on
Message-Id: <1258569615.24178.13.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911181920010.20943@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911181920010.20943@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, atl1-devel@lists.sourceforge.net, Jie Yang <jie.yang@atheros.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de

On Wed, 2009-11-18 at 19:20 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> In this file, function names are otherwise used as pointers without &.
> 
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)

Hi Julia, thanks for doing this.

Can you please post the complete version of the semantic patch?

