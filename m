From: "Charles (Chas) Williams" <3chas3@gmail.com>
Date: Mon, 12 Oct 2015 15:28:55 +0000
Subject: Re: [PATCH 0/2] atm: iphase: Fix misleading indention and return -ENOMEM on error
Message-Id: <1444663735.3494.58.camel@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444506439-10414-1-git-send-email-theidsieck@leenox.de>
In-Reply-To: <1444506439-10414-1-git-send-email-theidsieck@leenox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tillmann Heidsieck <theidsieck@leenox.de>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2015-10-10 at 21:47 +0200, Tillmann Heidsieck wrote:
> this series fixes two of them. The if(); warning would require
> restructuring the code to a larger extend. Beyond this there remains a
> whooping number of > 2k checkpatch.pl warnings and errors each. Those
> can be grouped into 
...
> Generally I would not mind cleaning all this up for those who have to
> make functional changes to the driver. However, I would like to know
> from the maintainers if such an afford would be welcome or not.

It doesn't bother me if you do this.  I can review it.


