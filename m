From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 16:45:48 +0000
Subject: [KJ PATCHES] mostly kmalloc + memset conversion to k[cz]alloc
Message-Id: <200707311845.48807.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Hello,

	This kj patch series does kmalloc + memset conversion to k[cz]alloc. Some
of them also remove redundant argument checks to functions that already do that
internally. Also some minor style things are fixed like redundant k[mcz]alloc casts.
Most of this patches shrink object size by several hundred bytes (you'll find stats
below signed-off line) so this is a good thing. Almost all of them were compile tested.

Please review and apply.

Regards,

	Mariusz
