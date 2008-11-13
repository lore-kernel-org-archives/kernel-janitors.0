From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Thu, 13 Nov 2008 15:45:38 +0000
Subject: Re: [PATCH] drivers/pcmcia/cistpl.c: introduce missing braces
Message-Id: <20081113154538.GB7264@comet.dominikbrodowski.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811131133010.9563@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811131133010.9563@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Thu, Nov 13, 2008 at 11:33:54AM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The indentation and behavior of the code below suggests that braces are
> intended around the if branch.

good catch, but already fixed in pcmcia-git and on its way to Linux (commit
e689597fe890cf22e23195037aa668c39b25ae4b ) -- many thanks nonetheless!

BTW: is this an automatic test script of some sort? if so, it might be
useful to run this on linux-next kernels, too, so that bugs like this one
are caught before they hit mainline.

Best,
	Dominik
