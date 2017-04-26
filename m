From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 26 Apr 2017 18:50:13 +0000
Subject: Re: Checking error messages for failed memory allocations
Message-Id: <f6da1799-02a1-b1dc-edcb-a2ea5563b51a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75622f45-f46c-e52f-2b9e-6ff5ce32184a@users.sourceforge.net>
 <3d355c13-159a-2570-9ead-af93ad95c210@users.sourceforge.net>
 <019b6365c15b0764c156d6453648f7a2@codeaurora.org>
 <1493231242.18659.28.camel@perches.com>
In-Reply-To: <1493231242.18659.28.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Subhash Jadavani <subhashj@codeaurora.org>, linux-scsi@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Vinayak Holikatti <vinholikatti@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-scsi-owner@vger.kernel.org

> Basically most everything that has a gfp_t argument does a
> dump_stack() on OOM unless __GFP_NOWARN is specified by that gfp_t.

How do you think about to improve any programming interface documentation
around such a function property?

Are there any special checks needed for function implementations
which can pass the flag “__GFP_NOWARN”?

Regards,
Markus
