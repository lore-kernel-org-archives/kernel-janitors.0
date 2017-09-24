From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 24 Sep 2017 07:06:12 +0000
Subject: Re: ALSA: bebob: Use common error handling code in snd_bebob_stream_start_duplex()
Message-Id: <3afecbef-b7ac-a4e8-f439-a351916f05e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85f95150-9cec-7a53-7692-837ba543e1ec@users.sourceforge.net>
 <541f0f9f-fc87-f65b-bbd8-fec5d45d5d2e@users.sourceforge.net>
 <a1dee732-f5c4-5b35-9f82-553fc8ce430d@sakamocchi.jp>
In-Reply-To: <a1dee732-f5c4-5b35-9f82-553fc8ce430d@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>

> 668     if (!amdtp_stream_wait_callback(&bebob->tx_stream,
> 669                                     CALLBACK_TIMEOUT)) {
> 670         amdtp_stream_stop(&bebob->tx_stream);
> 671         amdtp_stream_stop(&bebob->rx_stream);
> 672         break_both_connections(bebob);
> 673         err = -ETIMEDOUT;
> 674     }
> 675 }
> 
> I think it better to apply your solution too in the above to keep code consistency.

How do you think about to adjust this function implementation after the other two
update steps from the patch series would be integrated?


> For the other patches, I can find no merit to apply except for reduction
> of the number of characters included in the file.

Would you like to refer to any specific update suggestions for further clarification?

Regards,
Markus
