From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 20 Apr 2020 08:17:18 +0000
Subject: Duplicated DMA-BUF HEAPS FRAMEWORK in MAINTAINERS on next-20200420
Message-Id: <alpine.DEB.2.21.2004201003340.7417@felia>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Joe Perches <joe@perches.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Thomas,

on next-20200420, ./scripts/checkpatch.pl -f MAINTAINERS and 
./scripts/parse-maintainers.pl report a number of issues:

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic 
order
#5059: FILE: MAINTAINERS:5059:
+F:	include/linux/dma-resv.h
+F:	include/linux/*fence.h

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic 
order
#5060: FILE: MAINTAINERS:5060:
+F:	include/linux/*fence.h
+F:	Documentation/driver-api/dma-buf.rst

WARNING: Misordered MAINTAINERS entry - list 'T:' before 'K:'
#5062: FILE: MAINTAINERS:5062:
+K:	\bdma_(?:buf|fence|resv)\b
+T:	git git://anongit.freedesktop.org/drm/drm-misc

WARNING: Misordered MAINTAINERS entry - list 'L:' before 'S:'
#5073: FILE: MAINTAINERS:5073:
+S:	Maintained
+L:	linux-media@vger.kernel.org

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic 
order
#5077: FILE: MAINTAINERS:5077:
+F:	include/uapi/linux/dma-heap.h
+F:	include/linux/dma-heap.h

WARNING: Misordered MAINTAINERS entry - list file patterns in alphabetic 
order
#5078: FILE: MAINTAINERS:5078:
+F:	include/linux/dma-heap.h
+F:	drivers/dma-buf/dma-heap.c

WARNING: Misordered MAINTAINERS entry - list 'T:' before 'F:'
#5080: FILE: MAINTAINERS:5080:
+F:	drivers/dma-buf/heaps/*
+T:	git git://anongit.freedesktop.org/drm/drm-misc


Header 'DMA-BUF HEAPS FRAMEWORK' already exists at 
./scripts/parse-maintainers.pl line 159, <$file> line 5109.


I tracked this down to commit 08d99b2c23df ("Merge drm/drm-next into 
drm-misc-next") visible in next-20200420.

It seems that this commit adds the DMA-BUF HEAPS FRAMEWORK a second time 
in its state before the reordering into MAINTAINERS through this merge.

Possibly, you can clean this up? I am happy to support with further 
patches if it is clear what we should do here.


Best regards,


Lukas
