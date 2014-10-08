From: Joe Perches <joe@perches.com>
Date: Wed, 08 Oct 2014 12:26:11 +0000
Subject: Re: [patch] staging: rtl8723au: incorrect use of ether_addr_copy()
Message-Id: <1412771171.3438.25.camel@joe-AO725>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141008104014.GA23096@mwanda>
In-Reply-To: <20141008104014.GA23096@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Jes Sorensen <Jes.Sorensen@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

On Wed, 2014-10-08 at 13:40 +0300, Dan Carpenter wrote:
> The return from myid() isn't aligned correctly for ether_addr_copy().

Hey Dan.

Actual evidence showing ether_addr_copy conversions
may not always be wise.

How did you find them?

Is there a new alignment capability in smatch?


