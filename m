From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 04 Mar 2006 22:34:18 +0000
Subject: Re: [KJ] [Patch] kzalloc() conversion in sound/
Message-Id: <20060304223418.GE8332@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============044346991938533975=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141496369.26346.5.camel@alice>
In-Reply-To: <1141496369.26346.5.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============044346991938533975==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 04, 2006 at 07:19:28PM +0100, Eric Sesterhenn wrote:
> I believe there is a possible memory leak in sound/vx/vx_pcm.c
> when the kmalloc() for chip->playback_pipes is succesfull, and
> the one for chip->capture_pipes() fails, playback_pipes will
> not get free()d. ( Or the other way around ).

You're right. I've sent a fix to akpm. Ditto for chelsio.


--===============044346991938533975==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============044346991938533975==--
