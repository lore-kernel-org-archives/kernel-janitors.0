From: Domen Puncer <domen@coderock.org>
Date: Sun, 25 Apr 2004 19:44:01 +0000
Subject: Re: [Kernel-janitors] [PATCH] - Replaces yield() with
Message-Id: <20040425194401.GD1394@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62980503547081224=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <407C9AEE.5020808@legolas.alternex.com.br>
In-Reply-To: <407C9AEE.5020808@legolas.alternex.com.br>
To: kernel-janitors@vger.kernel.org

--===============62980503547081224==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

...
> | >| --- drivers/cdrom/cdu31a.c.orig 2004-04-13 22:43:55.000000000 -0300
> | >| +++ drivers/cdrom/cdu31a.c      2004-04-13 22:44:17.000000000 -0300
> | >| @@ -386,7 +386,7 @@ static inline void sony_sleep(void)
> | >|         unsigned long flags;
> | >|                                                                                          
> | >| 
> | >|         if (cdu31a_irq <= 0) {
> | >| -               yield();
> | >| +               schedule_timeout(1);

set_current_state() missing.


	Domen

--===============62980503547081224==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62980503547081224==--
