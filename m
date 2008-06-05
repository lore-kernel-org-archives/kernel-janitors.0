From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Thu, 05 Jun 2008 20:58:02 +0000
Subject: Re: [PATCH 1/2] Eliminate double kfree
Message-Id: <200806051358.02217.jbarnes@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805291504030.26229@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805291504030.26229@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thursday, May 29, 2008 6:04 am Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
>
> The destination of goto error also does a kfree(g_iommus), so it is not
> correct to do one here.

Thanks Julia, I'll put this in linux-next.

Jesse
