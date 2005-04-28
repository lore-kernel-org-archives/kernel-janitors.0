From: Kristen Accardi <kristen.c.accardi@intel.com>
Date: Thu, 28 Apr 2005 22:25:42 +0000
Subject: Re: [KJ][PATCH] removal of useless call to 'keepalive_time_when'
Message-Id: <1114727143.8673.32.camel@whizzy>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12059628565451819=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1114675589.27606.16.camel@hpi11340x.cselt.it>
In-Reply-To: <1114675589.27606.16.camel@hpi11340x.cselt.it>
To: kernel-janitors@vger.kernel.org

--===============12059628565451819==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2005-04-28 at 10:06 +0200, Paolo Abeni wrote:
> I have found a call to keepalive_time_when in net/ipv4/tcp_timer.c that
> looks like useless. The returned value is overwritten few lines of code
> below, without beeing used.

	Actually, if you look, the value that was returned to "elapsed" is
actually used if you take the goto to resched.  So, it's not useless.

kristen


> 
> cheers,
> 
> Paolo
> 
> 
> 
>  
> 
>  --
>  Email.it, the professional e-mail, gratis per te: http://www.email.it/f
>  
>  Sponsor:
>  Scopri il benessere che solo laloe vera regala al tuo corpo: cura la tua pelle
> * Con la vasta gamma di prodotti che ti offre Erboristeria.com
>  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2380&d=28-4
> _______________________________________________ Kernel-janitors mailing list Kernel-janitors@lists.osdl.org http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============12059628565451819==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12059628565451819==--
