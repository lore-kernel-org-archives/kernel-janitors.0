From: Daniel Smertnig <daniel.smertnig@gmail.com>
Date: Thu, 30 Jun 2005 13:56:08 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for non
Message-Id: <20050630135608.GA16818@dansme-mobile.smertnig>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71666687367387316=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============71666687367387316==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2005 at 03:48:45PM +0200, Domen Puncer wrote:
> Ahh... I think I get your intent.
> That should be  strcat(buf+ret, "\n"); , right?

Hmm, that would work to, but strcat() always appends to the end of the
string anyway. But if buf+ret is clearer to you I can change it. Shall
I?

thanks,
daniel

--===============71666687367387316==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71666687367387316==--
