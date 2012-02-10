From: Rasesh Mody <rmody@brocade.com>
Date: Fri, 10 Feb 2012 01:53:20 +0000
Subject: RE: [patch] bna: fix error handling of bnad_get_flash_partition_by_offset()
Message-Id: <E5313AF6F2BFD14293E5FD0F94750F86B1FB8B0A20@HQ1-EXCH01.corp.brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120209104934.GC5540@elgon.mountain>
In-Reply-To: <20120209104934.GC5540@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Adapter Linux Open SRC Team <adapter_linux_open_src_team@Brocade.COM>

>From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>Sent: Thursday, February 09, 2012 2:50 AM
>
>The current error handling doesn't work because we flash_part is a u32
>so the checks for negative error codes don't work.  I considered making
>things signed but I don't know the hardware enough to say if that's a
>problem.  Really, we don't use the error codes so just returning zero
>for all problems is fine.

Hi Dan,

We can't return 0 from the bnad_get_flash_partition_by_offset() on error as the flash partition 0 is a optrom partition. Also we got comments to return proper Linux error codes as ethtool application expects so.

What we can do is change the return type of the bnad_get_flash_partition_by_offset() to int.

Thanks,
Rasesh
