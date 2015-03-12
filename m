From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2015 09:54:52 +0000
Subject: Re: [PATCH 2/3] Staging: dgnc: Use goto for error handling
Message-Id: <20150312095452.GZ10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150311140433.GA17051@sloth>
 <55006F4A.70805@gmail.com>
 <20150312092711.GX10964@mwanda>
 <55015D38.5060100@gmail.com>
In-Reply-To: <55015D38.5060100@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, devel@driverdev.osuosl.org, Lidza Louina <lidza.louina@gmail.com>, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, Mar 12, 2015 at 10:32:40AM +0100, Quentin Lambert wrote:
> Should I wait these several weeks to send the second version or should
> I send a second version fixing this issue a wait for someone to ask me
> to solve the conflict ?

Greg applies patches in the order they come.  It's normally straight
forward which ones are going to be merged and which ones are not.  So
you could just apply Giedrius's patch and put a note in the --- cut off
the it depends on the earlier patch.

If the patch doesn't apply, Greg won't take any time to figure out why.
You'll just get a note to redo it.

If you two plan on working on the same driver for a while then you could
coordinate your patches and send them as a patchset.

regards,
dan carpenter

