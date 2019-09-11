From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Wed, 11 Sep 2019 17:50:03 +0000
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-Id: <20190911173803.GA19183@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
 <20190911142543.GA9873@SARKAR> <20190911144312.GL15977@kadam>
 <20190911150300.GA12027@SARKAR> <20190911172422.GK20699@kadam>
In-Reply-To: <20190911172422.GK20699@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, Dominic Braun <inf.braun@fau.de>, linux-rpi-kernel@lists.infradead.org

On Wed, Sep 11, 2019 at 08:24:22PM +0300, Dan Carpenter wrote:
> On Wed, Sep 11, 2019 at 08:33:00PM +0530, Rohit Sarkar wrote:
> > There are a lot of usages of "snprintf" throughout the staging
> > directory (315 to be exact)
> > Would it be worthwhile to find ones that may cause an information leak
> > and replace them with "scnprintf"?
> 
> A lot of times it's really easy to see that the uses are safe, so
> snprintf() is fine in that case.  If it's not obviously safe then change
> it.
> 
> regards,
> dan carpenter
> 

Sure, thanks a ton!
regards,
Rohit
