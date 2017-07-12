From: David Miller <davem@davemloft.net>
Date: Wed, 12 Jul 2017 15:19:02 +0000
Subject: Re: [PATCH net] nfp: freeing the wrong variable
Message-Id: <20170712.081902.1365961724075582090.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712074206.otviyjx2qhuz3snt@mwanda>
In-Reply-To: <20170712074206.otviyjx2qhuz3snt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jakub.kicinski@netronome.com, pieter.jansenvanvuuren@netronome.com, simon.horman@netronome.com, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 10:42:06 +0300

> We accidentally free a NULL pointer and leak the pointer we want to
> free.  Also you can tell from the label name what was intended.  :)
> 
> Fixes: abfcdc1de9bf ("nfp: add a stats handler for flower offloads")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
