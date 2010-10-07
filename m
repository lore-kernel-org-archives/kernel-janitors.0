From: David Miller <davem@davemloft.net>
Date: Thu, 07 Oct 2010 06:30:52 +0000
Subject: Re: [patch] eicon: make buffer larger
Message-Id: <20101006.233052.233715980.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101004192459.GE5692@bicker>
In-Reply-To: <20101004192459.GE5692@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: mac@melware.de, isdn@linux-pingi.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Mon, 4 Oct 2010 21:24:59 +0200

> In diva_mnt_add_xdi_adapter() we do this:
>   strcpy (clients[id].drvName,     tmp);
>   strcpy (clients[id].Dbg.drvName, tmp);
> 
> The "clients[id].drvName" is a 128 character buffer and
> "clients[id].Dbg.drvName" was originally a 16 character buffer but I've
> changed it to 128 as well.  We don't actually use 128 characters but we
> do use more than 16.
> 
> I've also changed the size of "tmp" to 128 characters instead of 256.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
