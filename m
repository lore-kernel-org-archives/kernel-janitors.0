From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 15 Aug 2004 18:21:45 +0000
Subject: [Kernel-janitors] Re: 2.6.8.1-kjt1
Message-Id: <20040815182145.GA29302@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74235527968279391=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040815170452.GA2578@masina.coderock.org>
In-Reply-To: <20040815170452.GA2578@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============74235527968279391==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 15 Aug 2004, Domen Puncer wrote:

> On 15/08/04 15:55 +0200, maximilian attems wrote:
> > msleep-drivers_net_slip.patch
> 
>   CC [M]  drivers/net/slip.o
>   drivers/net/slip.c: In function `slip_exit':
>   drivers/net/slip.c:1394: warning: implicit declaration of function `msleep'
> 
> 
> Added include, to fix this:

great thanks for the testing and quick fis, 
ill add that patch before sending to akpm.

a++ maks



--===============74235527968279391==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74235527968279391==--
