From: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Date: Sat, 20 Jan 2018 19:40:05 +0000
Subject: Re: [PATCH] Intel-IOMMU: Delete an error message for a failed memory allocation in init_dmars()
Message-Id: <20180120194004.GC28161@8bytes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <def26d40-37d3-d594-e17c-53e40a3034b7@users.sourceforge.net>
	<20180120133452.GB28161@8bytes.org>
	<6b452dfb-b2fc-2417-26b3-bbcdf11ed06f@users.sourceforge.net>
In-Reply-To: <6b452dfb-b2fc-2417-26b3-bbcdf11ed06f-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Sat, Jan 20, 2018 at 03:55:37PM +0100, SF Markus Elfring wrote:
> Do you need any more background information for this general
> transformation pattern?

No.

> Do you find the Linux allocation failure report insufficient for this
> use case?

Yes, because it can't tell me what the code was trying to allocate.

