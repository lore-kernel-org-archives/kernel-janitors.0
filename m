From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 10:17:07 +0000
Subject: Re: [patch -next] bcma: signedness bug in bcma_get_next_core()
Message-Id: <20110824101707.GA5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818133809.GG4786@shale.localdomain>
 <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
 <20110823191306.GK12248@shale.localdomain>
 <CACna6rwLrGa4LU2GOQ03w+t5FfrD+c1rdHki_Nu-3oPVninCJg@mail.gmail.com>
In-Reply-To: <CACna6rwLrGa4LU2GOQ03w+t5FfrD+c1rdHki_Nu-3oPVninCJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "open list:BROADCOM SPECIFIC..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Aug 24, 2011 at 12:01:11PM +0200, Rafał Miłecki wrote:
> Dan, I asked you to use int in both: call and function declaration.
> I'm the author of that code, and I don't have anything against
> modifying that :)
> 
> I think int is used much more often that s32 for errors.
> 

No problem.  Should I make bcma_erom_get_mst_port() return 0 on
success while I'm at it?

regards,
dan carpenter

