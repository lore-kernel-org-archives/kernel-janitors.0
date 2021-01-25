From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 25 Jan 2021 13:51:30 +0000
Subject: Re: [PATCH v2 2/2] ALSA: fireface: remove unnecessary condition in hwdep_read()
Message-Id: <s5hh7n53z19.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210122071354.GI20820@kadam>
	<YA6n6I8EcNAO5ZFs@mwanda>
In-Reply-To: <YA6n6I8EcNAO5ZFs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

On Mon, 25 Jan 2021 12:13:44 +0100,
Dan Carpenter wrote:
> 
> Smatch complains that "count" is not clamped when "ff->dev_lock_changed"
> and it leads to an information leak.  Fortunately, that's not actually
> possible and the condition can be deleted.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: just delet the condition

Applied now.  Thanks.


Takashi
