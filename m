From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 20 Jul 2010 15:02:23 +0000
Subject: RE: [PATCH 01/16] trivial: use ARRAY_SIZE
Message-Id: <alpine.LNX.2.00.1007201702020.4741@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1277726085-24434-1-git-send-email-segooon@gmail.com> <0F5B06BAB751E047AB5C87D1F77A77887D03473B46@GVW0547EXC.americas.hpqcorp.net>
In-Reply-To: <0F5B06BAB751E047AB5C87D1F77A77887D03473B46@GVW0547EXC.americas.hpqcorp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Miller, Mike (OS Dev)" <Mike.Miller@hp.com>
Cc: Kulikov Vasiliy <segooon@gmail.com>, Kernel Janitors <kernel-janitors@vger.kernel.org>, Jens Axboe <jens.axboe@oracle.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, "Patterson, Andrew D (LeftHand Networks)" <andrew.patterson@hp.com>, ISS StorageDev <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 28 Jun 2010, Miller, Mike (OS Dev) wrote:

> > Change sizeof(x) / sizeof(*x) to ARRAY_SIZE(x).
> > 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> Acked-by: Mike Miller <mike.miller@hp.com>

Not present in linux-next as of today. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
