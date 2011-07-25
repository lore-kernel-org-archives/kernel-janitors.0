From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 25 Jul 2011 10:54:29 +0000
Subject: Re: ac97: quiet make W=1 noise by initializing all fields of snd_ac97_codec_id_vendors and snd_ac97_
Message-Id: <s5hzkk2y6je.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <788178.91280.qm@smtp129.mail.ukl.yahoo.com>
In-Reply-To: <788178.91280.qm@smtp129.mail.ukl.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>, Kees Cook <kees.cook@canonical.com>

At Sun, 24 Jul 2011 11:40:56 +0200,
Lionel Debroux wrote:
> 
> make W=1 bitterly complains about missing initializations in
> snd_ac97_codec_id_vendors and snd_ac97_codec_ids.
> Initialize the last field, to make the output of make W=1 more readable.
> 
> Patch against current Linus tree.

If we change the whole table entries, it'd be better to use C99 style
init, e.g.

#define _CODEC(_id, _mask, _name) \
	.id = _id, .mask = _mask, .name = _name

static const struct ac97_codec_id snd_ac97_codec_id_vendors[] = {
{ _CODEC(0x41445300, 0xffffff00, "Analog Devices"),},
...

static const struct ac97_codec_id snd_ac97_codec_ids[] = {
{ _CODEC(0x41445303, 0xffffffff, "AD1819"), .patch = patch_ad1819 },
...
{ _CODEC(0x53494c20, 0xffffffe0, "Si3036,8"), .patch = mpatch_si3036, \
  .mpatch = mpatch_si3036, .flags = AC97_MODEM_PATCH },
...


thanks,

Takashi
