From: Julia Lawall <julia@diku.dk>
Date: Thu, 12 Nov 2009 10:05:38 +0000
Subject: Re: [PATCH 4/4] fs/qnx4: decrement sizeof size in strncmp
Message-Id: <Pine.LNX.4.64.0911121105310.19166@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
 <1258017918l.26867l.0l@i-dmzi_al.realan.de>
In-Reply-To: <1258017918l.26867l.0l@i-dmzi_al.realan.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Larsen <al@alarsen.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 12 Nov 2009, Anders Larsen wrote:

> On 2009-11-12 08:49:44, Julia Lawall wrote:
> > As observed by Joe Perches, sizeof of a constant string includes the
> > trailing 0.  If what is wanted is to check the initial characters of
> > another string, this trailing 0 should not be taken into account.  If an
> > exact match is wanted, strcmp should be used instead.
> 
> Good catch.
> However, in this case an exact match (with the string ".bitmap") is what
> is needed, so
> 
> NAK
> 
> Will you cook up a new patch changing strncmp to strcmp?

Sure.

julia
