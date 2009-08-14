From: David Miller <davem@davemloft.net>
Date: Fri, 14 Aug 2009 03:14:52 +0000
Subject: Re: [PATCH] s2io: Remove unnecessary casts
Message-Id: <20090813.201452.21119996.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090814020328.GA21588@fencepost.gnu.org>
In-Reply-To: <20090814020328.GA21588@fencepost.gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dave@gnu.org
Cc: ram.vepa@neterion.com, santosh.rastapur@neterion.com, sivakumar.subramani@neterion.com, sreenivasa.honnur@neterion.com, anil.murthy@neterion.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Davidlohr Bueso <dave@gnu.org>
Date: Thu, 13 Aug 2009 22:03:28 -0400

> 
> No need to cast kmalloc.
> 
> Signed-off-by: Davidlohr Bueso <dave@gnu.org>

Yeah but:

>  
> -                                       ba->ba_0_org = (void *) kmalloc
> -                                           (BUF0_LEN + ALIGN_SIZE, GFP_KERNEL);
> +                                       ba->ba_0_org = kmalloc(BUF0_LEN + ALIGN_SIZE, GFP_KERNEL);

Now the code line extends way over 80 columns.

Please fix this up and resubmit.
