From: Godmar Back <godmar@gmail.com>
Date: Tue, 01 Feb 2005 23:09:51 +0000
Subject: Re: [KJ] question regarding global symbols & namespace.pl script
Message-Id: <719dced305020115092868918b@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9477650791229606=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <719dced3050201104324e53747@mail.gmail.com>
In-Reply-To: <719dced3050201104324e53747@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============9477650791229606==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

FWIW, I followed the advice and asked Matt Domsch on kernelnewbies and
he told me that the module namespaces are *not* intentionally
separated.

Rather, the fact that two modules sometimes define global symbols by
the same name is only an artifact of people testing their kernels in
module-only configurations only where it doesn't show up because
insmod hides unexported global symbols.

Apparently, an option "make allyesconfig" exists that will force all
modules to be compiled with 'y' so that these clashes become apparent.
Not allowing global name clashes is now the official policy of the
kernel maintainers.  I assume that's why namespace.pl was added in
2.6.9.

 - Godmar

--===============9477650791229606==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9477650791229606==--
