From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 28 Nov 2005 01:38:51 +0000
Subject: Re: [KJ] use kzalloc instead of kcalloc(1,
Message-Id: <20051128013851.GE9695@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53544453332301778=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <007001c5f392$4c61cda0$3ec0c756@bureau>
In-Reply-To: <007001c5f392$4c61cda0$3ec0c756@bureau>
To: kernel-janitors@vger.kernel.org

--===============53544453332301778==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28.11.2005 [04:41:54 +0300], Alexey Dobriyan wrote:
> On Sun, Nov 27, 2005 at 01:23:10PM -0800, Nishanth Aravamudan wrote:
> > On 27.11.2005 [21:36:51 +0100], Marion Jaillet wrote:
> > > Patch against linux-2.6.14.2
> >
> > Please patch against current mainline (e.g. 2.6.15-rc2)
> 
> True, but this particular occurence is already replaced. Also, kmalloc()
> error checking in this file is funny.

Yeah, I kinda hoped this was the case (without looking). Point being, we
can avoid unnecessary patches on the ML if all patches are against
current mainline when submitted.

Thanks,
Nish

--===============53544453332301778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53544453332301778==--
