From: Bernd Petrovitsch <bernd@firmix.at>
Date: Thu, 12 Nov 2009 10:22:15 +0000
Subject: sizeof vs strlen (was Re: [PATCH 4/4] fs/qnx4: decrement sizeof
Message-Id: <1258021335.3689.41.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: al@alarsen.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2009-11-12 at 08:49 +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> As observed by Joe Perches, sizeof of a constant string includes the
> trailing 0.  If what is wanted is to check the initial characters of
> another string, this trailing 0 should not be taken into account.  If an
> exact match is wanted, strcmp should be used instead.
[...]
> strncmp(foo, abc, 
> - sizeof(abc)
> + sizeof(abc)-1
>  )
> // </smpl>
Am I the only one who find "strlen()" instead of "sizeof()-1" here much
more readable (and to the point).

As for run-time, it shouldn't make a difference for static/constant
strings as gcc should be able calculate the length at compile time. And
if the string is not constant, sizeof() is probably wrong anyways.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


