From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 23:07:30 +0000
Subject: Re: [PATCH 2/5] [media] s2255drv: Adjust 13 checks for null pointers
Message-Id: <20170920230729.b2jujsdcjtvjrjun@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55718a41-d76f-36bf-7197-db92014dcd3c@users.sourceforge.net>
 <66f0b95e-e717-7a50-39d2-05fcbf7b77bd@users.sourceforge.net>
In-Reply-To: <66f0b95e-e717-7a50-39d2-05fcbf7b77bd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 20, 2017 at 06:58:56PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 20 Sep 2017 16:46:19 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 

You've been told several times that this stuff doesn't work.  Try
applying this patch with `git am` and you'll see why.

regards,
dan carpenter

