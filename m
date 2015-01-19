From: Felipe Balbi <balbi@ti.com>
Date: Mon, 19 Jan 2015 16:09:44 +0000
Subject: Re: [patch 2/6] usb: gadget: uvc: cleanup __uvcg_fill_strm()
Message-Id: <20150119160943.GI20386@saruman>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xQR6quUbZ63TTuTU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210107.GB23203@mwanda>
In-Reply-To: <20150114210107.GB23203@mwanda>
To: kernel-janitors@vger.kernel.org

--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2015 at 01:44:44PM +0100, Andrzej Pietrasiewicz wrote:
> W dniu 16.01.2015 o 13:12, Dan Carpenter pisze:
> >Oh, yeah.  You're right.  I should have been more careful and I should
> >have seen that.  Sorry.  But the problem is the original code is still a
> >bit buggy.
> >
> >We call:
> >
> >	data =3D kzalloc();
> >
> >Inside __uvcg_fill_strm() we do "data +=3D something;"
> >
> >	kfree(data);
> >
> >We should save the orignal data pointer so that we can free it
> >correctly at the end in uvcg_streaming_class_allow_link().
> >
> Yeah, right. Thank you for spotting this. The kfree() is called
> only if __uvcg_fill_strm() fails, though. But of course this needs
> to be fixed.

so, should I wait for another version of $subject ?

--=20
balbi

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUvSxHAAoJEIaOsuA1yqREBx4P/2ey2n3lkOKiuCq3fS9PvNF4
DtKygJRKGEZ+7VgrAe8bJpUw7XpoQNedR61+S8NxAgHUBm8dtALxNCozPRwgav2S
/104KOAyx5aTgGA1QJJAjf2VQznvDcPYWRHTleko0H4aZocLf9dGUuDIEEfQ8Awy
pOghF0usBP/Fpwhs5N9QGKXYUqCmhk0tAcUxJ8Pq3ZHN5K60Yla7CyxiTJqsAzoo
W0NnHH/6UF7BWixfHRy64hq7Rzl2kJE3vc3F6aIhDQ4+KFQge7zRAZQz98O4MlGU
Ud8m06l303MSA1GB784tA0SQkm5I4ASAVQMp8qA/wLiV5GbPkzi+aScLze8V67yp
cELe/b0H+P4HCOQefGaf9fChH8IZod4me1NkUTFQ5WfCSrtCZK34HPyjw3BmePzt
R4MT2Hhu+MfLYxZZUFqnnPp2GR4jnnkZhY0JFq+ExIZUU9uLMeAGV9RrUV54NwGe
wk/2wtuzAvoeV+5VFN84XPC4+jyB8RqDqzU1XbXaA9VwRCVhpvCfdkCCAKKzcn/j
1ucVGY/Rge7nAcB5M75/auJ3i0bDKeWAdu2X7MeLQX4GjscSjhjiJeCuByoJcdEp
mf+4eugdvUsuvZjfGpb+j7V7vc6YD89VSc4ba+G0/eTNkRFbZzcq1epg6B0p2Zsy
Lbdp4/iTjVCOvtAdzVzG
=4MMP
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--
