From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 24 Jan 2005 15:01:35 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH 27/39] sound/gus_pcm: insert
Message-Id: <s5hk6q227n4.wl@alsa2.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87410646390073587=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87410646390073587==
Content-Type: text/plain; charset=US-ASCII

At Fri, 21 Jan 2005 11:36:36 -0800,
Nishanth Aravamudan wrote:
> 
> Hi,
> 
> Please consider applying.
> 
> Description: Insert set_current_state() before schedule_timeout(). Without the
> insertion, schedule_timeout() returns immediately.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

Thanks, applied to ALSA tree together with other patches.

Only the patches for vx_core.c and emu8000.c are slightly modified due
to the reason I posted.


Takashi

--===============87410646390073587==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87410646390073587==--
