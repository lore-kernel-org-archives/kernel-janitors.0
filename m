From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Mon, 05 Jan 2009 19:11:29 +0000
Subject: Re: [PATCH 8/13] drivers/pci/hotplug: Remove redundant test
Message-Id: <200901051111.29697.jbarnes@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211639170.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211639170.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sunday, December 21, 2008 7:39 am Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> func is checked not to be NULL a few lines before.
>
> A simplified version of the semantic patch that makes this change is as
> follows: (http://www.emn.fr/x-info/coccinelle/)

Applied, thanks Julia.

-- 
Jesse Barnes, Intel Open Source Technology Center

