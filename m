From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 07:39:07 +0000
Subject: Re: [PATCH] cxl: Unlock on error in probe
Message-Id: <20170505073907.wtuyp3ldbsytivhu@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053622.0670F124037@b01ledav002.gho.pok.ibm.com>
 <a4c0a3f6-f631-0998-ddd0-ca2efd4f1bfd@au1.ibm.com>
 <590C2856.5070905@bfs.de>
In-Reply-To: <590C2856.5070905@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>

On Fri, May 05, 2017 at 09:23:02AM +0200, walter harms wrote:
> > sem is a global and it looks like it's intended to be held after
> > device_open() returns and only released in device_close(), so this looks
> > wrong.
> > 
> 
> the patch relates to the error path, do you expect a close() after the open() failed ?
> 

You can't close if open fails.  Please don't ask rhetorical questions.
Just state everything in short sentences using simple words.

regards,
dan carpenter

