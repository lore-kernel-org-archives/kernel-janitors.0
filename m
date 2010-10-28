From: Jens Axboe <jaxboe@fusionio.com>
Date: Thu, 28 Oct 2010 12:32:10 +0000
Subject: Re: [PATCH] block: cciss: fix information leak to userland
Message-Id: <4CC96D4A.7060000@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288194048-9233-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288194048-9233-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Mike Miller <mike.miller@hp.com>, "Stephen M. Cameron" <scameron@beardog.cce.hp.com>, Andrew Morton <akpm@linux-foundation.org>, "iss_storagedev@hp.com" <iss_storagedev@hp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2010-10-27 09:40, Vasiliy Kulikov wrote:
> Structure IOCTL_Command_struct is copied to userland with
> some padding fields at the end of the struct unitialized.
> It leads to leaking of contents of kernel stack memory.

Thanks, applied.


-- 
Jens Axboe

