From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Thu, 29 Jul 2010 19:39:48 +0000
Subject: Re: [patch] nouveau: unwind on load errors
Message-Id: <20100729193948.GA4821@joi.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100729180231.GV26313@bicker>
In-Reply-To: <20100729180231.GV26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: nouveau@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Grant Likely <grant.likely@secretlab.ca>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>

On Thu, Jul 29, 2010 at 08:02:31PM +0200, Dan Carpenter wrote:
> nouveau_load() just returned directly if there was an error instead of
> releasing resources.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Patch looks good, but could you base it on top of nouveau tree? 

git://anongit.freedesktop.org/nouveau/linux-2.6

Marcin

