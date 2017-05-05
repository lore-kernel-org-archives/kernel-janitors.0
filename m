From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 07:37:44 +0000
Subject: Re: [PATCH] cxl: Unlock on error in probe
Message-Id: <20170505073744.yqwfhunn6rlqiupf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170505053622.0670F124037@b01ledav002.gho.pok.ibm.com>
 <a4c0a3f6-f631-0998-ddd0-ca2efd4f1bfd@au1.ibm.com>
In-Reply-To: <a4c0a3f6-f631-0998-ddd0-ca2efd4f1bfd@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc: Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Frederic Barrat <fbarrat@linux.vnet.ibm.com>

On Fri, May 05, 2017 at 05:14:15PM +1000, Andrew Donnellan wrote:
> sem is a global and it looks like it's intended to be held after
> device_open() returns and only released in device_close(), so this looks
> wrong.
> 

This doesn't affect the success path, it only means that if
device_open() fails because we don't have enough free memory or whatever
then we can try again later.

regards,
dan carpenter

