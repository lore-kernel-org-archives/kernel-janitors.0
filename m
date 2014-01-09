From: Joerg Roedel <joro@8bytes.org>
Date: Thu, 09 Jan 2014 12:06:43 +0000
Subject: Re: [patch] iommu/vt-d: signedness bug in alloc_irte()
Message-Id: <20140109120643.GK29041@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140109053236.GE1265@elgon.mountain>
In-Reply-To: <20140109053236.GE1265-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jiang Liu <jiang.liu-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

On Thu, Jan 09, 2014 at 08:32:36AM +0300, Dan Carpenter wrote:
> "index" needs to be signed for the error handling to work.  I deleted a
> little bit of obsolete cruft related to "index" and "start_index" as
> well.
> 
> Fixes: 360eb3c5687e ('iommu/vt-d: use dedicated bitmap to track remapping entry allocation status')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.


