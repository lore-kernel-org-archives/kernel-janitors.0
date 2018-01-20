From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Date: Sat, 20 Jan 2018 13:34:52 +0000
Subject: Re: [PATCH] Intel-IOMMU: Delete an error message for a failed memory allocation in init_dmars()
Message-Id: <20180120133452.GB28161@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <def26d40-37d3-d594-e17c-53e40a3034b7@users.sourceforge.net>
In-Reply-To: <def26d40-37d3-d594-e17c-53e40a3034b7-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Jan 20, 2018 at 02:00:13PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 Jan 2018 13:51:49 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

NACK on this one and the other two IOMMU patches you sent. The messages
give the user/developer useful information about what the memory that
failed to allocate would have been used for.


	Joerg
