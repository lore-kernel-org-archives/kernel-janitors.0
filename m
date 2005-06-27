From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 27 Jun 2005 19:00:35 +0000
Subject: Re: [KJ] SET_MODULE_OWNER(dev)
Message-Id: <20050627190035.GB774@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92640418851449602=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200506271507.54410.victor@cetuc.puc-rio.br>
In-Reply-To: <200506271507.54410.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============92640418851449602==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 2005-06-27 at 17:07:54 +0200, Victor <victor@cetuc.puc-rio.br> wrote:
> Can anyone explain the reason for this line in
> linux-2.6.12/include/linux/netdevice.h:499:
> 	#define SET_MODULE_OWNER(dev) do { } while (0)

It is defined as:

#define SET_MODULE_OWNER(some_struct) do { (some_struct)->owner = THIS_MODULE; } while (0)

in include/linux/module.h for 2.4 kernels [1], so I guess it's there for
backwards compatibility.

Cheers, Tobias

[1] http://lxr.linux.no/source/include/linux/module.h?v=2.4.18#L409


--===============92640418851449602==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92640418851449602==--
