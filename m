From: Rohit Sarkar <rohitsarkar5398@gmail.com>
Date: Wed, 11 Sep 2019 14:37:43 +0000
Subject: Re: [PATCH] staging: vhciq_core: replace snprintf with scnprintf
Message-Id: <20190911142543.GA9873@SARKAR>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190911135112.GA5569@SARKAR>
 <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
In-Reply-To: <7bf3c74d-e690-1ef1-dd74-ac98667e42ef@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Wahren <wahrenst@gmx.net>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Tobias =?iso-8859-1?Q?B=FCttner?= <tobias.buettner@fau.de>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel@lists.infradead.org, Dominic Braun <inf.braun@fau.de>

On Wed, Sep 11, 2019 at 04:17:25PM +0200, Stefan Wahren wrote:
> Hi Rohit,
> 
> On 11.09.19 15:51, Rohit Sarkar wrote:
> > When the number of bytes to be printed exceeds the limit snprintf
> > returns the number of bytes that would have been printed (if there was
> > no truncation). This might cause issues, hence use scnprintf which
> > returns the actual number of bytes printed to buffer always
> >
> > Signed-off-by: Rohit Sarkar <rohitsarkar5398@gmail.com>
> thanks for your patch. Did you test your change on the Raspberry Pi?

Hey Stefan,
No I haven't done so as I thought this is a generic change?
Will that be necessary? 
I am relatively new to kernel development
Thanks,
Rohit
