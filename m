From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 21 Jan 2005 15:45:58 +0000
Subject: Re: [KJ] [PATCH] gcc-4.0 allyesconfig fixes
Message-Id: <20050121154558.GO25940@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1271557264835983=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120220402.GB22673@ens-lyon.fr>
In-Reply-To: <20050120220402.GB22673@ens-lyon.fr>
To: kernel-janitors@vger.kernel.org

--===============1271557264835983==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 03:13:12PM +0100, Benoit Boissinot wrote:
> Is the following patch better ?
> I checked the return type of readl, it is a 32bit integer.
> 
> --- linux-clean/drivers/net/s2io.h	2005-01-20 22:13:01.000000000 +0100
> +++ linux-2.6-mm-test/drivers/net/s2io.h	2005-01-21 14:01:21.000000000 +0100
> @@ -738,9 +738,9 @@ typedef struct s2io_nic {
>  #ifndef readq
>  static inline u64 readq(void __iomem *addr)
>  {
> -	u64 ret = readl(addr + 4);
> -	(u64) ret <<= 32;
> -	(u64) ret |= readl(addr);
> +	u64 ret = (u64) readl(addr + 4);

No need to cast, it's automatic.

> +	ret <<= 32;
> +	ret |= (u64) readl(addr);

Ditto here.

So the correct form would be:

	u64 ret = readl(addr + 4);
	ret <<= 32;
	ret |= readl(addr);

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============1271557264835983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1271557264835983==--
