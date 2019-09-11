From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Sep 2019 14:46:12 +0000
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-Id: <20190911144312.GL15977@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
 <20190911142543.GA9873@SARKAR>
In-Reply-To: <20190911142543.GA9873@SARKAR>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, Dominic Braun <inf.braun@fau.de>, linux-rpi-kernel@lists.infradead.org

On Wed, Sep 11, 2019 at 07:55:43PM +0530, Rohit Sarkar wrote:
> On Wed, Sep 11, 2019 at 04:17:25PM +0200, Stefan Wahren wrote:
> > Hi Rohit,
> > 
> > On 11.09.19 15:51, Rohit Sarkar wrote:
> > > When the number of bytes to be printed exceeds the limit snprintf
> > > returns the number of bytes that would have been printed (if there was
> > > no truncation). This might cause issues, hence use scnprintf which
> > > returns the actual number of bytes printed to buffer always
> > >
> > > Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
> > thanks for your patch. Did you test your change on the Raspberry Pi?
> 
> Hey Stefan,
> No I haven't done so as I thought this is a generic change?
> Will that be necessary?

No.  It's not required.  The patch is easy to audit and clearly
harmless.

The question would be does it actually fix a bug?  I looked at it and
some of the strings are definitely a bit long.  The longest one I saw
was:
	"  Slots: %d available (%d data), %d recyclable, %d stalls (%d data)",
	123456789 123456789 123456789 123456789 123456789 123456789 123456789

If you get a lot of stalls, then that looks like it could lead to a
read overflow (an information leak).  Either way this does make the
code a bit easier to audit so it seems like a nice cleanup.  Next time
though, I really would prefer if you put this sort analysis in your
commit message so I can just glance over it.  (I'm lazy).

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
