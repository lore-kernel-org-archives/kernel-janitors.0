From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 09 Feb 2017 13:23:40 +0000
Subject: Re: [PATCH 2/3] m68k: Delete an unnecessary variable assignment in sys_cacheflush()
Message-Id: <CAMuHMdW8CGX9jgJS-_D030v-70fNH6J11Y0jAeYfwFB__ye=aQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net> <f33b64d8-5572-c8e5-f06d-bb84cfc4b8b5@users.sourceforge.net>
In-Reply-To: <f33b64d8-5572-c8e5-f06d-bb84cfc4b8b5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-m68k <linux-m68k@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Jan 18, 2017 at 5:49 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 17:07:52 +0100
>
> Delete an assignment for the local variable "ret" in an if branch
> because it was initialised by the same value.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Thanks, applied and queued for v4.11.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
