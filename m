From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 04 Feb 2005 17:02:40 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH 13/20] sound/gus_pcm: remove
Message-Id: <20050204170240.GA2571@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============045683664431392046=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <s5h4qgsz6fj.wl@alsa2.suse.de>
In-Reply-To: <s5h4qgsz6fj.wl@alsa2.suse.de>
To: kernel-janitors@vger.kernel.org

--===============045683664431392046==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 04, 2005 at 04:33:04PM +0100, Takashi Iwai wrote:
> At Wed, 2 Feb 2005 11:50:13 -0800,
> Nishanth Aravamudan wrote:
> > 
> > Hello,
> > 
> > Please consider applying.
> > 
> > Description: Replace deprecated interruptible_sleep_on_timeout() with
> > wait_event_timeout(). Code is not identical, as the current sleeping system is 1
> > jiffy at a time checking atomic_read()'s return every iteration. Patch is
> > compile-tested.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> Thanks, I applied this one.
> 
> The other fixes for sound/seq/* stuff are not applied.  Instead, I
> modified the code to use wait_event*() properly.
> Now all sleep_on*() are gone from ALSA tree.

Great! Thanks for all your help, Takashi!

-Nish

--===============045683664431392046==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============045683664431392046==--
