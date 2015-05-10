From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 10 May 2015 13:04:41 +0000
Subject: Re: [PATCH] Staging: lustre: llite: Drop unneeded variables
Message-Id: <20150510130441.GA22189@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430924383-30791-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430924383-30791-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Oleg Drokin <oleg.drokin@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, Andreas Dilger <andreas.dilger@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org

On Wed, May 06, 2015 at 04:59:42PM +0200, Julia Lawall wrote:
> Drop variables made unnecessary by conversion of obd free functions
> to kfree.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Someone else sent this a few hours before you did :(
