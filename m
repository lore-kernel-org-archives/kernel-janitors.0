From: David Laight <David.Laight@ACULAB.COM>
Date: Tue, 08 Apr 2014 09:34:09 +0000
Subject: RE: [patch] isdnloop: several buffer overflows
Message-Id: <063D6719AE5E284EB5DD2968C1650D6D0F6F14A1@AcuExch.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140408092309.GA26450@mwanda>
In-Reply-To: <20140408092309.GA26450@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Karsten Keil <isdn@linux-pingi.de>
Cc: "David S. Miller" <davem@davemloft.net>, YOSHIFUJI Hideaki / ???? <yoshfuji@linux-ipv6.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From: Dan Carpenter
> There are three buffer overflows addressed in this patch.
...
> 2) In isdnloop_parse_cmd(), p points to a 6 characters into a 60
> character buffer so we have 54 characters.  The ->eazlist[] is 11
> characters long.  I have modified the code to return if the source
> buffer is too long.
...
> @@ -903,6 +903,8 @@ isdnloop_parse_cmd(isdnloop_card *card)
>  	case 7:
>  		/* 0x;EAZ */
>  		p += 3;
> +		if (strlen(p) >= sizeof(card->eazlist[0]))
> +			break;
>  		strcpy(card->eazlist[ch - 1], p);
>  		break;
>  	case 8:

If you've done the strlen() you might as well use memcpy().
There are also functions that will do a bounded strlen(),
(eg memchr()).

	David



