From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jul 2014 13:31:46 +0000
Subject: Re: [PATCH 2/2] staging: silicom: function return fixes
Message-Id: <20140711133146.GB25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1972083.WZLDx2N35Z@mayhem>
 <1488578.ritUTSl26I@mayhem>
In-Reply-To: <1488578.ritUTSl26I@mayhem>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Davide Gianforte <davide@gengisdave.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Some of these functions aren't called and can just be deleted.

regards,
dan carpenter

