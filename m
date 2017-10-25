From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Oct 2017 06:02:09 +0000
Subject: Re: [PATCH 2/2] drm/rcar-du: Adjust 14 checks for null pointers
Message-Id: <20171025060209.pqtyqk4weduvmzxj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
In-Reply-To: <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>

On Tue, Oct 24, 2017 at 06:02:30PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 24 Oct 2017 17:47:37 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> The script “checkpatch.pl” pointed information out like the following.
> 
> Comparison to NULL could be written !…
> 
> Thus fix the affected source code places.
> 

This one is fine except for the commit message.

regards,
dan carpenter

