From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 28 Jan 2004 21:48:07 +0000
Subject: Re: [Kernel-janitors] Re: 2.6.2-rc2-mm1
Message-Id: <20040128134807.2355cfbc.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040128135649.1fa41132.grundig@teleline.es>
In-Reply-To: <20040128135649.1fa41132.grundig@teleline.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, 28 Jan 2004 13:56:49 +0100 Diego Calleja <grundig@teleline.es> wrot=
e:

| El Tue, 27 Jan 2004 23:34:02 -0800 Andrew Morton <akpm@osdl.org> escribi=
=F3:
|=20
| > - From now on, -mm kernels will contain the latest contents of:
| >=20
| > 	Linus's tree:		linus.patch
| > 	The ACPI tree:		acpi.patch
| > 	Vojtech's tree:		input.patch
| > 	Jeff's tree:		netdev.patch
| > 	The ALSA tree:		alsa.patch
| >=20
| >   If anyone has any more external trees which need similar treatment,
| >   please let me know.
|=20
| Perhaps the -kj should be there? Or it's already merged?

Randy.Dunlap wrote:
> About kernel-janitors patches:
>=20
> Do you want to continue reviewing/merging the KJ patches one by one
> or just grab the complete patchset?

and akpm wrote:
Please just send them to me in the usual manner when you think they're
ready.  The reject rate has been fairly high, so we need to go through them
carefully.


--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
