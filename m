From: Joe Perches <joe@perches.com>
Date: Wed, 26 Apr 2017 19:05:49 +0000
Subject: Re: Checking error messages for failed memory allocations
Message-Id: <1493233549.18659.33.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75622f45-f46c-e52f-2b9e-6ff5ce32184a@users.sourceforge.net>
         <3d355c13-159a-2570-9ead-af93ad95c210@users.sourceforge.net>
         <019b6365c15b0764c156d6453648f7a2@codeaurora.org>
         <1493231242.18659.28.camel@perches.com>
         <f6da1799-02a1-b1dc-edcb-a2ea5563b51a@users.sourceforge.net>
In-Reply-To: <f6da1799-02a1-b1dc-edcb-a2ea5563b51a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Subhash Jadavani <subhashj@codeaurora.org>, linux-scsi@vger.kernel.org, "James E. J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Vinayak Holikatti <vinholikatti@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, linux-scsi-owner@vger.kernel.org

On Wed, 2017-04-26 at 20:50 +0200, SF Markus Elfring wrote:
> > Basically most everything that has a gfp_t argument does a
> > dump_stack() on OOM unless __GFP_NOWARN is specified by that gfp_t.
> 
> How do you think about to improve any programming interface documentation
> around such a function property?

Feel free to submit documentation patches.

> Are there any special checks needed for function implementations
> which can pass the flag “__GFP_NOWARN”?

No.
