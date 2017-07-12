From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Wed, 12 Jul 2017 07:54:41 +0000
Subject: Re: [PATCH net] nfp: freeing the wrong variable
Message-Id: <20170712005441.5f9169d0@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712074206.otviyjx2qhuz3snt@mwanda>
In-Reply-To: <20170712074206.otviyjx2qhuz3snt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pieter Jansen van Vuuren <pieter.jansenvanvuuren@netronome.com>, "David S. Miller" <davem@davemloft.net>, Simon Horman <simon.horman@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 12 Jul 2017 10:42:06 +0300, Dan Carpenter wrote:
> We accidentally free a NULL pointer and leak the pointer we want to
> free.  Also you can tell from the label name what was intended.  :)
> 
> Fixes: abfcdc1de9bf ("nfp: add a stats handler for flower offloads")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>

Thanks!
