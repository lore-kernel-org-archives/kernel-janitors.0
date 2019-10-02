From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 02 Oct 2019 05:09:39 +0000
Subject: Re: [v2] fs: affs: fix a memory leak in affs_remount
Message-Id: <98ab1248-dd45-6dbe-50d4-58529f46a4e6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ec7d3fdb-445b-7f4e-d6e6-77c6ae9a5732@web.de>
 <20190930210114.6557-1-navid.emamdoost@gmail.com>
 <44ad775e-3b6f-4cbc-ba6f-455ff7191c58@web.de>
 <CAEkB2ERMqs=xbt4H-1ro0zAQryoQUH=N5iJop-CKbSOo_mTk3w@mail.gmail.com>
In-Reply-To: <CAEkB2ERMqs=xbt4H-1ro0zAQryoQUH=N5iJop-CKbSOo_mTk3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, David Sterba <dsterba@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Hi Markus, thanks for your suggestions for improving the quality of
> the patch. At the moment I prefer first get a confirmation from
> contributors about the leak and then work on any possible improvements
> for the patch.

Please fix this patch as soon as possible if you care for the correctness
of the provided information.

Regards,
Markus
