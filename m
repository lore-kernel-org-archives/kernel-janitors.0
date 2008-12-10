From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 10 Dec 2008 16:38:19 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <20081210163819.17cf4628@lxorguk.ukuu.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: dmitri.vorobiev@movial.fi, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 10 Dec 2008 17:26:26 +0100 (CET)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> The return value of the remove function of a driver structure, and thus of
> a platform_driver structure, is ultimately ignored

Currently

> and is thus unnecessary.

Really - capturing those kind of failures is useful information which is
currently discarded but could later be used. Removing that information
makes it very hard to go and put back into all the drivers.

Alan
