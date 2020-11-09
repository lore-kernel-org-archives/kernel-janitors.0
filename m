From: Kurt Kanzenbach <kurt@linutronix.de>
Date: Mon, 09 Nov 2020 13:59:13 +0000
Subject: re: net: dsa: hellcreek: Add support for hardware timestamping
Message-Id: <87v9eer5qm.fsf@kurt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <7c4b526c-b229-acdf-d22a-2bf4a206be5b@canonical.com>
In-Reply-To: <7c4b526c-b229-acdf-d22a-2bf4a206be5b@canonical.com>
To: Colin Ian King <colin.king@canonical.com>, Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>, Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, ivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

--=-=-=
Content-Type: text/plain

Hi Colin,

On Mon Nov 09 2020, Colin Ian King wrote:
> Hi
>
> Static analysis on linux-next with Coverity has detected a potential
> null pointer dereference issue on the following commit:
>
> commit f0d4ba9eff75a79fccb7793f4d9f12303d458603
> Author: Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>
> Date:   Tue Nov 3 08:10:58 2020 +0100
>
>     net: dsa: hellcreek: Add support for hardware timestamping
>
> The analysis is as follows:
>
> 323                /* Get nanoseconds from ptp packet */
> 324                type = SKB_PTP_TYPE(skb);
>
>    4. returned_null: ptp_parse_header returns NULL (checked 10 out of 12
> times).
>    5. var_assigned: Assigning: hdr = NULL return value from
> ptp_parse_header.
>
> 325                hdr  = ptp_parse_header(skb, type);
>
>    Dereference null return value (NULL_RETURNS)
>    6. dereference: Dereferencing a pointer that might be NULL hdr when
> calling hellcreek_get_reserved_field.
>
> 326                ns   = hellcreek_get_reserved_field(hdr);
> 327                hellcreek_clear_reserved_field(hdr);
>
> This issue can only occur if the type & PTP_CLASS_PMASK is not one of
> PTP_CLASS_IPV4, PTP_CLASS_IPV6 or PTP_CLASS_L2.  I'm not sure if this is
> a possibility or not, but I'm assuming that it would be useful to
> perform the null check just in case, but I'm not sure how this affects
> the hw timestamping code in this function.

I don't see how the null pointer dereference could happen. That's the
Rx path you showed above.

The counter part code is:

hellcreek_port_rxtstamp:

	/* Make sure the message is a PTP message that needs to be timestamped
	 * and the interaction with the HW timestamping is enabled. If not, stop
	 * here
	 */
	hdr = hellcreek_should_tstamp(hellcreek, port, skb, type);
	if (!hdr)
		return false;

	SKB_PTP_TYPE(skb) = type;

Here the type is stored and hellcreek_should_tstamp() also calls
ptp_parse_header() internally. Only when ptp_parse_header() didn't
return NULL the first time the timestamping continues. It should be
safe.

Also the error handling would be interesting at that point. What should
happen if the header is null then? Returning an invalid timestamp?
Ignore it?

Hm. I think we have to make sure that it is a valid ptp packet before
reaching this code and that's what we've implemented. So, I guess it's
OK.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAl+pSzEACgkQeSpbgcuY
8KZ8EBAAm/4dgOrAeBt+h1tsagNnblF2Vida2GZ8a9QdSyx/VQGNY9Rhs8qWNmFL
tGUguEzb42oE4qwXO+d5j4KTbl2XyDY6d27/L2ysuq+dWVTPSTNfGimgtdeG8/42
/oShPfDf1pfNN4V9pxIWbcTCY+boqO2xN1JeCa4ukgDvKZ5jLRNfR5H1hjDA5LOY
sKADTTaRrEfXnmWcc8rYjEXhTqvEuun8ec4AGRRNSkhMqs61cdZH19dMTROrzKx1
IViapTg4Hm9OCe8yH3nlH2DJA4oLu8Vu8gWmjPlwM5KL9p5kjhjo/vaPTcjtYqbq
+aszNsBtVYwcnw4jkn/jbBoHljY1CwSYNY6hzrZ1cZnXksCnVULQoQf42XP0i8YB
oQjgwpWFDkdfW7vOkJIffONC6dJZzztiIW+iLek6/evh7pnflJ0QvZkaoNkdxb5g
DMKFNrbCP/bjTO0k7MLNkGRL9zESX4m5XohOyHpMN+qdA1qmqsJzMjRmZc0oJ6mE
WoRkHbO776rHFE0vXraga4GFCgWOMIpqGaqejqDeK4dj7/4pUIp6Jd8AYhPSIIxJ
cn9cbWGG1sA6vOclqP5vOSJ/mPsF7MYLcM67ocVgYDNKP0HXk/TFPC/Ov6UyG8sa
fUx4/jnq4lokp/bluVpEdFGSQ7SN1qbY7KP7l7EZoj1I9xXlwz0=
=wkcn
-----END PGP SIGNATURE-----
--=-=-=--
