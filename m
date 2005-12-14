From: Nicolas Kaiser <nikai@nikai.net>
Date: Wed, 14 Dec 2005 15:26:14 +0000
Subject: Re: [KJ] [PATCH] crypto/aes: add unsigned to ints that can't go
Message-Id: <20051214162614.2085b1b4@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26291364964596209=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051209155957.39daf59d@lucky.kitzblitz>
In-Reply-To: <20051209155957.39daf59d@lucky.kitzblitz>
To: kernel-janitors@vger.kernel.org

--===============26291364964596209==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

* Alexey Dobriyan <adobriyan@gmail.com>:
> On Fri, Dec 09, 2005 at 03:59:57PM +0100, Nicolas Kaiser wrote:
> > * Key length can't go negative, "unsigned int" is preferred to "int"
> > * E-Key is most frequently accessed struct member
> 
> I've checked alpha and s390 (defconfigs):
> 
> * just rearranging doesn't change anything wrt size(1)

At my place (ppc32) it does:

15069   crypto/aes.orig.ko
14973   crypto/aes.ko

14224   crypto/aes.orig.o
14152   crypto/aes.o

However, I guess the explanation was not quite right: having had a look
at the asm output, it looks to me like it's the D-Key who actually
benefits from a smaller offset.

> * just adding "unsigned" increases size of aes.o. In alpha case by 0x30
>   bytes.

That means Jeff Garzik is wrong, and the janitor's TODO list needs to
be changed? ;)
(Quote: "unsigned int" is preferred to "int", it generates better asm
code on all platforms except sh5.)

Cheers,
n.

--===============26291364964596209==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26291364964596209==--
