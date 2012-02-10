From: Rasesh Mody <rmody@brocade.com>
Date: Fri, 10 Feb 2012 22:38:38 +0000
Subject: RE: [patch] bna: fix error handling of bnad_get_flash_partition_by_offset()
Message-Id: <E5313AF6F2BFD14293E5FD0F94750F86B1FB8B0BDD@HQ1-EXCH01.corp.brocade.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120209104934.GC5540@elgon.mountain>
 <E5313AF6F2BFD14293E5FD0F94750F86B1FB8B0A20@HQ1-EXCH01.corp.brocade.com>
 <20120210071534.GE4204@mwanda>
In-Reply-To: <20120210071534.GE4204@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Adapter Linux Open SRC Team <adapter_linux_open_src_team@Brocade.COM>

>From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
>Sent: Thursday, February 09, 2012 11:16 PM
>
>On Thu, Feb 09, 2012 at 05:53:20PM -0800, Rasesh Mody wrote:
>>
>> We can't return 0 from the bnad_get_flash_partition_by_offset() on
>> error as the flash partition 0 is a optrom partition. Also we got
>> comments to return proper Linux error codes as ethtool application
>> expects so.
>
>It's already treated as an error.  A return value of zero means the user
>gets a return value of -EFAULT.  I'm slightly confused by your email.
>
>My patch was already merged into git.  Can you just send a patch which
>does what you want?  I don't know the subsystem well enough to say how
>you want zero returns to be handled if the original code was not
>correct.

I would like to take back my prior statement, we can return 0 from the bnad_get_flash_partition_by_offset on error. Flash partition 1 and not 0 is actually optrom, so there will be no need to  handle zero returns differently. Zero returns should be treated as an error and reported as -EFAULTS as its being done in current implementation. Apologies for the confusion.

Regards,
Rasesh
