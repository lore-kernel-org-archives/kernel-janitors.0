From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 07:55:38 +0000
Subject: Re: [patch] ceph: tidy ceph_mdsmap_decode() a little
Message-Id: <20130529075538.GE23987@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130529062213.GF23932@mwanda>
 <51A5AB81.5070908@bfs.de>
In-Reply-To: <51A5AB81.5070908@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Sage Weil <sage@inktank.com>, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

On Wed, May 29, 2013 at 09:17:21AM +0200, walter harms wrote:
> personally i would go for:
> 		info->export_targets = NULL;
> and remove the else below.
> 

I don't have strong feelings one way or the other, but honestly, I
think the way I sent it is more clear.

regards,
dan carpenter

