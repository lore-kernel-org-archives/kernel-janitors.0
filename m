From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 05:56:28 +0000
Subject: Re: [patch] ALSA: asihpi - fix return type of hpios_locked_mem_alloc()
Message-Id: <20120329055628.GB3289@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120328065702.GA9113@elgon.mountain>
	<s5hiphoyemc.wl%tiwai@suse.de> <4F7385F8.4050004@audioscience.com>
	<s5hk424t1h9.wl%tiwai@suse.de>
In-Reply-To: <s5hk424t1h9.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Eliot Blennerhassett <eblennerhassett@audioscience.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

I'm obviously in favour of using standard error codes where ever
possible.  But when I'm writing a change like this, then I do look
at the surrounding context because there are places the use custom
error codes (SCSI is an example).  In this case, I was confused
because there aren't any other error codes in this file, and also
the comment says that it should return -ENOMEM.

regards,
dan carpenter

