From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Sep 2011 15:45:34 +0000
Subject: Re: [patch] Staging: rtl8192e: off by one in
Message-Id: <20110921154534.GA29426@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 21, 2011 at 10:33:34AM -0500, Larry Finger wrote:
> On 09/21/2011 02:17 AM, Dan Carpenter wrote:
> >COUNTRY_CODE_MAX is not a valid country code.  We're off by one here.
> >This gets passed to Dot11d_Channelmap() where it's used as an offset
> >into the ChannelPlan[] array.
> >
> >Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> 
> Dan, good catch.  Did this cause a problem, or did you find it while
> reading the code?
> 

It was a Smatch thing.  I caught it when I updated my smatch_data/.

regards,
dan carpenter
