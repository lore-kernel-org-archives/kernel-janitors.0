From: Oliver Neukum <oneukum@suse.de>
Date: Tue, 05 Jun 2007 08:51:39 +0000
Subject: [KJ] Re: [PATCH] bugfix GFP_KERNEL -> GFP_ATOMIC in spin_locked
Message-Id: <200706051051.40016.oneukum@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87odjvu1on.fsf@wanadoo.fr>
	<20070604210018.0eaa20a0.akpm@linux-foundation.org>
	<20070604210824.dfb7c2d9.akpm@linux-foundation.org>
In-Reply-To: <20070604210824.dfb7c2d9.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sumant Patro <sumant.patro@lsi.com>, Yoann Padioleau <padator@wanadoo.fr>, linux-usb-devel@lists.sourceforge.net, linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, Seokmann Ju <seokmann.ju@lsil.com>

Am Dienstag, 5. Juni 2007 06:08 schrieb Andrew Morton:
> Everything in USB appears to already be fixed, apart from the io_ti.c bug.

Yes, that's a bug. I've queued a patch.

	Regards
		Oliver
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
