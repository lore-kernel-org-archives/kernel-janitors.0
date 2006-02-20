From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 19:53:59 +0000
Subject: Re: [KJ] [Patch] BUG_ON() Conversion in drivers/net/
Message-Id: <20060220195359.GB28562@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68725929669048191=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============68725929669048191==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied. Some of these BUG()s can be removed because there would an
Oops few lines below anyway.


--===============68725929669048191==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68725929669048191==--
