From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 09 Feb 2012 18:45:41 +0000
Subject: RE: [PATCH] sound/soc/mxs/mxs-saif.c: use devm_ functions
Message-Id: <alpine.DEB.2.02.1202091945150.1845@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328721262-20993-1-git-send-email-Julia.Lawall@lip6.fr>
	<7FE21149F4667147B645348EC60578850C1864@039-SN2MPN1-012.039d.mgd.msft.net>
In-Reply-To: <7FE21149F4667147B645348EC60578850C1864@039-SN2MPN1-012.039d.mgd.msft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dong Aisheng-B29396 <B29396@freescale.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Liam Girdwood <lrg@ti.com>

On Thu, 9 Feb 2012, Dong Aisheng-B29396 wrote:

>> -----Original Message-----
>> From: Julia Lawall [mailto:Julia.Lawall@lip6.fr]
>> Sent: Wednesday, February 08, 2012 9:14 AM
>> To: Liam Girdwood
>> Cc: kernel-janitors@vger.kernel.org; Mark Brown; Jaroslav Kysela; Takashi Iwai;
>> alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; Dong Aisheng-B29396
>> Subject: [PATCH] sound/soc/mxs/mxs-saif.c: use devm_ functions
>> Importance: High
>>
>> From: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> The various devm_ functions allocate memory that is released when a driver
>> detaches.  This patch uses these functions for data that is allocated in the
>> probe function of a platform device and is only freed in the remove function.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>>
>> ---
>> patch against git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>>
> I still failed to apply against for-3.4 branch.
> Can you switch to for-3.4 branch and then re-generate the patch based on it?

OK.

julia
