From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 04 Feb 2005 15:33:04 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH 13/20] sound/gus_pcm: remove
Message-Id: <s5h4qgsz6fj.wl@alsa2.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68403783228769488=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68403783228769488==
Content-Type: text/plain; charset=US-ASCII

At Wed, 2 Feb 2005 11:50:13 -0800,
Nishanth Aravamudan wrote:
> 
> Hello,
> 
> Please consider applying.
> 
> Description: Replace deprecated interruptible_sleep_on_timeout() with
> wait_event_timeout(). Code is not identical, as the current sleeping system is 1
> jiffy at a time checking atomic_read()'s return every iteration. Patch is
> compile-tested.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Thanks, I applied this one.

The other fixes for sound/seq/* stuff are not applied.  Instead, I
modified the code to use wait_event*() properly.
Now all sleep_on*() are gone from ALSA tree.


Takashi

--===============68403783228769488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68403783228769488==--
