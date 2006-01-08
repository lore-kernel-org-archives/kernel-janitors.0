From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Sun, 08 Jan 2006 23:41:21 +0000
Subject: Re: MODULE_VERSION useless? (was Re: [KJ] adding missing MODULE_*
Message-Id: <a01a16b50601081541n582fb3e2k2b7b7fb3494330e2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051230000400.GS18040@outflux.net>
	 <20060108204549.GB5864@mipter.zuzino.mipt.ru>
	 <200601081855.17723.carlos@embedded.cl>
In-Reply-To: <200601081855.17723.carlos@embedded.cl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

On 1/8/06, Carlos Manuel Duclos Vergara <carlos@embedded.cl> wrote:
> Hi everyone,
>
> I have two ideas about what to do with MODULE_VERSION:
> 1.- Defining MODULE_VERSION =3D KERNEL_VERSION
> 2.- Schedule it for removal in one or two more versions, and automagicall=
y use
> the KERNEL_VERSION as module's version.
>
> Any comments?

I think there is another option:

3. Always print KERNEL_VERSION in addition to MODULE_VERSION.

Since for some modules MODULE_VERSION is considered useful and
KERNEL_VERSION always is useful, this should give the best of both, right?

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
