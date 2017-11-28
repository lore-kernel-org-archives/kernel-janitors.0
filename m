From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 28 Nov 2017 06:49:10 +0000
Subject: Re: [PATCH 2/3] ALSA: hal2: Improve a size determination in hal2_create()
Message-Id: <s5hlgiqlwyh.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <118a96d5-c52a-fd22-23d5-28f20de7ff22@users.sourceforge.net>
 <a7583868-cf4b-015c-ce6a-810be4780aa8@users.sourceforge.net>
In-Reply-To: <a7583868-cf4b-015c-ce6a-810be4780aa8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>

On Sat, 11 Nov 2017 19:13:15 +0100,
SF Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 11 Nov 2017 18:34:04 +0100
> 
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks.


Takashi
