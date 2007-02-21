From: Stelian Pop <stelian@popies.net>
Date: Wed, 21 Feb 2007 20:37:02 +0000
Subject: Re: [KJ] [PATCH] is_power_of_2 in kernel/kfifo
Message-Id: <1172090222.6783.43.camel@voyager.dsnet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1172063918.6127.83.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1172063918.6127.83.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Le mercredi 21 f=E9vrier 2007 =E0 16:32 +0100, Richard Knutsson a =E9crit :
> Vignesh Babu BM wrote:
> > Replacing (n & (n-1)) in the context of power of 2 checks
> > with is_power_of_2
> >
> > Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
[...]
> > -	BUG_ON(size & (size - 1));
> > +	BUG_ON(!is_power_of_2(size));
[...]
> Could you also remove the comment? (since it is now obvious by the code)

Acked-by: Stelian Pop <stelian@popies.net>

Thanks,

--=20
Stelian Pop <stelian@popies.net>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
