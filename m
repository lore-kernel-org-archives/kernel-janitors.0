From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Oct 2011 06:20:31 +0000
Subject: Re: [PATCH 1/5] drivers/staging/rtl8712/rtl871x_mlme.c: eliminate a
Message-Id: <20111029062031.GF14881@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1319846297-2985-1-git-send-email-julia@diku.dk>
 <4EAB5170.8000407@lwfinger.net>
In-Reply-To: <4EAB5170.8000407@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, Florian Schilhabel <florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, Oct 28, 2011 at 08:05:52PM -0500, Larry Finger wrote:
> I believe it is. It probably does not matter as I have never hit an
> oops at this location.
> 

You would only hit an Oops if you used a zero mac address for
pnetwork->MacAddress.

Julia's patch is turning on some code that was never tested to make
it the common case.  So it will be easy to see if it works or not
when it gets merged.  ;P  To me it could go either way, (the test is
reversed or the memcpy() could be removed).

regards,
dan carpenter

