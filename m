From: Wolfram Sang <wsa@the-dreams.de>
Date: Tue, 14 Jun 2016 12:42:04 +0000
Subject: Re: [patch 1/2] staging: ks7010: parsing bugs in ks_wlan_read_config_file()
Message-Id: <20160614124204.GB1608@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vGgW1X5XWziG23Ko"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160614111630.GA25457@mwanda>
In-Reply-To: <20160614111630.GA25457@mwanda>
To: kernel-janitors@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2016 at 02:16:30PM +0300, Dan Carpenter wrote:
> The check for the NUL terminator is wrong so it looks like this could
> read beyond the end of the buffer.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, however I have a patch very soon to be submitted which removes
the config.c file completely.


--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXX/ucAAoJEBQN5MwUoCm2jvsQAKmI4MV8WhpExCSEDA7htWHQ
0lPDJgX05nsP0izmRdFX+TPGyzLcK2sMc+dKxQbvRP1XC4506D3v9rV629Ldwlhz
doxscCqeExo6fZNSNtkQhhrADjogj+tH4/B7KQuXJQFn5GS+sGo2B6FowibJeSFj
dUzsM8bdqbonIqXFSBB/2NeNRS6BZIXa8pt3bIADBrFMClGpdexOeMK407Lt+PoU
p4YAg+HlXpeDf8jqvCoZKi7ce2Go+b1vxDYR9s5H+xZNhTVjb2zzLcDvzXe/zxGw
h1RNmqYWFuSSdhDbb7R8DvlFyS9kMEa9orFtVRxdKcNbCqsksrwoVZxUQM6AJA4S
NzJYwkGcWYRps/KRuT9AizWSkYP5GhWy0/q/P/Z0JhfdmonjiRvLS21+V3hJIAEP
+WrGxnr5aSE/nf0xl8Z56B62j8yIRjwXP4VCdPQTRpWXvlWXVHCQyq9NyW+Mni6B
fAiD7nMXcbSYoABMWG8ExUgsFueBqBwDKg2s3REUpCakcBLgV4C7Sx8t/c3bTPP/
/SBjSBUSfTBOZrl1MxqP3gLtRPpwCOMK8k0edKjuF5zSRFJDCcBLkNhEXd6B2L8w
S7Ft80s+R8qR1P67pf5G7M4lFBmQ1YMlAeiQQDNNgQuZPUXq8OS/1lLd2N5Epbfe
khimwoWOrhc59k7AmJRQ
=+k/9
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
