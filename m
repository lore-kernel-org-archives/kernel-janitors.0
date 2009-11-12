From: Anders Larsen <al@alarsen.net>
Date: Thu, 12 Nov 2009 09:25:18 +0000
Subject: Re: [PATCH 4/4] fs/qnx4: decrement sizeof size in strncmp
Message-Id: <1258017918l.26867l.0l@i-dmzi_al.realan.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk> (from
	julia@diku.dk on Thu Nov 12 08:49:44 2009)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2009-11-12 08:49:44, Julia Lawall wrote:
> As observed by Joe Perches, sizeof of a constant string includes the
> trailing 0.  If what is wanted is to check the initial characters of
> another string, this trailing 0 should not be taken into account.  If an
> exact match is wanted, strcmp should be used instead.

Good catch.
However, in this case an exact match (with the string ".bitmap") is what
is needed, so

NAK

Will you cook up a new patch changing strncmp to strcmp?

Cheers
Anders

