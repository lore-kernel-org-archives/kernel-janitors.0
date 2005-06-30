From: Domen Puncer <domen@coderock.org>
Date: Thu, 30 Jun 2005 15:50:44 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <20050630155044.GA16507@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30098472707195989=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============30098472707195989==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 30/06/05 15:56 +0200, Daniel Smertnig wrote:
> On Thu, Jun 30, 2005 at 03:48:45PM +0200, Domen Puncer wrote:
> > Ahh... I think I get your intent.
> > That should be  strcat(buf+ret, "\n"); , right?
> 
> Hmm, that would work to, but strcat() always appends to the end of the
> string anyway. But if buf+ret is clearer to you I can change it. Shall
> I?

Ah, dammit, that's what I was missing. Somehow I was reading "strcpy".

It's fine the way it is; sorry for the noise.

> 
> thanks,
> daniel

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============30098472707195989==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30098472707195989==--
