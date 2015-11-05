From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Nov 2015 13:52:35 +0000
Subject: Re: [PATCH] staging: most: Delete an unnecessary check before the function call "module_put"
Message-Id: <20151105135235.GX18797@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <563B5C52.2060507@users.sourceforge.net>
In-Reply-To: <563B5C52.2060507@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org

Relying on hidden sanity checks makes the code harder to read.  A human
being cannot remember which functions have sanity checks and which do
not.  These sorts of patches are easy to generate automatically but they
make the code worse.  There are so many *better* things to do instead of
focusing on making the code bad.

Please stop sending these patches for drivers/staging.  You are welcome
to send them for other subsystems which I don't care about.

regards,
dan carpenter

