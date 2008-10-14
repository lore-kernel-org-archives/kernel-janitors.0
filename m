From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 14 Oct 2008 18:51:44 +0000
Subject: Re: [PATCH 1/2] drivers/pci/hotplug/cpqphp_ctrl.c: Convert && to ||
Message-Id: <20081014185143.GH15064@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0810141759300.20451@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0810141759300.20451@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kristen.c.accardi@intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 14, 2008 at 05:59:50PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The pattern !E && !E->fld is nonsensical.  The patch below updates this
> according to the assumption that && should be ||.  But perhaps another
> solution was intended.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

I think that's the right solution for this case.

Reviewed-by: Matthew Wilcox <willy@linux.intel.com>

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
