From: David Miller <davem@davemloft.net>
Date: Thu, 24 Sep 2020 01:06:15 +0000
Subject: Re: [PATCH net-next] tipc: potential memory corruption in tipc_crypto_key_rcv()
Message-Id: <20200923.180615.357823799741297427.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200923083017.GA1454948@mwanda>
In-Reply-To: <20200923083017.GA1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jmaloy@redhat.com, ying.xue@windriver.com, kuba@kernel.org, tuong.t.lien@dektech.com.au, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, keescook@chromium.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 11:30:17 +0300

> This code uses "skey->keylen" as an memcpy() size and then checks that
> it is valid on the next line.  The other problem is that the check has
> a potential integer overflow, it's better to use struct_size() for this.
> 
> Fixes: 23700da29b83 ("tipc: add automatic rekeying for encryption key")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hey Kees and Julia,
> 
> It would be nice to change tipc_aead_key_size() but I'm not sure how the
> UAPI stuff works.  My first attempt at to change it to
> 
> 	return struct_size(key, key, key->keylen);
> 
> broke the build.  I think you guys used Coccinelle to automatically
> update these calculations.  Probably this wasn't updated because you
> didn't want to break the build either?

If it is subject to overflows, the tipc_aead_key_size() helper
shouldn't be used as-is by userspace either.

Right?

Please find a way to fix that inline function instead without breaking
UAPI, thank you.
