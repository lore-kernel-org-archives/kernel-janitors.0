From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 26 Apr 2004 09:28:47 +0000
Subject: Re: [Kernel-janitors] [PATCH] Remove bootsect_helper and A comment
Message-Id: <20040426092847.GA1251@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29856524234283022=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4087C7F2.9050308@greatcn.org>
In-Reply-To: <4087C7F2.9050308@greatcn.org>
To: kernel-janitors@vger.kernel.org

--===============29856524234283022==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, 23 Apr 2004, Coywolf Qi Hunt wrote:

[..]
> 
> This is it:
> ========================================================================
> --- linux-2.6.5/arch/i386/boot/setup.S.orig	Sat Mar  6 23:49:33 2004
> +++ linux-2.6.5/arch/i386/boot/setup.S	Sun Mar  7 07:23:10 2004

you didn't read the faq ;)

please try:

cp -a linux-2.6.5 linux-2.6.5-foo
vi linux-2.6.5-foo/arch/i386/boot/setup.S
configure + compile + test.
diff -ruN linux-2.6.5 linux-2.6.5-foo > patch-rm-bootsect_helper
if it's ok now send it to the ml.


a++ maks


--===============29856524234283022==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29856524234283022==--
