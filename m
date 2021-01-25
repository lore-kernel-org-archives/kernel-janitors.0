From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 25 Jan 2021 13:51:19 +0000
Subject: Re: [PATCH v2 1/2] ALSA: oxfw: remove an unnecessary condition in hwdep_read()
Message-Id: <s5him7l3z1k.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210122071354.GI20820@kadam>
	<YA6ntkBxT/4DJ4YK@mwanda>
In-Reply-To: <YA6ntkBxT/4DJ4YK@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

On Mon, 25 Jan 2021 12:12:54 +0100,
Dan Carpenter wrote:
> 
> Smatch complains that "count" isn't clamped properly and
> "oxfw->dev_lock_changed" is false then it leads to an information
> leak.  But it turns out that "oxfw->dev_lock_changed" is always
> set and the condition can be removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: this version just removes the condition

Applied now.  Thanks.


Takashi
