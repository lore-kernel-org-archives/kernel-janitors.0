From: Alan Cox <alan@linux.intel.com>
Date: Wed, 26 Sep 2012 16:50:35 +0000
Subject: Re: [samsung:v4l-next 51/121] drivers/media/usb/tlg2300/pd-alsa.c:309:3: error: implicit declaration
Message-Id: <20120926175035.0b11e7da@bob.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926160807.GD14447@localhost>
In-Reply-To: <20120926160807.GD14447@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> vim +309 drivers/media/usb/tlg2300/pd-alsa.c
>    303		ret = snd_card_create(-1, "Telegent",
> THIS_MODULE, 0, &card); 304		if (ret != 0)
>    305			return ret;
>    306	
>    307		ret = snd_pcm_new(card, "poseidon audio", 0, 0,
> 1, &pcm); 308		if (ret < 0) {
>  > 309			snd_free_card(card);

Umm I sent the version out then - should be snd_card_free(card) I
think !
