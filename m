From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 12:50:21 +0000
Subject: Re: ASoC: da7218: Use common error handling code in da7218_of_to_pdata()
Message-Id: <badb0c28-818b-2c71-e4f2-088e6ca0fb6f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07c631e4-e2df-7ae2-ea31-9430c89dc8e3@users.sourceforge.net>
 <32a4c9e8-2030-c4e8-eb54-9ce6712ef0cd@users.sourceforge.net>
 <2E89032DDAA8B9408CB92943514A0337014C1B11E5@SW-EX-MBX01.diasemi.com>
In-Reply-To: <2E89032DDAA8B9408CB92943514A0337014C1B11E5@SW-EX-MBX01.diasemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, support.opensource@diasemi.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

>> Add a jump target so that a bit of exception handling can be better reus=
ed
>> in an if branch of this function.
=E2=80=A6
> Hmm. Doesn't really gain an awful lot this.

I show just another small change possibility.


> Would understand if there were multiple return paths,
> but in that case I'd have implemented something like this anyway.

Where?

Can the suggested software refactoring become useful also for this
function implementation?


> Also your patch description isn't really correct.

Which wording would you find more appropriate?


> You're re-using code from the sunny day scenario to handle an exception.

Can this detail be better?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
