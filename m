From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 13 Oct 2017 13:15:52 +0000
Subject: Re: [PATCH] ALSA: hda - silence uninitialized variable warning in activate_amp_in()
Message-Id: <s5h8tgfnq7r.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171013105710.4cksv562jhk4zwwi@mwanda>
In-Reply-To: <20171013105710.4cksv562jhk4zwwi@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Hui Wang <hui.wang@canonical.com>

On Fri, 13 Oct 2017 12:57:10 +0200,
Dan Carpenter wrote:
> 
> If snd_hda_get_conn_list() fails then "conn" isn't initialized.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi
