From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 27 Jun 2005 13:47:52 +0000
Subject: Re: [KJ] empty file
Message-Id: <20050627134752.GB5844@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92782579536029708=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050626163654.GA4394@ngolde.de>
In-Reply-To: <20050626163654.GA4394@ngolde.de>
To: kernel-janitors@vger.kernel.org

--===============92782579536029708==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 27 Jun 2005, Nico Golde wrote:

> Hallo randy_dunlap,
> 
> * randy_dunlap <rdunlap@xenotime.net> [2005-06-27 12:45]:
> > On Sun, 26 Jun 2005 18:36:54 +0200 Nico Golde wrote:
> > 
> > | why is linux/drivers/cpufreq/proc_intf.c an empty file?
> > | Thanks Nico
> > | P.S. I am new on this list :)
> > 
> > what kernel version are you referring to?
> 
> the one i saw it was an 2.6.11.11
> regards nico

well that's pre git time and already old:
~/src/linux-2.6.git$ cat drivers/cpufreq/proc_intf.c
cat: drivers/cpufreq/proc_intf.c: No such file or directory

git has taken care of that!

please read the faq:
"What version should I be patching against?"
-> http://janitor.kernelnewbies.org/faq

--
maks


--===============92782579536029708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92782579536029708==--
