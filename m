From: Domen Puncer <domen@coderock.org>
Date: Fri, 23 Jul 2004 18:21:07 +0000
Subject: [Kernel-janitors] Re: eicon/s_4bri: replace schedule_timeout() with
Message-Id: <20040723182107.GC2467@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97995993164694395=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97995993164694395==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 23/07/04 10:46 -0700, Nishanth Aravamudan wrote:
...
> Description: Replace diva_os_sleep() with msleep().
...
> -	diva_os_wait (1) ;
> +	msleep (1) ;

But this is diva_os_wait, so replace it with mdelay.
Same goes for "eicon/s_bri" and "eicon/s_pri" patches.


	Domen

--===============97995993164694395==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97995993164694395==--
