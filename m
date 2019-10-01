From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Tue, 01 Oct 2019 17:34:59 +0000
Subject: Re: [PATCH v2] fs: affs: fix a memory leak in affs_remount
Message-Id: <CAEkB2ERMqs=xbt4H-1ro0zAQryoQUH=N5iJop-CKbSOo_mTk3w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ec7d3fdb-445b-7f4e-d6e6-77c6ae9a5732@web.de> <20190930210114.6557-1-navid.emamdoost@gmail.com>
 <44ad775e-3b6f-4cbc-ba6f-455ff7191c58@web.de>
In-Reply-To: <44ad775e-3b6f-4cbc-ba6f-455ff7191c58@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-fsdevel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>, David Sterba <dsterba@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus, thanks for your suggestions for improving the quality of
the patch. At the moment I prefer first get a confirmation from
contributors about the leak and then work on any possible improvements
for the patch.

Thanks,
Navid.

On Tue, Oct 1, 2019 at 3:31 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > The allocated memory for new_opts is only released if pare_options fail.
>
> Can the following wording be nicer?
>
>   The allocated memory for the buffer “new_opts” will be released
>   only if a call of the function “parse_options” failed.
>
>
> > The release for new_opts is added.
>
> * How do you think about the change possibility to delete questionable
>   source code here?
>
> * Would you like to complete the data processing for corresponding options
>   any more?
>
>
> >       -- fix a type in title, …
>
> Please avoid typos also in your version comments.
>
>
> > ---
>
> I suggest to replace this second delimiter by a blank line.
>
> Regards,
> Markus



-- 
Navid.
