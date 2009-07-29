From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Jul 2009 13:08:24 +0000
Subject: Re: [PATCH 4/4] Staging: hv: Fix warning by casting a (const void *) to (void *)
Message-Id: <200907291508.24608.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907291410.29355.npalix@diku.dk>
In-Reply-To: <200907291410.29355.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: gregkh@suse.de, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 29 July 2009, Nicolas Palix wrote:
> Fix compilation warning by casting the const void *Buffer
> variable into a void *.
> 
> Signed-off-by: Nicolas Palix <npalix@diku.dk>

Not sure if this one is worthwhile. Replacing SG_BUFFER_LIST
with the existing struct scatterlist might be a better
fix, as sg_set_buf() does not generate a warning like this
anyway.

	Arnd <><
