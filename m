From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jan 2004 15:28:33 +0000
Subject: Re: [Kernel-janitors]  New guy here,
Message-Id: <200401261628.34053.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sunday 25 January 2004 13:38, JOUANNE Mickael wrote:> I forget the patch=
 :)
As a side note, you should insert patches directly instead ofattaching them=
 for easier quoting.
> --- kj.pl=A0=A0=A0=A0=A0=A0=A02004-01-05 21:04:37.000000000 +0100> +++ kj=
-new.pl=A0=A0=A02004-01-25 11:38:08.000000000 +0100> @@ -109,7 +109,7 @@> =
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pri=
nt "$filename:$linenr:$line\n\n";> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0}> =A0> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ($line=3D=
~/MOD_{INC,DEC}_USE_COUNT/) {> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0if ($line=3D~/MOD_(INC|DEC)_USE_COUNT/) {> =A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0print "Net drivers should call=
 SET_MODULE_OWNER> instead of MOD_{INC,DEC}_USE_COUNT\n"; print "$filename:=
$linenr:$line\n\n";> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0}
You forgot to change the message as well. Note that SET_MODULE_OWNERhas bec=
ome pointless as well, so at least it should not be advocatedany more.
	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
