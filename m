From: Domen Puncer <domen@coderock.org>
Date: Wed, 16 Feb 2005 14:31:15 +0000
Subject: Re: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <20050216143115.GF18025@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84778580876625043=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============84778580876625043==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/02/05 14:25 +0100, Domen Puncer wrote:
> On 09/02/05 10:37 -0800, Ravinandan Arakali wrote:
> > -               schedule_timeout(MAX_SCHEDULE_TIMEOUT);
> > +               msleep(0xFFFFFFFF);
> 
> Was this code path tested too? It looks weird, as msleep _will_ sleep
> for almost a day.

That was a bad miscalculation... almost 50 days should be more right.


	Domen

--===============84778580876625043==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84778580876625043==--
