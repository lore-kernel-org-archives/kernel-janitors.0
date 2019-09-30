From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 30 Sep 2019 06:02:53 +0000
Subject: Re: [PATCH] fs: affs: fix a memory leak in affs_remount
Message-Id: <ec7d3fdb-445b-7f4e-d6e6-77c6ae9a5732@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190930032200.30474-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190930032200.30474-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-fsdevel@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>, Deepa Dinamani <deepa.kernel@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>

* Please avoid typos in the commit message.

* I would prefer an other wording for the change description.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=97f9a3c4eee55b0178b518ae7114a6a53372913d#n151


> But this is not actually used later!

Can this information trigger the deletion of questionable source code
instead of adding a missing function call “kfree(new_opts)”?


How do you think about to add the tag “Fixes”?

Regards,
Markus
