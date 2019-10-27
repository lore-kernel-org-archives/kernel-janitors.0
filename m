From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 27 Oct 2019 21:10:11 +0000
Subject: Re: [PATCH] ALSA: lx6464es: Fix memory leaks in snd_lx6464es_create
Message-Id: <626ec93d-02bf-32ee-e4ad-011e2768d8e3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191027192415.32743-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191027192415.32743-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, alsa-devel@alsa-project.org
Cc: Hariprasad Kelam <hariprasad.kelam@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Takashi Iwai <tiwai@suse.com>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Tim Blechmann <tim@klingt.org>, Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>

> In the implementation of snd_lx6464es_create() it there are memory leaks
> when error happens. Go to error path if any of these calls fail:

Please improve the wording for such a change description.

Regards,
Markus
