From: valdis.kletnieks@vt.edu
Date: Sat, 16 Jun 2018 19:22:07 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix line over 80 characters
Message-Id: <127735.1529176927@turing-police.cc.vt.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==_Exmh_1529176927_2593P"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1909265.MoDodiKBI3@os-virtualbox>
In-Reply-To: <1909265.MoDodiKBI3@os-virtualbox>
To: Hyunil Kim <thtlwlsmsgkfla@gmail.com>
Cc: gregkh@linuxfoundation.org, davem@davemloft.net, colin.king@canonical.com, johannes.berg@intel.com, Linyu.Yuan@alcatel-sbell.com.cn, keescook@chromium.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--==_Exmh_1529176927_2593P
Content-Type: text/plain; charset=us-ascii

On Sat, 16 Jun 2018 15:00:31 +0900, Hyunil Kim said:
> *fix checkpatch.pl warnings:
>  WARNING: line over 80 characters

> +		if (((ieee->wpa_ie[0] == 0xdd) &&
> +		    (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
> +		    ((ieee->wpa_ie[0] == 0x30) &&
> +		    (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))

Ouch. The && and || at ends of line mean a lot of parenthesis counting to
figure out which goes with which.  Use additional indentation to help
understanding.

+		if (((ieee->wpa_ie[0] == 0xdd) &&
+			(!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
+		    ((ieee->wpa_ie[0] == 0x30) &&
+			(!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))

Or perhaps

+		if (((ieee->wpa_ie[0] == 0xdd) &&
+			(!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4)))
+		     || ((ieee->wpa_ie[0] == 0x30) &&
+			(!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))




--==_Exmh_1529176927_2593P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.8.0 04/21/2017

iQEVAwUBWyVjX40DS38y7CIcAQLvQAf+OBGixusBCtq3aYv/IdQD8vBY1K6UAT/m
+UGkFJ/vG6ZBn6j1LcnCpw2ylMho4zGcsIOHNrBLok3P20NSQWcqEGOlXAsgA1Tq
ZZuEiHC7sViWcTYJ9pxwZj3bcXVLu9eU5ba2Q+OoHpB0Gvs3PpD6AW6PyJifFnl6
xEVbHwMS5A128WR/+yKmHfg3GW0z/Y+R0dglD9PMsxfvtnK+ntQ29ALvoRTOJdl6
xcueIXASGFX98rAdck5NR/uZyMeyXd8hRf85xyb6r017D7zLQ4K1I0rIV8fFw9hX
KjoKUlk+uOVidXxhG3IvNWET0Aom4rF5KGWgOJjZ35iQgxmT9yawag==
=ROkq
-----END PGP SIGNATURE-----

--==_Exmh_1529176927_2593P--
