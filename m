From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 13:51:44 +0000
Subject: Re: [KJ] [PATCH] kernel/power/disk.c string fix and if-less iterator
Message-Id: <20050526105144.0ca002cb.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38851919868668761=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050526004239.0f288228.rnsanchez@terra.com.br>
In-Reply-To: <20050526004239.0f288228.rnsanchez@terra.com.br>
To: kernel-janitors@vger.kernel.org

--===============38851919868668761==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Quoting  walter harms <wharms@bfs.de>
Sent on  Thu, 26 May 2005 10:32:19 +0200

Hello Walter,

> are you sure about
> 
> i = (i + 1) % (sizeof(p) - 1);
>                            ^^^^

p is defined as:

	char p[] = "-\\|/";

and the (sizeof(p) - 1) is meant to disconsider the string terminator, as
sizeof() returns 5, but the string has only 4 characters which will be
printed by the loop in this code.

> 
> asume sizeof(p)=4 then sizeof(p)-1 = 3 and 3 % 3 = 0 therefor 3 is never 
> reached.

That was my first thought, but as p is a string, there's the extra
character for '\0'.  And it shouldn't (nor wouldn't) be printed.

> to simplify the whole stuff   whats about
> 	printk("\b%c", p [ i++ % sizeof(p) ] );

instead:
	printk("\b%c", p [ i++ % (sizeof(p) - 1) ] );

> 
> ignoring the overflow for i is safe since the result is
> a) unsigned
> b) less then sizeof(p)

Agreed.

Should I recreate the patch and send again?

Regards.

-- 
Ricardo Nabinger Sanchez
GNU/Linux #140696 [http://counter.li.org]
Slackware Linux + FreeBSD

    How long a minute is depends on which 
    side of the bathroom door you're on.


--===============38851919868668761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38851919868668761==--
