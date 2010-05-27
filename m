From: Dan Carpenter <error27@gmail.com>
Date: Thu, 27 May 2010 16:53:02 +0000
Subject: Re: [PATCH 7/11] drivers/scsi: Eliminate a NULL pointer dereference
Message-Id: <20100527165301.GU22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005271433330.5422@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005271433330.5422@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: HighPoint Linux Team <linux@highpoint-tech.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 27, 2010 at 02:33:47PM +0200, Julia Lawall wrote:
> If it is a problem to use 0 when host is NULL, then the code could be fixed
> in another way.
> 

Yeah.  It seems like it would be better to give a clearly bogus number.
I would have said -1 but "scsi-1" looks normal so maybe something like 
9999999?

regards,
dan carpenter
