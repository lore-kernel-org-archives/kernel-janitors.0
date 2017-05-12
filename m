From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 12 May 2017 08:37:23 +0000
Subject: Re: Clarification for general change acceptance
Message-Id: <alpine.DEB.2.20.1705121635000.2981@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net> <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net> <20170511093015.4cdfdb6c@xeon-e3> <20170512070909.xxa62d2cde3qoj4f@mwanda> <8d38547f-a086-438a-5b2a-4d11929530ec@users.sourceforge.net>
 <1494575540.2028.17.camel@perches.com> <a348c5f5-d2fd-0d30-f579-a5939eab2f2b@users.sourceforge.net>
In-Reply-To: <a348c5f5-d2fd-0d30-f579-a5939eab2f2b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>, Stephen Hemminger <stephen@networkplumber.org>, Wolfram Sang <wsa@the-dreams.de>, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@linuxdriverproject.org

> But I will come along source code places where I am going to update details
> which are also trivial.

When you make a patch, you are not obliged to eliminate all of the other
checkpatch warnings on the file.  I don't know where you got this idea
from.  The submitting patch guidelines don't say to do it, and no one else
does it.  You just need to ensure that your changes don't introduce new
warnings, unless there is a good reason to do so.

julia
