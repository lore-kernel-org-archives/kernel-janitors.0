From: Benoit Boissinot <benoit.boissinot@ens-lyon.org>
Date: Fri, 21 Jan 2005 14:13:12 +0000
Subject: Re: [KJ] [PATCH] gcc-4.0 allyesconfig fixes
Message-Id: <20050121141312.GD22673@ens-lyon.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26331428649666777=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120220402.GB22673@ens-lyon.fr>
In-Reply-To: <20050120220402.GB22673@ens-lyon.fr>
To: kernel-janitors@vger.kernel.org

--===============26331428649666777==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 21, 2005 at 10:10:39AM +0100, walter harms wrote:
> Hi Benoit,
> i do not think this will work. Numbers are int and i already got some 
> strange effects because of that (perhaps gcc 4.0 will handle this better
> but dont count on it).  please use: ret= ret << 32L;
> 
> on the other side: does readl() return long() ? perhaps it can return
> a real 64bit value on a 64bit box ? then whole code is broken.
> 
> re,
> walter
>
Is the following patch better ?
I checked the return type of readl, it is a 32bit integer.

--- linux-clean/drivers/net/s2io.h	2005-01-20 22:13:01.000000000 +0100
+++ linux-2.6-mm-test/drivers/net/s2io.h	2005-01-21 14:01:21.000000000 +0100
@@ -738,9 +738,9 @@ typedef struct s2io_nic {
 #ifndef readq
 static inline u64 readq(void __iomem *addr)
 {
-	u64 ret = readl(addr + 4);
-	(u64) ret <<= 32;
-	(u64) ret |= readl(addr);
+	u64 ret = (u64) readl(addr + 4);
+	ret <<= 32;
+	ret |= (u64) readl(addr);
 
 	return ret;
 }


--===============26331428649666777==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26331428649666777==--
