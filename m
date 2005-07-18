From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 18 Jul 2005 14:44:42 +0000
Subject: Re: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <20050718144442.GB27059@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7018628837836014=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D9C495.2090405@divsol.com>
In-Reply-To: <42D9C495.2090405@divsol.com>
To: kernel-janitors@vger.kernel.org

--===============7018628837836014==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2005 at 03:09:31PM +0200, walter harms wrote:
> that includes an 'indent -kr -i8' ?

Of the whole tree? Ick.

$ diffstat -p1 Lindent.patch | wc -l
13533
$ ls -l Lindent.patch
-rw-r--r--  1 ad users 177002265 Jul 18 18:34 Lindent.patch


--===============7018628837836014==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7018628837836014==--
