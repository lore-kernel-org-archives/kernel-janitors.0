From: Joerg Roedel <joerg.roedel@amd.com>
Date: Fri, 03 Aug 2012 14:06:29 +0000
Subject: Re: [PATCH v2] drivers/iommu/intel-iommu.c: add missing free_domain_mem
Message-Id: <20120803140628.GD1996@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343139494-26998-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343139494-26998-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jul 24, 2012 at 04:18:14PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Add missing free_domain_mem on failure path after alloc_domain.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied to iommu/fixes, thanks Julia.

-- 
AMD Operating System Research Center

Advanced Micro Devices GmbH Einsteinring 24 85609 Dornach
General Managers: Alberto Bozzo
Registration: Dornach, Landkr. Muenchen; Registerger. Muenchen, HRB Nr. 43632

