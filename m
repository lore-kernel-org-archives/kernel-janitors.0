From: Joerg Roedel <joro@8bytes.org>
Date: Tue, 03 Mar 2015 14:00:58 +0000
Subject: Re: [patch] iommu/amd: small cleanup in mn_release()
Message-Id: <20150303140057.GF10502@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150220105201.GA7895@mwanda>
In-Reply-To: <20150220105201.GA7895@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, Feb 20, 2015 at 01:52:01PM +0300, Dan Carpenter wrote:
> "pasid_state->device_state" and "dev_state" are the same, but it's nicer
> to use dev_state consistently.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
