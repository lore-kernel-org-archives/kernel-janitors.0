From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 15 Jul 2019 06:40:30 +0000
Subject: Re: [2/2] ASoC: samsung: odroid: fix a double-free issue for cpu_dai
Message-Id: <23d82d8b-d600-b28f-9444-65afe04a781a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201907150949139435825@zte.com.cn>
In-Reply-To: <201907150949139435825@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wen Yang <wen.yang99@zte.com.cn>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Cc: Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Cheng Shengyu <cheng.shengyu@zte.com.cn>

> These two updates fix two different bugs.

I can follow this view to some degree.


> and the other is the double-free issue

This programming error affects also the use of data structures which became invalid.
https://cwe.mitre.org/data/definitions/415.html#oc_415_Notes


> So we sent two patches to fix them separately.

You would like to fix something according to two variables (of the data type “device_node *”)
in the same function implementation.
Please combine these corrections in an update step under a topic like
“ASoC: samsung: odroid: Fix handling of device node references in odroid_audio_probe()”.
(The previous update step would contain still a known programming mistake otherwise,
wouldn't it?)

Regards,
Markus
