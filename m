From: Joe Perches <joe@perches.com>
Date: Fri, 27 Jan 2012 07:38:10 +0000
Subject: Re: [PATCH next V2] drivers: Use NULL not zero pointer assignments
Message-Id: <1327649890.12089.20.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120126061330.GA15856@elgon.mountain>
	 <1327559803.28707.6.camel@joe2Laptop> <1327642391.4846.36.camel@joe2Laptop>
	 <4F22421A.5020501@gmail.com>
In-Reply-To: <4F22421A.5020501@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Mallon <rmallon@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2012-01-27 at 17:20 +1100, Ryan Mallon wrote:
> On 27/01/12 16:33, Joe Perches wrote:
> > Using NULL pointer assignments is more kernel-style standard.
> > Uncompiled, untested.
> > Done via cocinelle script:
> > @@
> > type T;
> > T *pointer;
> > @@
> > -pointer = 0
> > +pointer = NULL
> Hi Joe,

Hi Ryan.

> I think you can drop a lot of the initialisations completely rather than
> convert them. I've pointed some out below. I'm just scanning through for
> likely candidates and I didn't bother looking at the staging drivers, so
> this list is not comprehensive.

I'll try a more generic solution.
Here's a possible cocci script that looks for declarations with
initializations that are later overwritten.
$ cat multi_set.cocci
@@
type T;
identifier x;
expression y;
expression z;
@@
-T x = y;
+T x;
...
x = z
$

This script has a defect because expression z may
use identifier x.

Anyway, if the script can be tweaked appropriately,
it might be useful to remove these unnecessary
initializations.

cheers, Joe

