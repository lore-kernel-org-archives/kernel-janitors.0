From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Tue, 18 May 2010 22:05:51 +0000
Subject: Re: [PATCH 17/37] drivers/pci/hotplug: Use kmemdup
Message-Id: <20100518150551.3499b753@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152318000.21345@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005152318000.21345@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 15 May 2010 23:18:16 +0200 (CEST)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Use kmemdup when some other buffer is immediately copied into the
> allocated region.

Applied, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
